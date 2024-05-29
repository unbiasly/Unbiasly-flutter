// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preference_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetUserPreferenceResponse _$GetUserPreferenceResponseFromJson(
    Map<String, dynamic> json) {
  return _GetUserPreferenceResponse.fromJson(json);
}

/// @nodoc
mixin _$GetUserPreferenceResponse {
  @JsonKey(name: "data")
  List<Datum>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUserPreferenceResponseCopyWith<GetUserPreferenceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserPreferenceResponseCopyWith<$Res> {
  factory $GetUserPreferenceResponseCopyWith(GetUserPreferenceResponse value,
          $Res Function(GetUserPreferenceResponse) then) =
      _$GetUserPreferenceResponseCopyWithImpl<$Res, GetUserPreferenceResponse>;
  @useResult
  $Res call({@JsonKey(name: "data") List<Datum>? data});
}

/// @nodoc
class _$GetUserPreferenceResponseCopyWithImpl<$Res,
        $Val extends GetUserPreferenceResponse>
    implements $GetUserPreferenceResponseCopyWith<$Res> {
  _$GetUserPreferenceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUserPreferenceResponseImplCopyWith<$Res>
    implements $GetUserPreferenceResponseCopyWith<$Res> {
  factory _$$GetUserPreferenceResponseImplCopyWith(
          _$GetUserPreferenceResponseImpl value,
          $Res Function(_$GetUserPreferenceResponseImpl) then) =
      __$$GetUserPreferenceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "data") List<Datum>? data});
}

/// @nodoc
class __$$GetUserPreferenceResponseImplCopyWithImpl<$Res>
    extends _$GetUserPreferenceResponseCopyWithImpl<$Res,
        _$GetUserPreferenceResponseImpl>
    implements _$$GetUserPreferenceResponseImplCopyWith<$Res> {
  __$$GetUserPreferenceResponseImplCopyWithImpl(
      _$GetUserPreferenceResponseImpl _value,
      $Res Function(_$GetUserPreferenceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$GetUserPreferenceResponseImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserPreferenceResponseImpl implements _GetUserPreferenceResponse {
  const _$GetUserPreferenceResponseImpl(
      {@JsonKey(name: "data") final List<Datum>? data})
      : _data = data;

  factory _$GetUserPreferenceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUserPreferenceResponseImplFromJson(json);

  final List<Datum>? _data;
  @override
  @JsonKey(name: "data")
  List<Datum>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetUserPreferenceResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserPreferenceResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserPreferenceResponseImplCopyWith<_$GetUserPreferenceResponseImpl>
      get copyWith => __$$GetUserPreferenceResponseImplCopyWithImpl<
          _$GetUserPreferenceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserPreferenceResponseImplToJson(
      this,
    );
  }
}

abstract class _GetUserPreferenceResponse implements GetUserPreferenceResponse {
  const factory _GetUserPreferenceResponse(
          {@JsonKey(name: "data") final List<Datum>? data}) =
      _$GetUserPreferenceResponseImpl;

  factory _GetUserPreferenceResponse.fromJson(Map<String, dynamic> json) =
      _$GetUserPreferenceResponseImpl.fromJson;

  @override
  @JsonKey(name: "data")
  List<Datum>? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetUserPreferenceResponseImplCopyWith<_$GetUserPreferenceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$Datum {
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
  @JsonKey(name: "language")
  String? get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatumCopyWith<Datum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumCopyWith<$Res> {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) then) =
      _$DatumCopyWithImpl<$Res, Datum>;
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
      @JsonKey(name: "language") String? language});
}

/// @nodoc
class _$DatumCopyWithImpl<$Res, $Val extends Datum>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._value, this._then);

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
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatumImplCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$$DatumImplCopyWith(
          _$DatumImpl value, $Res Function(_$DatumImpl) then) =
      __$$DatumImplCopyWithImpl<$Res>;
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
      @JsonKey(name: "language") String? language});
}

/// @nodoc
class __$$DatumImplCopyWithImpl<$Res>
    extends _$DatumCopyWithImpl<$Res, _$DatumImpl>
    implements _$$DatumImplCopyWith<$Res> {
  __$$DatumImplCopyWithImpl(
      _$DatumImpl _value, $Res Function(_$DatumImpl) _then)
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
    Object? language = freezed,
  }) {
    return _then(_$DatumImpl(
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
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatumImpl implements _Datum {
  const _$DatumImpl(
      {@JsonKey(name: "article_category") final List<String>? articleCategory,
      @JsonKey(name: "article_tag") final List<dynamic>? articleTag,
      @JsonKey(name: "source") final List<String>? source,
      @JsonKey(name: "notification") this.notification,
      @JsonKey(name: "_id") this.id,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt,
      @JsonKey(name: "language") this.language})
      : _articleCategory = articleCategory,
        _articleTag = articleTag,
        _source = source;

  factory _$DatumImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatumImplFromJson(json);

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
  @JsonKey(name: "language")
  final String? language;

  @override
  String toString() {
    return 'Datum(articleCategory: $articleCategory, articleTag: $articleTag, source: $source, notification: $notification, id: $id, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatumImpl &&
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
      language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      __$$DatumImplCopyWithImpl<_$DatumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatumImplToJson(
      this,
    );
  }
}

abstract class _Datum implements Datum {
  const factory _Datum(
      {@JsonKey(name: "article_category") final List<String>? articleCategory,
      @JsonKey(name: "article_tag") final List<dynamic>? articleTag,
      @JsonKey(name: "source") final List<String>? source,
      @JsonKey(name: "notification") final bool? notification,
      @JsonKey(name: "_id") final String? id,
      @JsonKey(name: "user_id") final String? userId,
      @JsonKey(name: "createdAt") final DateTime? createdAt,
      @JsonKey(name: "updatedAt") final DateTime? updatedAt,
      @JsonKey(name: "language") final String? language}) = _$DatumImpl;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$DatumImpl.fromJson;

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
  @JsonKey(name: "language")
  String? get language;
  @override
  @JsonKey(ignore: true)
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
