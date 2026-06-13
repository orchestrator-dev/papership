import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

import '../bloc/upload_cubit.dart';
import '../bloc/upload_state.dart';
import '../../../../domain/usecases/upload_document_usecase.dart';
import 'widgets/tag_picker_sheet.dart';
import 'widgets/correspondent_picker_sheet.dart';
import 'widgets/document_type_picker_sheet.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:workmanager/workmanager.dart';
import '../models/pending_upload.dart';
import '../data/pending_upload_repository.dart';
import '../../../../injection_container.dart';

class UploadScreen extends StatefulWidget {
  final List<int> pdfBytes;

  const UploadScreen({super.key, required this.pdfBytes});

  @override
  State<UploadScreen> createState() => UploadScreenState();
}

class UploadScreenState extends State<UploadScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _asnController = TextEditingController();

  List<int> _selectedTagIds = [];
  int? _selectedCorrespondentId;
  int? _selectedDocumentTypeId;
  DateTime _createdDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    context.read<UploadCubit>().loadMetadata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Document')),
      body: BlocConsumer<UploadCubit, UploadState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(msg),
                  action: SnackBarAction(
                    label: 'Retry',
                    onPressed: _submit,
                  ),
                ),
              );
            },
            success: (taskId) {
              // Usually we might navigate to DocumentDetailScreen, but since we only have taskId,
              // we might navigate to a status screen or back.
              // Instruction: "navigate to DocumentDetailScreen" -> we might need to route there if we can,
              // but DocumentDetailScreen expects document id, not task id. We'll just pop or handle it gracefully.
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            idle: () => const Center(child: CircularProgressIndicator()),
            loadingMetadata: () => const Center(child: CircularProgressIndicator()),
            ready: (tags, correspondents, documentTypes) {
              return _buildForm(tags, correspondents, documentTypes);
            },
            uploading: (progress) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Uploading...', style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: LinearProgressIndicator(value: progress),
                    ),
                    const SizedBox(height: 8),
                    Text('${(progress * 100).toStringAsFixed(0)}%'),
                  ],
                ),
              );
            },
            success: (taskId) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.network(
                      'https://assets9.lottiefiles.com/packages/lf20_xwmj0hsk.json', // checkmark
                      width: 150,
                      height: 150,
                      repeat: false,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.check_circle, color: Colors.green, size: 100),
                    ),
                    const SizedBox(height: 16),
                    const Text('Upload Successful!', style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        // Instruction: "navigate to DocumentDetailScreen"
                        Navigator.of(context).pop();
                      },
                      child: const Text('View in Paperless'),
                    ),
                  ],
                ),
              );
            },
            error: (msg) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Error: $msg', style: const TextStyle(color: Colors.red)),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _submit,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildForm(List<dynamic> tags, List<dynamic> correspondents, List<dynamic> documentTypes) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Scanned Document', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 8),
                    Text('Size: ${(widget.pdfBytes.length / 1024).toStringAsFixed(2)} KB'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title', border: OutlineInputBorder()),
              validator: (val) => val == null || val.isEmpty ? 'Title is required' : null,
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () async {
                final result = await showModalBottomSheet<List<int>>(
                  context: context,
                  isScrollControlled: true,
                  builder: (ctx) => TagPickerSheet(
                    availableTags: tags.cast(),
                    selectedTagIds: _selectedTagIds,
                    onCreateNew: (name) => context.read<UploadCubit>().createTag(name),
                  ),
                );
                if (result != null) {
                  setState(() {
                    _selectedTagIds = result;
                  });
                }
              },
              child: InputDecorator(
                decoration: const InputDecoration(labelText: 'Tags', border: OutlineInputBorder()),
                child: Wrap(
                  spacing: 8,
                  children: _selectedTagIds.map((id) {
                    final t = tags.firstWhere((element) => element.id == id, orElse: () => null);
                    return Chip(label: Text(t?.name ?? 'Unknown'));
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () async {
                final result = await showModalBottomSheet<int>(
                  context: context,
                  isScrollControlled: true,
                  builder: (ctx) => CorrespondentPickerSheet(
                    availableCorrespondents: correspondents.cast(),
                    selectedId: _selectedCorrespondentId,
                    onCreateNew: (name) => context.read<UploadCubit>().createCorrespondent(name),
                  ),
                );
                if (result != null) {
                  setState(() {
                    _selectedCorrespondentId = result;
                  });
                }
              },
              child: InputDecorator(
                decoration: const InputDecoration(labelText: 'Correspondent', border: OutlineInputBorder()),
                child: Text(
                  _selectedCorrespondentId != null
                      ? correspondents.firstWhere((c) => c.id == _selectedCorrespondentId).name
                      : 'Select Correspondent',
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () async {
                final result = await showModalBottomSheet<int>(
                  context: context,
                  isScrollControlled: true,
                  builder: (ctx) => DocumentTypePickerSheet(
                    availableTypes: documentTypes.cast(),
                    selectedId: _selectedDocumentTypeId,
                    onCreateNew: (name) => context.read<UploadCubit>().createDocumentType(name),
                  ),
                );
                if (result != null) {
                  setState(() {
                    _selectedDocumentTypeId = result;
                  });
                }
              },
              child: InputDecorator(
                decoration: const InputDecoration(labelText: 'Document Type', border: OutlineInputBorder()),
                child: Text(
                  _selectedDocumentTypeId != null
                      ? documentTypes.firstWhere((dt) => dt.id == _selectedDocumentTypeId).name
                      : 'Select Document Type',
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _createdDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  setState(() {
                    _createdDate = date;
                  });
                }
              },
              child: InputDecorator(
                decoration: const InputDecoration(labelText: 'Date Created', border: OutlineInputBorder()),
                child: Text(DateFormat.yMMMd().format(_createdDate)),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _asnController,
              decoration: const InputDecoration(labelText: 'ASN (Archive Serial Number)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Upload Now'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: _uploadLater,
              child: const Text('Upload Later'),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final request = UploadRequest(
        pdfBytes: widget.pdfBytes,
        title: _titleController.text,
        tagIds: _selectedTagIds.isNotEmpty ? _selectedTagIds : null,
        correspondentId: _selectedCorrespondentId,
        documentTypeId: _selectedDocumentTypeId,
        createdDate: _createdDate,
        asn: _asnController.text.isNotEmpty ? _asnController.text : null,
      );
      context.read<UploadCubit>().uploadDocument(request);
    }
  }

  Future<void> _uploadLater() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final id = const Uuid().v4();
    final cacheDir = await getApplicationCacheDirectory();
    final file = File('${cacheDir.path}/$id.pdf');
    await file.writeAsBytes(widget.pdfBytes);

    final metadata = UploadMetadata(
      title: _titleController.text,
      tags: _selectedTagIds.isNotEmpty ? _selectedTagIds : null,
      correspondentId: _selectedCorrespondentId,
      documentTypeId: _selectedDocumentTypeId,
      createdDate: _createdDate.toIso8601String(),
      asn: _asnController.text.isNotEmpty ? _asnController.text : null,
    );

    final pendingUpload = PendingUpload(
      id: id,
      pdfPath: file.path,
      metadata: metadata,
      createdAt: DateTime.now(),
    );

    await sl<PendingUploadRepository>().savePendingUpload(pendingUpload);

    Workmanager().registerOneOffTask(
      "com.papership.upload_task",
      "com.papership.upload",
      constraints: Constraints(networkType: NetworkType.connected),
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Queued for upload')),
      );
      Navigator.pop(context);
    }
  }
}
