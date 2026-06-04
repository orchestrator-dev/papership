import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_path_dto.freezed.dart';
part 'storage_path_dto.g.dart';

@freezed
abstract class StoragePathDto with _$StoragePathDto {
  const factory StoragePathDto({
    required int id,
    required String name,
    required String slug,
    required String path,
    required String match,
    @JsonKey(name: 'matching_algorithm') required int matchingAlgorithm,
    @JsonKey(name: 'is_insensitive') required bool isInsensitive,
  }) = _StoragePathDto;

  factory StoragePathDto.fromJson(Map<String, dynamic> json) => _$StoragePathDtoFromJson(json);
}
