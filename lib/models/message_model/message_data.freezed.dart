// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageData _$MessageDataFromJson(Map<String, dynamic> json) {
  return _MessageData.fromJson(json);
}

/// @nodoc
class _$MessageDataTearOff {
  const _$MessageDataTearOff();

  _MessageData call(
      {@TimestampConverter() required DateTime createdAt,
      required String message,
      required String uid}) {
    return _MessageData(
      createdAt: createdAt,
      message: message,
      uid: uid,
    );
  }

  MessageData fromJson(Map<String, Object?> json) {
    return MessageData.fromJson(json);
  }
}

/// @nodoc
const $MessageData = _$MessageDataTearOff();

/// @nodoc
mixin _$MessageData {
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageDataCopyWith<MessageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageDataCopyWith<$Res> {
  factory $MessageDataCopyWith(
          MessageData value, $Res Function(MessageData) then) =
      _$MessageDataCopyWithImpl<$Res>;
  $Res call(
      {@TimestampConverter() DateTime createdAt, String message, String uid});
}

/// @nodoc
class _$MessageDataCopyWithImpl<$Res> implements $MessageDataCopyWith<$Res> {
  _$MessageDataCopyWithImpl(this._value, this._then);

  final MessageData _value;
  // ignore: unused_field
  final $Res Function(MessageData) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? message = freezed,
    Object? uid = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MessageDataCopyWith<$Res>
    implements $MessageDataCopyWith<$Res> {
  factory _$MessageDataCopyWith(
          _MessageData value, $Res Function(_MessageData) then) =
      __$MessageDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampConverter() DateTime createdAt, String message, String uid});
}

/// @nodoc
class __$MessageDataCopyWithImpl<$Res> extends _$MessageDataCopyWithImpl<$Res>
    implements _$MessageDataCopyWith<$Res> {
  __$MessageDataCopyWithImpl(
      _MessageData _value, $Res Function(_MessageData) _then)
      : super(_value, (v) => _then(v as _MessageData));

  @override
  _MessageData get _value => super._value as _MessageData;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? message = freezed,
    Object? uid = freezed,
  }) {
    return _then(_MessageData(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageData implements _MessageData {
  const _$_MessageData(
      {@TimestampConverter() required this.createdAt,
      required this.message,
      required this.uid});

  factory _$_MessageData.fromJson(Map<String, dynamic> json) =>
      _$$_MessageDataFromJson(json);

  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  final String message;
  @override
  final String uid;

  @override
  String toString() {
    return 'MessageData(createdAt: $createdAt, message: $message, uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageData &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$MessageDataCopyWith<_MessageData> get copyWith =>
      __$MessageDataCopyWithImpl<_MessageData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageDataToJson(this);
  }
}

abstract class _MessageData implements MessageData {
  const factory _MessageData(
      {@TimestampConverter() required DateTime createdAt,
      required String message,
      required String uid}) = _$_MessageData;

  factory _MessageData.fromJson(Map<String, dynamic> json) =
      _$_MessageData.fromJson;

  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  String get message;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$MessageDataCopyWith<_MessageData> get copyWith =>
      throw _privateConstructorUsedError;
}
