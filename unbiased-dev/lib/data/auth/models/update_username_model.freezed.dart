// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_username_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateUsernameRequest _$UpdateUsernameRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateUsernameRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateUsernameRequest {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateUsernameRequestCopyWith<UpdateUsernameRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUsernameRequestCopyWith<$Res> {
  factory $UpdateUsernameRequestCopyWith(UpdateUsernameRequest value,
          $Res Function(UpdateUsernameRequest) then) =
      _$UpdateUsernameRequestCopyWithImpl<$Res, UpdateUsernameRequest>;
  @useResult
  $Res call({@JsonKey(name: "name") String? name});
}

/// @nodoc
class _$UpdateUsernameRequestCopyWithImpl<$Res,
        $Val extends UpdateUsernameRequest>
    implements $UpdateUsernameRequestCopyWith<$Res> {
  _$UpdateUsernameRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateUsernameRequestImplCopyWith<$Res>
    implements $UpdateUsernameRequestCopyWith<$Res> {
  factory _$$UpdateUsernameRequestImplCopyWith(
          _$UpdateUsernameRequestImpl value,
          $Res Function(_$UpdateUsernameRequestImpl) then) =
      __$$UpdateUsernameRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "name") String? name});
}

/// @nodoc
class __$$UpdateUsernameRequestImplCopyWithImpl<$Res>
    extends _$UpdateUsernameRequestCopyWithImpl<$Res,
        _$UpdateUsernameRequestImpl>
    implements _$$UpdateUsernameRequestImplCopyWith<$Res> {
  __$$UpdateUsernameRequestImplCopyWithImpl(_$UpdateUsernameRequestImpl _value,
      $Res Function(_$UpdateUsernameRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$UpdateUsernameRequestImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateUsernameRequestImpl implements _UpdateUsernameRequest {
  const _$UpdateUsernameRequestImpl({@JsonKey(name: "name") this.name});

  factory _$UpdateUsernameRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateUsernameRequestImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;

  @override
  String toString() {
    return 'UpdateUsernameRequest(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUsernameRequestImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUsernameRequestImplCopyWith<_$UpdateUsernameRequestImpl>
      get copyWith => __$$UpdateUsernameRequestImplCopyWithImpl<
          _$UpdateUsernameRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUsernameRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateUsernameRequest implements UpdateUsernameRequest {
  const factory _UpdateUsernameRequest(
          {@JsonKey(name: "name") final String? name}) =
      _$UpdateUsernameRequestImpl;

  factory _UpdateUsernameRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateUsernameRequestImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$UpdateUsernameRequestImplCopyWith<_$UpdateUsernameRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateUsernameResponse _$UpdateUsernameResponseFromJson(
    Map<String, dynamic> json) {
  return _UpdateUsernameResponse.fromJson(json);
}

/// @nodoc
mixin _$UpdateUsernameResponse {
  @JsonKey(name: "success")
  bool? get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateUsernameResponseCopyWith<UpdateUsernameResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUsernameResponseCopyWith<$Res> {
  factory $UpdateUsernameResponseCopyWith(UpdateUsernameResponse value,
          $Res Function(UpdateUsernameResponse) then) =
      _$UpdateUsernameResponseCopyWithImpl<$Res, UpdateUsernameResponse>;
  @useResult
  $Res call({@JsonKey(name: "success") bool? success});
}

/// @nodoc
class _$UpdateUsernameResponseCopyWithImpl<$Res,
        $Val extends UpdateUsernameResponse>
    implements $UpdateUsernameResponseCopyWith<$Res> {
  _$UpdateUsernameResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateUsernameResponseImplCopyWith<$Res>
    implements $UpdateUsernameResponseCopyWith<$Res> {
  factory _$$UpdateUsernameResponseImplCopyWith(
          _$UpdateUsernameResponseImpl value,
          $Res Function(_$UpdateUsernameResponseImpl) then) =
      __$$UpdateUsernameResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "success") bool? success});
}

/// @nodoc
class __$$UpdateUsernameResponseImplCopyWithImpl<$Res>
    extends _$UpdateUsernameResponseCopyWithImpl<$Res,
        _$UpdateUsernameResponseImpl>
    implements _$$UpdateUsernameResponseImplCopyWith<$Res> {
  __$$UpdateUsernameResponseImplCopyWithImpl(
      _$UpdateUsernameResponseImpl _value,
      $Res Function(_$UpdateUsernameResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
  }) {
    return _then(_$UpdateUsernameResponseImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateUsernameResponseImpl implements _UpdateUsernameResponse {
  const _$UpdateUsernameResponseImpl({@JsonKey(name: "success") this.success});

  factory _$UpdateUsernameResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateUsernameResponseImplFromJson(json);

  @override
  @JsonKey(name: "success")
  final bool? success;

  @override
  String toString() {
    return 'UpdateUsernameResponse(success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUsernameResponseImpl &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUsernameResponseImplCopyWith<_$UpdateUsernameResponseImpl>
      get copyWith => __$$UpdateUsernameResponseImplCopyWithImpl<
          _$UpdateUsernameResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUsernameResponseImplToJson(
      this,
    );
  }
}

abstract class _UpdateUsernameResponse implements UpdateUsernameResponse {
  const factory _UpdateUsernameResponse(
          {@JsonKey(name: "success") final bool? success}) =
      _$UpdateUsernameResponseImpl;

  factory _UpdateUsernameResponse.fromJson(Map<String, dynamic> json) =
      _$UpdateUsernameResponseImpl.fromJson;

  @override
  @JsonKey(name: "success")
  bool? get success;
  @override
  @JsonKey(ignore: true)
  _$$UpdateUsernameResponseImplCopyWith<_$UpdateUsernameResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
