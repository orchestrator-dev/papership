import 'package:flutter/material.dart';
import '../../../../data/remote/dto/tag_dto.dart';
class TagPickerSheet extends StatefulWidget {
  final List<TagDto> availableTags;
  final List<int> selectedTagIds;
  final Function(String) onCreateNew;

  const TagPickerSheet({
    super.key,
    required this.availableTags,
    required this.selectedTagIds,
    required this.onCreateNew,
  });

  @override
  State<TagPickerSheet> createState() => _TagPickerSheetState();
}

class _TagPickerSheetState extends State<TagPickerSheet> {
  late List<int> _selectedIds;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedIds = List.from(widget.selectedTagIds);
  }

  @override
  Widget build(BuildContext context) {
    final filteredTags = widget.availableTags
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
                const Text('Select Tags', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(_selectedIds),
                  child: const Text('Done'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search tags...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Create new tag'),
            onTap: () {
              _showCreateDialog(context);
            },
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTags.length,
              itemBuilder: (context, index) {
                final tag = filteredTags[index];
                final isSelected = _selectedIds.contains(tag.id);
                // Convert hex to color, fallback to grey
                Color tagColor = Colors.grey;
                if (tag.color.isNotEmpty) {
                  try {
                    String hex = tag.color.replaceAll('#', '');
                    if (hex.length == 6) {
                      hex = 'FF$hex';
                    }
                    tagColor = Color(int.parse(hex, radix: 16));
                  } catch (_) {}
                }

                return CheckboxListTile(
                  key: ValueKey('tag_tile_${tag.id}'),
                  title: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: tagColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(tag.name),
                    ],
                  ),
                  value: isSelected,
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        _selectedIds.add(tag.id);
                      } else {
                        _selectedIds.remove(tag.id);
                      }
                    });
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
        title: const Text('Create Tag'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Tag name'),
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
