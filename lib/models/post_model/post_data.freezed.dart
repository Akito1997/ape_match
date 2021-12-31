// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostData _$PostDataFromJson(Map<String, dynamic> json) {
  return _PostData.fromJson(json);
}

/// @nodoc
class _$PostDataTearOff {
  const _$PostDataTearOff();

  _PostData call(
      {@TimestampConverter() required DateTime createdAt,
      required String message,
      required String uid,
      UserData? userData}) {
    return _PostData(
      createdAt: createdAt,
      message: message,
      uid: uid,
      userData: userData,
    );
  }

  PostData fromJson(Map<String, Object?> json) {
    return PostData.fromJson(json);
  }
}

/// @nodoc
const $PostData = _$PostDataTearOff();

/// @nodoc
mixin _$PostData {
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  UserData? get userData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostDataCopyWith<PostData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDataCopyWith<$Res> {
  factory $PostDataCopyWith(PostData value, $Res Function(PostData) then) =
      _$PostDataCopyWithImpl<$Res>;
  $Res call(
      {@TimestampConverter() DateTime createdAt,
      String message,
      String uid,
      UserData? userData});

  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class _$PostDataCopyWithImpl<$Res> implements $PostDataCopyWith<$Res> {
  _$PostDataCopyWithImpl(this._value, this._then);

  final PostData _value;
  // ignore: unused_field
  final $Res Function(PostData) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? message = freezed,
    Object? uid = freezed,
    Object? userData = freezed,
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
      userData: userData == freezed
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ));
  }

  @override
  $UserDataCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value));
    });
  }
}

/// @nodoc
abstract class _$PostDataCopyWith<$Res> implements $PostDataCopyWith<$Res> {
  factory _$PostDataCopyWith(_PostData value, $Res Function(_PostData) then) =
      __$PostDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampConverter() DateTime createdAt,
      String message,
      String uid,
      UserData? userData});

  @override
  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class __$PostDataCopyWithImpl<$Res> extends _$PostDataCopyWithImpl<$Res>
    implements _$PostDataCopyWith<$Res> {
  __$PostDataCopyWithImpl(_PostData _value, $Res Function(_PostData) _then)
      : super(_value, (v) => _then(v as _PostData));

  @override
  _PostData get _value => super._value as _PostData;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? message = freezed,
    Object? uid = freezed,
    Object? userData = freezed,
  }) {
    return _then(_PostData(
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
      userData: userData == freezed
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostData implements _PostData {
  const _$_PostData(
      {@TimestampConverter() required this.createdAt,
      required this.message,
      required this.uid,
      this.userData});

  factory _$_PostData.fromJson(Map<String, dynamic> json) =>
      _$$_PostDataFromJson(json);

  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  final String message;
  @override
  final String uid;
  @override
  final UserData? userData;

  @override
  String toString() {
    return 'PostData(createdAt: $createdAt, message: $message, uid: $uid, userData: $userData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostData &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.userData, userData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(userData));

  @JsonKey(ignore: true)
  @override
  _$PostDataCopyWith<_PostData> get copyWith =>
      __$PostDataCopyWithImpl<_PostData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostDataToJson(this);
  }
}

abstract class _PostData implements PostData {
  const factory _PostData(
      {@TimestampConverter() required DateTime createdAt,
      required String message,
      required String uid,
      UserData? userData}) = _$_PostData;

  factory _PostData.fromJson(Map<String, dynamic> json) = _$_PostData.fromJson;

  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  String get message;
  @override
  String get uid;
  @override
  UserData? get userData;
  @override
  @JsonKey(ignore: true)
  _$PostDataCopyWith<_PostData> get copyWith =>
      throw _privateConstructorUsedError;
}
