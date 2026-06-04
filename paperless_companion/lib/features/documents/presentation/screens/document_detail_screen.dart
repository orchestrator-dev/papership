import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../../../../domain/models/document.dart';
import '../../../../data/remote/dto/document_dto.dart';
import '../bloc/document_detail_cubit.dart';
import '../bloc/document_detail_state.dart';

class DocumentDetailScreen extends StatefulWidget {
  final int documentId;

  const DocumentDetailScreen({super.key, required this.documentId});

  @override
  State<DocumentDetailScreen> createState() => _DocumentDetailScreenState();
}

class _DocumentDetailScreenState extends State<DocumentDetailScreen> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<DocumentDetailCubit>().loadDocument(widget.documentId);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _showEditMetadataBottomSheet(BuildContext context, Document document) {
    _titleController.text = document.title;
    // For simplicity in this step, we show a basic bottom sheet with title and ASN
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Edit Metadata', style: Theme.of(ctx).textTheme.titleLarge),
              const SizedBox(height: 16),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final dto = DocumentUpdateDto(title: _titleController.text);
                  context.read<DocumentDetailCubit>().saveDocument(document.id, dto);
                  Navigator.pop(ctx);
                },
                child: const Text('Save'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DocumentDetailCubit, DocumentDetailState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: state.maybeWhen(
              loaded: (doc, _) => GestureDetector(
                onTap: () => _showEditMetadataBottomSheet(context, doc),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(doc.title),
                    const SizedBox(width: 8),
                    const Icon(Icons.edit, size: 16),
                  ],
                ),
              ),
              editing: (doc) => const Text('Editing...'),
              orElse: () => const Text('Document Detail'),
            ),
          ),
          body: state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text('Error: $msg')),
            saving: (doc) => const Center(child: CircularProgressIndicator()),
            editing: (doc) => const Center(child: CircularProgressIndicator()),
            loaded: (doc, previewBytes) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (previewBytes != null && previewBytes.isNotEmpty)
                      SizedBox(
                        height: 300,
                        child: PDFView(
                          pdfData: previewBytes,
                          enableSwipe: true,
                          swipeHorizontal: true,
                          autoSpacing: false,
                          pageFling: true,
                        ),
                      )
                    else if (previewBytes != null && previewBytes.isEmpty)
                      Container(
                        height: 300,
                        color: Colors.grey[200],
                        child: const Center(child: Text('No preview available')),
                      )
                    else
                      Container(
                        height: 300,
                        color: Colors.grey[200],
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Created: ${doc.created}'),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            children: doc.tags.map((tag) {
                              return ActionChip(
                                label: Text('Tag $tag'),
                                onPressed: () {
                                  // Navigate to DocumentListScreen with tag filter
                                },
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 8),
                          Text('Correspondent: ${doc.correspondent ?? "None"}'),
                          const SizedBox(height: 8),
                          Text('Type: ${doc.documentType ?? "None"}'),
                          const SizedBox(height: 8),
                          Text('Storage: ${doc.storagePath ?? "None"}'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: state.maybeWhen(
            loaded: (doc, _) => BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit Metadata'),
                    onPressed: () => _showEditMetadataBottomSheet(context, doc),
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.download),
                    label: const Text('Download'),
                    onPressed: () {
                      context.read<DocumentDetailCubit>().downloadDocument(doc.id, doc.originalFileName);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Downloading...')),
                      );
                    },
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.share),
                    label: const Text('Share'),
                    onPressed: () {
                      context.read<DocumentDetailCubit>().shareDocument(doc.id, doc.originalFileName);
                    },
                  ),
                ],
              ),
            ),
            orElse: () => null,
          ),
        );
      },
    );
  }
}
