import 'package:ape_match/models/user_model/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_data.freezed.dart';
part 'post_data.g.dart';

@freezed
class PostData with _$PostData {
  const factory PostData(
      {@TimestampConverter() required DateTime createdAt,
      required String message,
      required String uid,
      UserData? userData}) = _PostData;

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
        message: json["message"] as String,
        uid: json["uid"] as String);
  }

  @override
  Map<String, dynamic> toJson(PostData data) => data.toJson();

  DateTime dateFromTimestampValue(dynamic value) =>
      (value as Timestamp).toDate();
}
