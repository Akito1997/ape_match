// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      userName: json['userName'] as String,
      uid: json['uid'] as String,
      bestRank: json['bestRank'] as String,
      likeCharacter: json['likeCharacter'] as String,
      likeWeapon: json['likeWeapon'] as String,
      playTime: json['playTime'] as String,
      muteList:
          (json['muteList'] as List<dynamic>).map((e) => e as String).toList(),
      selfIntroduction: json['selfIntroduction'] as String,
      userImageUrl: json['userImageUrl'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'userName': instance.userName,
      'uid': instance.uid,
      'bestRank': instance.bestRank,
      'likeCharacter': instance.likeCharacter,
      'likeWeapon': instance.likeWeapon,
      'playTime': instance.playTime,
      'muteList': instance.muteList,
      'selfIntroduction': instance.selfIntroduction,
      'userImageUrl': instance.userImageUrl,
      'gender': instance.gender,
    };
