import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_dto.freezed.dart';
part 'user_profile_dto.g.dart';

@freezed
abstract class UserProfileDto with _$UserProfileDto {
  const factory UserProfileDto({
    required int id,
    required String username,
    String? email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'is_superuser') required bool isSuperuser,
  }) = _UserProfileDto;

  factory UserProfileDto.fromJson(Map<String, dynamic> json) => _$UserProfileDtoFromJson(json);
}
