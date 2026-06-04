// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_view_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedViewDto _$SavedViewDtoFromJson(Map<String, dynamic> json) =>
    _SavedViewDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      showOnDashboard: json['show_on_dashboard'] as bool,
      showInSidebar: json['show_in_sidebar'] as bool,
      sortField: json['sort_field'] as String,
      sortReverse: json['sort_reverse'] as bool,
    );

Map<String, dynamic> _$SavedViewDtoToJson(_SavedViewDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'show_on_dashboard': instance.showOnDashboard,
      'show_in_sidebar': instance.showInSidebar,
      'sort_field': instance.sortField,
      'sort_reverse': instance.sortReverse,
    };
