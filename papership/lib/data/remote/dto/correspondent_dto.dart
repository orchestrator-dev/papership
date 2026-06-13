import 'package:freezed_annotation/freezed_annotation.dart';

part 'correspondent_dto.freezed.dart';
part 'correspondent_dto.g.dart';

@freezed
abstract class CorrespondentDto with _$CorrespondentDto {
  const factory CorrespondentDto({
    required int id,
    required String name,
    required String slug,
    required String match,
    @JsonKey(name: 'matching_algorithm') required int matchingAlgorithm,
    @JsonKey(name: 'is_insensitive') required bool isInsensitive,
    @JsonKey(name: 'last_correspondence') String? lastCorrespondence,
  }) = _CorrespondentDto;

  factory CorrespondentDto.fromJson(Map<String, dynamic> json) => _$CorrespondentDtoFromJson(json);
}
