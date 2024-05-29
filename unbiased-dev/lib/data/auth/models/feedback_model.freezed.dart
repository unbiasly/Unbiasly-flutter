// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedBackResponse _$FeedBackResponseFromJson(Map<String, dynamic> json) {
  return _FeedBackResponse.fromJson(json);
}

/// @nodoc
mixin _$FeedBackResponse {
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedBackResponseCopyWith<FeedBackResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedBackResponseCopyWith<$Res> {
  factory $FeedBackResponseCopyWith(
          FeedBackResponse value, $Res Function(FeedBackResponse) then) =
      _$FeedBackResponseCopyWithImpl<$Res, FeedBackResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "title") String? title,
      @JsonKey(name: "description") String? description});
}

/// @nodoc
class _$FeedBackResponseCopyWithImpl<$Res, $Val extends FeedBackResponse>
    implements $FeedBackResponseCopyWith<$Res> {
  _$FeedBackResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedBackResponseImplCopyWith<$Res>
    implements $FeedBackResponseCopyWith<$Res> {
  factory _$$FeedBackResponseImplCopyWith(_$FeedBackResponseImpl value,
          $Res Function(_$FeedBackResponseImpl) then) =
      __$$FeedBackResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "title") String? title,
      @JsonKey(name: "description") String? description});
}

/// @nodoc
class __$$FeedBackResponseImplCopyWithImpl<$Res>
    extends _$FeedBackResponseCopyWithImpl<$Res, _$FeedBackResponseImpl>
    implements _$$FeedBackResponseImplCopyWith<$Res> {
  __$$FeedBackResponseImplCopyWithImpl(_$FeedBackResponseImpl _value,
      $Res Function(_$FeedBackResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_$FeedBackResponseImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedBackResponseImpl implements _FeedBackResponse {
  const _$FeedBackResponseImpl(
      {@JsonKey(name: "title") this.title,
      @JsonKey(name: "description") this.description});

  factory _$FeedBackResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedBackResponseImplFromJson(json);

  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "description")
  final String? description;

  @override
  String toString() {
    return 'FeedBackResponse(title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedBackResponseImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedBackResponseImplCopyWith<_$FeedBackResponseImpl> get copyWith =>
      __$$FeedBackResponseImplCopyWithImpl<_$FeedBackResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedBackResponseImplToJson(
      this,
    );
  }
}

abstract class _FeedBackResponse implements FeedBackResponse {
  const factory _FeedBackResponse(
          {@JsonKey(name: "title") final String? title,
          @JsonKey(name: "description") final String? description}) =
      _$FeedBackResponseImpl;

  factory _FeedBackResponse.fromJson(Map<String, dynamic> json) =
      _$FeedBackResponseImpl.fromJson;

  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$FeedBackResponseImplCopyWith<_$FeedBackResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedBackRequest _$FeedBackRequestFromJson(Map<String, dynamic> json) {
  return _FeedBackRequest.fromJson(json);
}

/// @nodoc
mixin _$FeedBackRequest {
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedBackRequestCopyWith<FeedBackRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedBackRequestCopyWith<$Res> {
  factory $FeedBackRequestCopyWith(
          FeedBackRequest value, $Res Function(FeedBackRequest) then) =
      _$FeedBackRequestCopyWithImpl<$Res, FeedBackRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "title") String? title,
      @JsonKey(name: "description") String? description});
}

/// @nodoc
class _$FeedBackRequestCopyWithImpl<$Res, $Val extends FeedBackRequest>
    implements $FeedBackRequestCopyWith<$Res> {
  _$FeedBackRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedBackRequestImplCopyWith<$Res>
    implements $FeedBackRequestCopyWith<$Res> {
  factory _$$FeedBackRequestImplCopyWith(_$FeedBackRequestImpl value,
          $Res Function(_$FeedBackRequestImpl) then) =
      __$$FeedBackRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "title") String? title,
      @JsonKey(name: "description") String? description});
}

/// @nodoc
class __$$FeedBackRequestImplCopyWithImpl<$Res>
    extends _$FeedBackRequestCopyWithImpl<$Res, _$FeedBackRequestImpl>
    implements _$$FeedBackRequestImplCopyWith<$Res> {
  __$$FeedBackRequestImplCopyWithImpl(
      _$FeedBackRequestImpl _value, $Res Function(_$FeedBackRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_$FeedBackRequestImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedBackRequestImpl implements _FeedBackRequest {
  const _$FeedBackRequestImpl(
      {@JsonKey(name: "title") this.title,
      @JsonKey(name: "description") this.description});

  factory _$FeedBackRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedBackRequestImplFromJson(json);

  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "description")
  final String? description;

  @override
  String toString() {
    return 'FeedBackRequest(title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedBackRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedBackRequestImplCopyWith<_$FeedBackRequestImpl> get copyWith =>
      __$$FeedBackRequestImplCopyWithImpl<_$FeedBackRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedBackRequestImplToJson(
      this,
    );
  }
}

abstract class _FeedBackRequest implements FeedBackRequest {
  const factory _FeedBackRequest(
          {@JsonKey(name: "title") final String? title,
          @JsonKey(name: "description") final String? description}) =
      _$FeedBackRequestImpl;

  factory _FeedBackRequest.fromJson(Map<String, dynamic> json) =
      _$FeedBackRequestImpl.fromJson;

  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$FeedBackRequestImplCopyWith<_$FeedBackRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
