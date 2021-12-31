// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageData _$$_MessageDataFromJson(Map<String, dynamic> json) =>
    _$_MessageData(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      message: json['message'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$_MessageDataToJson(_$_MessageData instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'message': instance.message,
      'uid': instance.uid,
    };
