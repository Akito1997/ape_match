import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_data.freezed.dart';
part 'message_data.g.dart';

@freezed
class MessageData with _$MessageData {
  const factory MessageData({
    @TimestampConverter() required DateTime createdAt,
    required String message,
    required String uid,
  }) = _MessageData;

  factory MessageData.fromJson(Map<String, dynamic> json) =>
      messageConverter.fromJson(json);

  static const messageConverter = MessageConverter();
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

class MessageConverter
    implements JsonConverter<MessageData, Map<String, dynamic>> {
  const MessageConverter();

  @override
  MessageData fromJson(Map<String, dynamic> json) {
    return _$_MessageData(
      createdAt: dateFromTimestampValue(json["createdAt"]),
      message: json["message"] as String,
      uid: json["uid"] as String,
    );
  }

  @override
  Map<String, dynamic> toJson(MessageData data) => data.toJson();

  DateTime dateFromTimestampValue(dynamic value) =>
      (value as Timestamp).toDate();
}
