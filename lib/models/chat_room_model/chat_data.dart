import 'package:ape_match/models/user_model/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_data.freezed.dart';
part 'chat_data.g.dart';

@freezed
class ChatRoomData with _$ChatRoomData {
  const factory ChatRoomData({
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime latestMessageCreatedAt,
    required List<String> members,
    required String documentId,
    UserData? partnerUser,
    required String latestMessage,
    required bool seeFlag,
    required String latestUid,
  }) = _ChatRoomData;

  factory ChatRoomData.fromJson(Map<String, dynamic> json) =>
      chatRoomConverter.fromJson(json);

  static const chatRoomConverter = ChatRoomConverter();
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

class ChatRoomConverter
    implements JsonConverter<ChatRoomData, Map<String, dynamic>> {
  const ChatRoomConverter();

  @override
  ChatRoomData fromJson(Map<String, dynamic> json) {
    return _$_ChatRoomData(
      createdAt: dateFromTimestampValue(json["createdAt"]),
      members: json["members"].cast<String>() as List<String>,
      documentId: json['documentId'] as String,
      latestMessage: json["latestMessage"] as String,
      latestUid: json['latestUid'] as String,
      seeFlag: json["seeFlag"] as bool,
      latestMessageCreatedAt:
          dateFromTimestampValue(json["latestMessageCreatedAt"]),
    );
  }

  @override
  Map<String, dynamic> toJson(ChatRoomData data) => data.toJson();

  DateTime dateFromTimestampValue(dynamic value) =>
      (value as Timestamp).toDate();
}
