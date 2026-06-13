import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/scan_session_cubit.dart';
import '../models/scan_session.dart';

class ScanSessionScreen extends StatefulWidget {
  const ScanSessionScreen({super.key});

  @override
  State<ScanSessionScreen> createState() => _ScanSessionScreenState();
}

class _ScanSessionScreenState extends State<ScanSessionScreen> {
  bool _isReordering = false;
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<ScanSessionCubit>().state;
    _titleController.text = state.uploadTitle ?? 'New Scan';
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _showDeleteConfirmation(BuildContext context, String pageId) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              title: Text('Delete page?'),
              subtitle: Text('This action can be undone.'),
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Delete', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(ctx);
                context.read<ScanSessionCubit>().removePage(pageId);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Page deleted'),
                    duration: const Duration(seconds: 5),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        context.read<ScanSessionCubit>().undoRemove(pageId);
                      },
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.cancel),
              title: const Text('Cancel'),
              onTap: () => Navigator.pop(ctx),
            ),
          ],
        ),
      ),
    );
  }

  void _showAdjustmentsSheet(BuildContext context, ScannedPage page) {
    double brightness = page.brightnessAdjust ?? 0.0;
    double contrast = page.enhancedContrast ?? 1.0;

    showModalBottomSheet(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Adjustments', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                const Text('Brightness'),
                Slider(
                  value: brightness,
                  min: -1.0,
                  max: 1.0,
                  onChanged: (val) {
                    setState(() => brightness = val);
                    this.context.read<ScanSessionCubit>().updatePageAdjustments(page.id, brightness, contrast);
                  },
                ),
                const Text('Contrast'),
                Slider(
                  value: contrast,
                  min: 0.0,
                  max: 2.0,
                  onChanged: (val) {
                    setState(() => contrast = val);
                    this.context.read<ScanSessionCubit>().updatePageAdjustments(page.id, brightness, contrast);
                  },
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Done'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanSessionCubit, ScanSession>(
      builder: (context, state) {
        final activePages = state.pages.where((p) => !p.excluded).toList();
        final selectedPage = activePages.firstWhere(
          (p) => p.id == state.selectedPageId,
          orElse: () => activePages.isNotEmpty ? activePages.first : ScannedPage(id: '', source: ScannedPageSource.camera, imageBytes: Uint8List(0)),
        );
        final selectedIndex = activePages.isNotEmpty ? activePages.indexWhere((p) => p.id == selectedPage.id) : -1;

        return Scaffold(
          appBar: AppBar(
            title: TextField(
              controller: _titleController,
              decoration: const InputDecoration(border: InputBorder.none),
              onChanged: (val) => context.read<ScanSessionCubit>().setSessionTitle(val),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
          body: Column(
            children: [
              // Preview Area
              Expanded(
                child: activePages.isEmpty
                    ? const Center(child: Text('No pages yet.'))
                    : InteractiveViewer(
                        panEnabled: true,
                        minScale: 1.0,
                        maxScale: 4.0,
                        child: Center(
                          child: Transform.rotate(
                            angle: selectedPage.rotationDegrees * 3.1415926535897932 / 180,
                            child: ColorFiltered(
                              colorFilter: ColorFilter.matrix(_getMatrix(
                                selectedPage.brightnessAdjust ?? 0.0,
                                selectedPage.enhancedContrast ?? 1.0,
                              )),
                              child: selectedPage.imageBytes.isNotEmpty
                                  ? Image.memory(selectedPage.imageBytes)
                                  : const Placeholder(),
                            ),
                          ),
                        ),
                      ),
              ),
              // Page Nav
              if (activePages.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: selectedIndex > 0
                          ? () => context.read<ScanSessionCubit>().selectPage(activePages[selectedIndex - 1].id)
                          : null,
                    ),
                    Text('${selectedIndex + 1} / ${activePages.length}'),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: selectedIndex < activePages.length - 1
                          ? () => context.read<ScanSessionCubit>().selectPage(activePages[selectedIndex + 1].id)
                          : null,
                    ),
                  ],
                ),
              // Thumbnail strip
              SizedBox(
                height: 100,
                child: _isReordering
                    ? ReorderableListView(
                        scrollDirection: Axis.horizontal,
                        // ignore: deprecated_member_use
                        onReorder: (oldIndex, newIndex) {
                          context.read<ScanSessionCubit>().reorderPage(oldIndex, newIndex);
                        },
                        children: activePages.map((p) {
                          return _buildThumbnail(p, p.id == selectedPage.id, true);
                        }).toList(),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: activePages.length,
                        itemBuilder: (context, index) {
                          final p = activePages[index];
                          return GestureDetector(
                            onTap: () => context.read<ScanSessionCubit>().selectPage(p.id),
                            onLongPress: () {
                              setState(() {
                                _isReordering = true;
                              });
                            },
                            child: _buildThumbnail(p, p.id == selectedPage.id, false),
                          );
                        },
                      ),
              ),
              if (_isReordering)
                TextButton(
                  onPressed: () => setState(() => _isReordering = false),
                  child: const Text('Done Reordering'),
                ),
              if (!_isReordering && activePages.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.crop),
                      label: const Text('Crop'),
                      onPressed: () {
                        // Placeholder
                      },
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.rotate_right),
                      label: const Text('Rotate'),
                      onPressed: () {
                        context.read<ScanSessionCubit>().rotatePage(selectedPage.id, 90);
                      },
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.brightness_6),
                      label: const Text('Adj'),
                      onPressed: () => _showAdjustmentsSheet(context, selectedPage),
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                      onPressed: () => _showDeleteConfirmation(context, selectedPage.id),
                    ),
                  ],
                ),
              if (!_isReordering)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.camera_alt),
                          label: const Text('Camera'),
                          onPressed: () {
                            // Placeholder
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.scanner),
                          label: const Text('Network Scan'),
                          onPressed: () {
                            // Placeholder for Step 14
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              if (!_isReordering)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                    onPressed: () {},
                    child: Text('UPLOAD (${activePages.length} pages)'),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildThumbnail(ScannedPage page, bool isSelected, bool isReordering) {
    return Container(
      key: ValueKey(page.id),
      margin: const EdgeInsets.all(4.0),
      width: 70,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.transparent,
          width: 3,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Transform.rotate(
            angle: page.rotationDegrees * 3.1415926535897932 / 180,
            child: page.imageBytes.isNotEmpty
                ? Image.memory(page.imageBytes, fit: BoxFit.cover)
                : const Placeholder(),
          ),
          if (isReordering)
            const Center(
              child: Icon(Icons.drag_handle, color: Colors.white, size: 30),
            ),
        ],
      ),
    );
  }

  List<double> _getMatrix(double brightness, double contrast) {
    final t = brightness * 255.0;
    final c = contrast;
    return [
      c, 0, 0, 0, t,
      0, c, 0, 0, t,
      0, 0, c, 0, t,
      0, 0, 0, 1, 0,
    ];
  }
}
