// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatRoomData _$$_ChatRoomDataFromJson(Map<String, dynamic> json) =>
    _$_ChatRoomData(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      latestMessageCreatedAt: const TimestampConverter()
          .fromJson(json['latestMessageCreatedAt'] as Timestamp),
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
      documentId: json['documentId'] as String,
      partnerUser: json['partnerUser'] == null
          ? null
          : UserData.fromJson(json['partnerUser'] as Map<String, dynamic>),
      latestMessage: json['latestMessage'] as String,
      seeFlag: json['seeFlag'] as bool,
      latestUid: json['latestUid'] as String,
    );

Map<String, dynamic> _$$_ChatRoomDataToJson(_$_ChatRoomData instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'latestMessageCreatedAt':
          const TimestampConverter().toJson(instance.latestMessageCreatedAt),
      'members': instance.members,
      'documentId': instance.documentId,
      'partnerUser': instance.partnerUser,
      'latestMessage': instance.latestMessage,
      'seeFlag': instance.seeFlag,
      'latestUid': instance.latestUid,
    };
