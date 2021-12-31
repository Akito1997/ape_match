import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData(
      {@TimestampConverter() required DateTime createdAt,
      required String userName,
      required String uid,
      required String bestRank,
      required String likeCharacter,
      required String likeWeapon,
      required String playTime,
      required List<String> muteList,
      required String selfIntroduction,
      required String userImageUrl,
      required String gender}) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      userConverter.fromJson(json);

  static const userConverter = UserConverter();
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

class UserConverter implements JsonConverter<UserData, Map<String, dynamic>> {
  const UserConverter();

  @override
  UserData fromJson(Map<String, dynamic> json) {
    return _$_UserData(
        createdAt: dateFromTimestampValue(json["createdAt"]),
        userName: json['userName'] as String,
        uid: json["uid"] as String,
        bestRank: json["bestRank"] as String,
        likeCharacter: json["likeCharacter"] as String,
        muteList: json["muteList"].cast<String>() as List<String>,
        likeWeapon: json["likeWeapon"] as String,
        playTime: json["playTime"] as String,
        selfIntroduction: json["selfIntroduction"] as String,
        userImageUrl: json["userImageUrl"] as String,
        gender: json["gender"] as String);
  }

  @override
  Map<String, dynamic> toJson(UserData data) => data.toJson();

  DateTime dateFromTimestampValue(dynamic value) =>
      (value as Timestamp).toDate();
}
