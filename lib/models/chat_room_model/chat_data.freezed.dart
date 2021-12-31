// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatRoomData _$ChatRoomDataFromJson(Map<String, dynamic> json) {
  return _ChatRoomData.fromJson(json);
}

/// @nodoc
class _$ChatRoomDataTearOff {
  const _$ChatRoomDataTearOff();

  _ChatRoomData call(
      {@TimestampConverter() required DateTime createdAt,
      @TimestampConverter() required DateTime latestMessageCreatedAt,
      required List<String> members,
      required String documentId,
      UserData? partnerUser,
      required String latestMessage,
      required bool seeFlag,
      required String latestUid}) {
    return _ChatRoomData(
      createdAt: createdAt,
      latestMessageCreatedAt: latestMessageCreatedAt,
      members: members,
      documentId: documentId,
      partnerUser: partnerUser,
      latestMessage: latestMessage,
      seeFlag: seeFlag,
      latestUid: latestUid,
    );
  }

  ChatRoomData fromJson(Map<String, Object?> json) {
    return ChatRoomData.fromJson(json);
  }
}

/// @nodoc
const $ChatRoomData = _$ChatRoomDataTearOff();

/// @nodoc
mixin _$ChatRoomData {
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get latestMessageCreatedAt => throw _privateConstructorUsedError;
  List<String> get members => throw _privateConstructorUsedError;
  String get documentId => throw _privateConstructorUsedError;
  UserData? get partnerUser => throw _privateConstructorUsedError;
  String get latestMessage => throw _privateConstructorUsedError;
  bool get seeFlag => throw _privateConstructorUsedError;
  String get latestUid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomDataCopyWith<ChatRoomData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomDataCopyWith<$Res> {
  factory $ChatRoomDataCopyWith(
          ChatRoomData value, $Res Function(ChatRoomData) then) =
      _$ChatRoomDataCopyWithImpl<$Res>;
  $Res call(
      {@TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime latestMessageCreatedAt,
      List<String> members,
      String documentId,
      UserData? partnerUser,
      String latestMessage,
      bool seeFlag,
      String latestUid});

  $UserDataCopyWith<$Res>? get partnerUser;
}

/// @nodoc
class _$ChatRoomDataCopyWithImpl<$Res> implements $ChatRoomDataCopyWith<$Res> {
  _$ChatRoomDataCopyWithImpl(this._value, this._then);

  final ChatRoomData _value;
  // ignore: unused_field
  final $Res Function(ChatRoomData) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? latestMessageCreatedAt = freezed,
    Object? members = freezed,
    Object? documentId = freezed,
    Object? partnerUser = freezed,
    Object? latestMessage = freezed,
    Object? seeFlag = freezed,
    Object? latestUid = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      latestMessageCreatedAt: latestMessageCreatedAt == freezed
          ? _value.latestMessageCreatedAt
          : latestMessageCreatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      partnerUser: partnerUser == freezed
          ? _value.partnerUser
          : partnerUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
      latestMessage: latestMessage == freezed
          ? _value.latestMessage
          : latestMessage // ignore: cast_nullable_to_non_nullable
              as String,
      seeFlag: seeFlag == freezed
          ? _value.seeFlag
          : seeFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      latestUid: latestUid == freezed
          ? _value.latestUid
          : latestUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $UserDataCopyWith<$Res>? get partnerUser {
    if (_value.partnerUser == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.partnerUser!, (value) {
      return _then(_value.copyWith(partnerUser: value));
    });
  }
}

/// @nodoc
abstract class _$ChatRoomDataCopyWith<$Res>
    implements $ChatRoomDataCopyWith<$Res> {
  factory _$ChatRoomDataCopyWith(
          _ChatRoomData value, $Res Function(_ChatRoomData) then) =
      __$ChatRoomDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime latestMessageCreatedAt,
      List<String> members,
      String documentId,
      UserData? partnerUser,
      String latestMessage,
      bool seeFlag,
      String latestUid});

  @override
  $UserDataCopyWith<$Res>? get partnerUser;
}

/// @nodoc
class __$ChatRoomDataCopyWithImpl<$Res> extends _$ChatRoomDataCopyWithImpl<$Res>
    implements _$ChatRoomDataCopyWith<$Res> {
  __$ChatRoomDataCopyWithImpl(
      _ChatRoomData _value, $Res Function(_ChatRoomData) _then)
      : super(_value, (v) => _then(v as _ChatRoomData));

  @override
  _ChatRoomData get _value => super._value as _ChatRoomData;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? latestMessageCreatedAt = freezed,
    Object? members = freezed,
    Object? documentId = freezed,
    Object? partnerUser = freezed,
    Object? latestMessage = freezed,
    Object? seeFlag = freezed,
    Object? latestUid = freezed,
  }) {
    return _then(_ChatRoomData(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      latestMessageCreatedAt: latestMessageCreatedAt == freezed
          ? _value.latestMessageCreatedAt
          : latestMessageCreatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      partnerUser: partnerUser == freezed
          ? _value.partnerUser
          : partnerUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
      latestMessage: latestMessage == freezed
          ? _value.latestMessage
          : latestMessage // ignore: cast_nullable_to_non_nullable
              as String,
      seeFlag: seeFlag == freezed
          ? _value.seeFlag
          : seeFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      latestUid: latestUid == freezed
          ? _value.latestUid
          : latestUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatRoomData implements _ChatRoomData {
  const _$_ChatRoomData(
      {@TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.latestMessageCreatedAt,
      required this.members,
      required this.documentId,
      this.partnerUser,
      required this.latestMessage,
      required this.seeFlag,
      required this.latestUid});

  factory _$_ChatRoomData.fromJson(Map<String, dynamic> json) =>
      _$$_ChatRoomDataFromJson(json);

  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime latestMessageCreatedAt;
  @override
  final List<String> members;
  @override
  final String documentId;
  @override
  final UserData? partnerUser;
  @override
  final String latestMessage;
  @override
  final bool seeFlag;
  @override
  final String latestUid;

  @override
  String toString() {
    return 'ChatRoomData(createdAt: $createdAt, latestMessageCreatedAt: $latestMessageCreatedAt, members: $members, documentId: $documentId, partnerUser: $partnerUser, latestMessage: $latestMessage, seeFlag: $seeFlag, latestUid: $latestUid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatRoomData &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.latestMessageCreatedAt, latestMessageCreatedAt) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            const DeepCollectionEquality()
                .equals(other.documentId, documentId) &&
            const DeepCollectionEquality()
                .equals(other.partnerUser, partnerUser) &&
            const DeepCollectionEquality()
                .equals(other.latestMessage, latestMessage) &&
            const DeepCollectionEquality().equals(other.seeFlag, seeFlag) &&
            const DeepCollectionEquality().equals(other.latestUid, latestUid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(latestMessageCreatedAt),
      const DeepCollectionEquality().hash(members),
      const DeepCollectionEquality().hash(documentId),
      const DeepCollectionEquality().hash(partnerUser),
      const DeepCollectionEquality().hash(latestMessage),
      const DeepCollectionEquality().hash(seeFlag),
      const DeepCollectionEquality().hash(latestUid));

  @JsonKey(ignore: true)
  @override
  _$ChatRoomDataCopyWith<_ChatRoomData> get copyWith =>
      __$ChatRoomDataCopyWithImpl<_ChatRoomData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatRoomDataToJson(this);
  }
}

abstract class _ChatRoomData implements ChatRoomData {
  const factory _ChatRoomData(
      {@TimestampConverter() required DateTime createdAt,
      @TimestampConverter() required DateTime latestMessageCreatedAt,
      required List<String> members,
      required String documentId,
      UserData? partnerUser,
      required String latestMessage,
      required bool seeFlag,
      required String latestUid}) = _$_ChatRoomData;

  factory _ChatRoomData.fromJson(Map<String, dynamic> json) =
      _$_ChatRoomData.fromJson;

  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get latestMessageCreatedAt;
  @override
  List<String> get members;
  @override
  String get documentId;
  @override
  UserData? get partnerUser;
  @override
  String get latestMessage;
  @override
  bool get seeFlag;
  @override
  String get latestUid;
  @override
  @JsonKey(ignore: true)
  _$ChatRoomDataCopyWith<_ChatRoomData> get copyWith =>
      throw _privateConstructorUsedError;
}
