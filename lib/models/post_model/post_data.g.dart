// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostData _$$_PostDataFromJson(Map<String, dynamic> json) => _$_PostData(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      message: json['message'] as String,
      uid: json['uid'] as String,
      userData: json['userData'] == null
          ? null
          : UserData.fromJson(json['userData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PostDataToJson(_$_PostData instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'message': instance.message,
      'uid': instance.uid,
      'userData': instance.userData,
    };
