import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:papership/data/remote/dto/tag_dto.dart';
import 'package:papership/features/upload/presentation/widgets/tag_picker_sheet.dart';

void main() {
  testWidgets('TagPickerSheet multi-select', (tester) async {
    final List<TagDto> tags = [
      const TagDto(id: 1, slug: 'tag-1', name: 'Tag 1', color: '#ff0000', textColor: '#ffffff', match: '', matchingAlgorithm: 1, isInboxTag: false, isInsensitive: false),
      const TagDto(id: 2, slug: 'tag-2', name: 'Tag 2', color: '#00ff00', textColor: '#ffffff', match: '', matchingAlgorithm: 1, isInboxTag: false, isInsensitive: false),
      const TagDto(id: 3, slug: 'tag-3', name: 'Tag 3', color: '#0000ff', textColor: '#ffffff', match: '', matchingAlgorithm: 1, isInboxTag: false, isInsensitive: false),
    ];
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          return ElevatedButton(
            onPressed: () async {
              await Navigator.of(context).push<List<int>>(
                MaterialPageRoute(
                  builder: (ctx) => Material(
                    child: TagPickerSheet(
                      availableTags: tags,
                      selectedTagIds: const [1],
                      onCreateNew: (name) {},
                    ),
                  ),
                ),
              );
            },
            child: const Text('Open'),
          );
        }),
      ),
    ));

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    // Toggle Checkboxes using ValueKey
    await tester.ensureVisible(find.byKey(const ValueKey('tag_tile_2')));
    await tester.tap(find.byKey(const ValueKey('tag_tile_2')));
    await tester.pump();

    await tester.ensureVisible(find.byKey(const ValueKey('tag_tile_3')));
    await tester.tap(find.byKey(const ValueKey('tag_tile_3')));
    await tester.pump();

    await tester.ensureVisible(find.byKey(const ValueKey('tag_tile_1')));
    await tester.tap(find.byKey(const ValueKey('tag_tile_1')));
    await tester.pump();

    // Verify Checkbox states
    final checkbox2 = tester.widget<Checkbox>(find.byType(Checkbox).at(1));
    final checkbox3 = tester.widget<Checkbox>(find.byType(Checkbox).at(2));
    final checkbox1 = tester.widget<Checkbox>(find.byType(Checkbox).at(0));

    expect(checkbox2.value, true);
    expect(checkbox3.value, true);
    expect(checkbox1.value, false);

    await tester.tap(find.widgetWithText(TextButton, 'Done'));
    await tester.pumpAndSettle();
  });
}
