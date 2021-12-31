import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_data.freezed.dart';
part 'chat_data.g.dart';

@freezed
class ChatData with _$ChatData {
  const factory ChatData(
      {@TimestampConverter() required DateTime createdAt,
      required String userName,
      required String bestRank,
      required String userImageUrl,
      required String message,
      required String uid,
      required String gender}) = _ChatData;

  factory PostData.fromJson(Map<String, dynamic> json) =>
      postConverter.fromJson(json);

  static const postConverter = PostConverter();
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

class PostConverter implements JsonConverter<PostData, Map<String, dynamic>> {
  const PostConverter();

  @override
  PostData fromJson(Map<String, dynamic> json) {
    return _$_PostData(
        createdAt: dateFromTimestampValue(json["createdAt"]),
        userName: json['userName'] as String,
        bestRank: json["bestRank"] as String,
        message: json["message"] as String,
        userImageUrl: json["userImageUrl"] as String,
        uid: json["uid"] as String,
        gender: json["gender"] as String);
  }

  @override
  Map<String, dynamic> toJson(PostData data) => data.toJson();

  DateTime dateFromTimestampValue(dynamic value) =>
      (value as Timestamp).toDate();
}
