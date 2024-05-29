// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_preference_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdatePreferenceRequest _$UpdatePreferenceRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdatePreferenceRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdatePreferenceRequest {
  @JsonKey(name: "article_category")
  List<String>? get articleCategory => throw _privateConstructorUsedError;
  @JsonKey(name: "source")
  List<String>? get source => throw _privateConstructorUsedError;
  @JsonKey(name: "language")
  String? get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdatePreferenceRequestCopyWith<UpdatePreferenceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePreferenceRequestCopyWith<$Res> {
  factory $UpdatePreferenceRequestCopyWith(UpdatePreferenceRequest value,
          $Res Function(UpdatePreferenceRequest) then) =
      _$UpdatePreferenceRequestCopyWithImpl<$Res, UpdatePreferenceRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "article_category") List<String>? articleCategory,
      @JsonKey(name: "source") List<String>? source,
      @JsonKey(name: "language") String? language});
}

/// @nodoc
class _$UpdatePreferenceRequestCopyWithImpl<$Res,
        $Val extends UpdatePreferenceRequest>
    implements $UpdatePreferenceRequestCopyWith<$Res> {
  _$UpdatePreferenceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleCategory = freezed,
    Object? source = freezed,
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      articleCategory: freezed == articleCategory
          ? _value.articleCategory
          : articleCategory // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePreferenceRequestImplCopyWith<$Res>
    implements $UpdatePreferenceRequestCopyWith<$Res> {
  factory _$$UpdatePreferenceRequestImplCopyWith(
          _$UpdatePreferenceRequestImpl value,
          $Res Function(_$UpdatePreferenceRequestImpl) then) =
      __$$UpdatePreferenceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "article_category") List<String>? articleCategory,
      @JsonKey(name: "source") List<String>? source,
      @JsonKey(name: "language") String? language});
}

/// @nodoc
class __$$UpdatePreferenceRequestImplCopyWithImpl<$Res>
    extends _$UpdatePreferenceRequestCopyWithImpl<$Res,
        _$UpdatePreferenceRequestImpl>
    implements _$$UpdatePreferenceRequestImplCopyWith<$Res> {
  __$$UpdatePreferenceRequestImplCopyWithImpl(
      _$UpdatePreferenceRequestImpl _value,
      $Res Function(_$UpdatePreferenceRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleCategory = freezed,
    Object? source = freezed,
    Object? language = freezed,
  }) {
    return _then(_$UpdatePreferenceRequestImpl(
      articleCategory: freezed == articleCategory
          ? _value._articleCategory
          : articleCategory // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      source: freezed == source
          ? _value._source
          : source // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePreferenceRequestImpl implements _UpdatePreferenceRequest {
  const _$UpdatePreferenceRequestImpl(
      {@JsonKey(name: "article_category") final List<String>? articleCategory,
      @JsonKey(name: "source") final List<String>? source,
      @JsonKey(name: "language") this.language})
      : _articleCategory = articleCategory,
        _source = source;

  factory _$UpdatePreferenceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePreferenceRequestImplFromJson(json);

  final List<String>? _articleCategory;
  @override
  @JsonKey(name: "article_category")
  List<String>? get articleCategory {
    final value = _articleCategory;
    if (value == null) return null;
    if (_articleCategory is EqualUnmodifiableListView) return _articleCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _source;
  @override
  @JsonKey(name: "source")
  List<String>? get source {
    final value = _source;
    if (value == null) return null;
    if (_source is EqualUnmodifiableListView) return _source;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "language")
  final String? language;

  @override
  String toString() {
    return 'UpdatePreferenceRequest(articleCategory: $articleCategory, source: $source, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePreferenceRequestImpl &&
            const DeepCollectionEquality()
                .equals(other._articleCategory, _articleCategory) &&
            const DeepCollectionEquality().equals(other._source, _source) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_articleCategory),
      const DeepCollectionEquality().hash(_source),
      language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePreferenceRequestImplCopyWith<_$UpdatePreferenceRequestImpl>
      get copyWith => __$$UpdatePreferenceRequestImplCopyWithImpl<
          _$UpdatePreferenceRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePreferenceRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdatePreferenceRequest implements UpdatePreferenceRequest {
  const factory _UpdatePreferenceRequest(
      {@JsonKey(name: "article_category") final List<String>? articleCategory,
      @JsonKey(name: "source") final List<String>? source,
      @JsonKey(name: "language")
      final String? language}) = _$UpdatePreferenceRequestImpl;

  factory _UpdatePreferenceRequest.fromJson(Map<String, dynamic> json) =
      _$UpdatePreferenceRequestImpl.fromJson;

  @override
  @JsonKey(name: "article_category")
  List<String>? get articleCategory;
  @override
  @JsonKey(name: "source")
  List<String>? get source;
  @override
  @JsonKey(name: "language")
  String? get language;
  @override
  @JsonKey(ignore: true)
  _$$UpdatePreferenceRequestImplCopyWith<_$UpdatePreferenceRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdatePreferenceResponse _$UpdatePreferenceResponseFromJson(
    Map<String, dynamic> json) {
  return _UpdatePreferenceResponse.fromJson(json);
}

/// @nodoc
mixin _$UpdatePreferenceResponse {
  @JsonKey(name: "article_category")
  List<String>? get articleCategory => throw _privateConstructorUsedError;
  @JsonKey(name: "article_tag")
  List<dynamic>? get articleTag => throw _privateConstructorUsedError;
  @JsonKey(name: "source")
  List<String>? get source => throw _privateConstructorUsedError;
  @JsonKey(name: "notification")
  bool? get notification => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "__v")
  int? get v => throw _privateConstructorUsedError;
  @JsonKey(name: "language")
  String? get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdatePreferenceResponseCopyWith<UpdatePreferenceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePreferenceResponseCopyWith<$Res> {
  factory $UpdatePreferenceResponseCopyWith(UpdatePreferenceResponse value,
          $Res Function(UpdatePreferenceResponse) then) =
      _$UpdatePreferenceResponseCopyWithImpl<$Res, UpdatePreferenceResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "article_category") List<String>? articleCategory,
      @JsonKey(name: "article_tag") List<dynamic>? articleTag,
      @JsonKey(name: "source") List<String>? source,
      @JsonKey(name: "notification") bool? notification,
      @JsonKey(name: "_id") String? id,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "__v") int? v,
      @JsonKey(name: "language") String? language});
}

/// @nodoc
class _$UpdatePreferenceResponseCopyWithImpl<$Res,
        $Val extends UpdatePreferenceResponse>
    implements $UpdatePreferenceResponseCopyWith<$Res> {
  _$UpdatePreferenceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleCategory = freezed,
    Object? articleTag = freezed,
    Object? source = freezed,
    Object? notification = freezed,
    Object? id = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      articleCategory: freezed == articleCategory
          ? _value.articleCategory
          : articleCategory // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      articleTag: freezed == articleTag
          ? _value.articleTag
          : articleTag // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notification: freezed == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePreferenceResponseImplCopyWith<$Res>
    implements $UpdatePreferenceResponseCopyWith<$Res> {
  factory _$$UpdatePreferenceResponseImplCopyWith(
          _$UpdatePreferenceResponseImpl value,
          $Res Function(_$UpdatePreferenceResponseImpl) then) =
      __$$UpdatePreferenceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "article_category") List<String>? articleCategory,
      @JsonKey(name: "article_tag") List<dynamic>? articleTag,
      @JsonKey(name: "source") List<String>? source,
      @JsonKey(name: "notification") bool? notification,
      @JsonKey(name: "_id") String? id,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "__v") int? v,
      @JsonKey(name: "language") String? language});
}

/// @nodoc
class __$$UpdatePreferenceResponseImplCopyWithImpl<$Res>
    extends _$UpdatePreferenceResponseCopyWithImpl<$Res,
        _$UpdatePreferenceResponseImpl>
    implements _$$UpdatePreferenceResponseImplCopyWith<$Res> {
  __$$UpdatePreferenceResponseImplCopyWithImpl(
      _$UpdatePreferenceResponseImpl _value,
      $Res Function(_$UpdatePreferenceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleCategory = freezed,
    Object? articleTag = freezed,
    Object? source = freezed,
    Object? notification = freezed,
    Object? id = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? language = freezed,
  }) {
    return _then(_$UpdatePreferenceResponseImpl(
      articleCategory: freezed == articleCategory
          ? _value._articleCategory
          : articleCategory // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      articleTag: freezed == articleTag
          ? _value._articleTag
          : articleTag // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      source: freezed == source
          ? _value._source
          : source // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notification: freezed == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePreferenceResponseImpl implements _UpdatePreferenceResponse {
  const _$UpdatePreferenceResponseImpl(
      {@JsonKey(name: "article_category") final List<String>? articleCategory,
      @JsonKey(name: "article_tag") final List<dynamic>? articleTag,
      @JsonKey(name: "source") final List<String>? source,
      @JsonKey(name: "notification") this.notification,
      @JsonKey(name: "_id") this.id,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt,
      @JsonKey(name: "__v") this.v,
      @JsonKey(name: "language") this.language})
      : _articleCategory = articleCategory,
        _articleTag = articleTag,
        _source = source;

  factory _$UpdatePreferenceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePreferenceResponseImplFromJson(json);

  final List<String>? _articleCategory;
  @override
  @JsonKey(name: "article_category")
  List<String>? get articleCategory {
    final value = _articleCategory;
    if (value == null) return null;
    if (_articleCategory is EqualUnmodifiableListView) return _articleCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _articleTag;
  @override
  @JsonKey(name: "article_tag")
  List<dynamic>? get articleTag {
    final value = _articleTag;
    if (value == null) return null;
    if (_articleTag is EqualUnmodifiableListView) return _articleTag;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _source;
  @override
  @JsonKey(name: "source")
  List<String>? get source {
    final value = _source;
    if (value == null) return null;
    if (_source is EqualUnmodifiableListView) return _source;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "notification")
  final bool? notification;
  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "user_id")
  final String? userId;
  @override
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "__v")
  final int? v;
  @override
  @JsonKey(name: "language")
  final String? language;

  @override
  String toString() {
    return 'UpdatePreferenceResponse(articleCategory: $articleCategory, articleTag: $articleTag, source: $source, notification: $notification, id: $id, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePreferenceResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._articleCategory, _articleCategory) &&
            const DeepCollectionEquality()
                .equals(other._articleTag, _articleTag) &&
            const DeepCollectionEquality().equals(other._source, _source) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_articleCategory),
      const DeepCollectionEquality().hash(_articleTag),
      const DeepCollectionEquality().hash(_source),
      notification,
      id,
      userId,
      createdAt,
      updatedAt,
      v,
      language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePreferenceResponseImplCopyWith<_$UpdatePreferenceResponseImpl>
      get copyWith => __$$UpdatePreferenceResponseImplCopyWithImpl<
          _$UpdatePreferenceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePreferenceResponseImplToJson(
      this,
    );
  }
}

abstract class _UpdatePreferenceResponse implements UpdatePreferenceResponse {
  const factory _UpdatePreferenceResponse(
      {@JsonKey(name: "article_category") final List<String>? articleCategory,
      @JsonKey(name: "article_tag") final List<dynamic>? articleTag,
      @JsonKey(name: "source") final List<String>? source,
      @JsonKey(name: "notification") final bool? notification,
      @JsonKey(name: "_id") final String? id,
      @JsonKey(name: "user_id") final String? userId,
      @JsonKey(name: "createdAt") final DateTime? createdAt,
      @JsonKey(name: "updatedAt") final DateTime? updatedAt,
      @JsonKey(name: "__v") final int? v,
      @JsonKey(name: "language")
      final String? language}) = _$UpdatePreferenceResponseImpl;

  factory _UpdatePreferenceResponse.fromJson(Map<String, dynamic> json) =
      _$UpdatePreferenceResponseImpl.fromJson;

  @override
  @JsonKey(name: "article_category")
  List<String>? get articleCategory;
  @override
  @JsonKey(name: "article_tag")
  List<dynamic>? get articleTag;
  @override
  @JsonKey(name: "source")
  List<String>? get source;
  @override
  @JsonKey(name: "notification")
  bool? get notification;
  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "user_id")
  String? get userId;
  @override
  @JsonKey(name: "createdAt")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "__v")
  int? get v;
  @override
  @JsonKey(name: "language")
  String? get language;
  @override
  @JsonKey(ignore: true)
  _$$UpdatePreferenceResponseImplCopyWith<_$UpdatePreferenceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
