import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_view_dto.freezed.dart';
part 'saved_view_dto.g.dart';

@freezed
abstract class SavedViewDto with _$SavedViewDto {
  const factory SavedViewDto({
    required int id,
    required String name,
    @JsonKey(name: 'show_on_dashboard') required bool showOnDashboard,
    @JsonKey(name: 'show_in_sidebar') required bool showInSidebar,
    @JsonKey(name: 'sort_field') required String sortField,
    @JsonKey(name: 'sort_reverse') required bool sortReverse,
  }) = _SavedViewDto;

  factory SavedViewDto.fromJson(Map<String, dynamic> json) => _$SavedViewDtoFromJson(json);
}
