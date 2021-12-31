import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required DateTime createdAt,
    required String userName,
    required String bestRank,
    required String likeCharacter,
    required String likeWeapon,
    required String playTime,
    required String selfIntroduction,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
