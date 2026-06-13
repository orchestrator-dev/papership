import 'package:flutter/material.dart';
import '../../../../data/remote/dto/document_type_dto.dart';

class DocumentTypePickerSheet extends StatefulWidget {
  final List<DocumentTypeDto> availableTypes;
  final int? selectedId;
  final Function(String) onCreateNew;

  const DocumentTypePickerSheet({
    super.key,
    required this.availableTypes,
    this.selectedId,
    required this.onCreateNew,
  });

  @override
  State<DocumentTypePickerSheet> createState() => _DocumentTypePickerSheetState();
}

class _DocumentTypePickerSheetState extends State<DocumentTypePickerSheet> {
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final filtered = widget.availableTypes
        .where((t) => t.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Container(
      padding: const EdgeInsets.only(top: 16),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Select Document Type', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search document types...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Create new document type'),
            onTap: () {
              _showCreateDialog(context);
            },
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final docType = filtered[index];
                final isSelected = docType.id == widget.selectedId;
                return ListTile(
                  title: Text(docType.name),
                  trailing: isSelected ? const Icon(Icons.check, color: Colors.blue) : null,
                  onTap: () {
                    Navigator.of(context).pop(docType.id);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showCreateDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Document Type'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Document type name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                widget.onCreateNew(controller.text.trim());
                Navigator.pop(context);
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}
