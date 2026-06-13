import 'package:flutter/material.dart';
import '../../../../data/remote/dto/correspondent_dto.dart';

class CorrespondentPickerSheet extends StatefulWidget {
  final List<CorrespondentDto> availableCorrespondents;
  final int? selectedId;
  final Function(String) onCreateNew;

  const CorrespondentPickerSheet({
    super.key,
    required this.availableCorrespondents,
    this.selectedId,
    required this.onCreateNew,
  });

  @override
  State<CorrespondentPickerSheet> createState() => _CorrespondentPickerSheetState();
}

class _CorrespondentPickerSheetState extends State<CorrespondentPickerSheet> {
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final filtered = widget.availableCorrespondents
        .where((c) => c.name.toLowerCase().contains(_searchQuery.toLowerCase()))
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
                const Text('Select Correspondent', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                hintText: 'Search correspondents...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Create new correspondent'),
            onTap: () {
              _showCreateDialog(context);
            },
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final correspondent = filtered[index];
                final isSelected = correspondent.id == widget.selectedId;
                return ListTile(
                  title: Text(correspondent.name),
                  trailing: isSelected ? const Icon(Icons.check, color: Colors.blue) : null,
                  onTap: () {
                    Navigator.of(context).pop(correspondent.id);
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
        title: const Text('Create Correspondent'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Correspondent name'),
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
