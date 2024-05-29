// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'actions_performed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActionPerformedResponse _$ActionPerformedResponseFromJson(
    Map<String, dynamic> json) {
  return _ActionPerformedResponse.fromJson(json);
}

/// @nodoc
mixin _$ActionPerformedResponse {
  @JsonKey(name: "is_liked")
  bool? get isLiked => throw _privateConstructorUsedError;
  @JsonKey(name: "is_disliked")
  bool? get isDisliked => throw _privateConstructorUsedError;
  @JsonKey(name: "is_bookmarked")
  bool? get isBookmarked => throw _privateConstructorUsedError;
  @JsonKey(name: "is_viewed")
  bool? get isViewed => throw _privateConstructorUsedError;
  @JsonKey(name: "is_shared")
  bool? get isShared => throw _privateConstructorUsedError;
  @JsonKey(name: "shared_count")
  int? get sharedCount => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "article_id")
  String? get articleId => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "__v")
  int? get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActionPerformedResponseCopyWith<ActionPerformedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionPerformedResponseCopyWith<$Res> {
  factory $ActionPerformedResponseCopyWith(ActionPerformedResponse value,
          $Res Function(ActionPerformedResponse) then) =
      _$ActionPerformedResponseCopyWithImpl<$Res, ActionPerformedResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "is_liked") bool? isLiked,
      @JsonKey(name: "is_disliked") bool? isDisliked,
      @JsonKey(name: "is_bookmarked") bool? isBookmarked,
      @JsonKey(name: "is_viewed") bool? isViewed,
      @JsonKey(name: "is_shared") bool? isShared,
      @JsonKey(name: "shared_count") int? sharedCount,
      @JsonKey(name: "_id") String? id,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "article_id") String? articleId,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "__v") int? v});
}

/// @nodoc
class _$ActionPerformedResponseCopyWithImpl<$Res,
        $Val extends ActionPerformedResponse>
    implements $ActionPerformedResponseCopyWith<$Res> {
  _$ActionPerformedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLiked = freezed,
    Object? isDisliked = freezed,
    Object? isBookmarked = freezed,
    Object? isViewed = freezed,
    Object? isShared = freezed,
    Object? sharedCount = freezed,
    Object? id = freezed,
    Object? userId = freezed,
    Object? articleId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(_value.copyWith(
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDisliked: freezed == isDisliked
          ? _value.isDisliked
          : isDisliked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isViewed: freezed == isViewed
          ? _value.isViewed
          : isViewed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isShared: freezed == isShared
          ? _value.isShared
          : isShared // ignore: cast_nullable_to_non_nullable
              as bool?,
      sharedCount: freezed == sharedCount
          ? _value.sharedCount
          : sharedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActionPerformedResponseImplCopyWith<$Res>
    implements $ActionPerformedResponseCopyWith<$Res> {
  factory _$$ActionPerformedResponseImplCopyWith(
          _$ActionPerformedResponseImpl value,
          $Res Function(_$ActionPerformedResponseImpl) then) =
      __$$ActionPerformedResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "is_liked") bool? isLiked,
      @JsonKey(name: "is_disliked") bool? isDisliked,
      @JsonKey(name: "is_bookmarked") bool? isBookmarked,
      @JsonKey(name: "is_viewed") bool? isViewed,
      @JsonKey(name: "is_shared") bool? isShared,
      @JsonKey(name: "shared_count") int? sharedCount,
      @JsonKey(name: "_id") String? id,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "article_id") String? articleId,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "__v") int? v});
}

/// @nodoc
class __$$ActionPerformedResponseImplCopyWithImpl<$Res>
    extends _$ActionPerformedResponseCopyWithImpl<$Res,
        _$ActionPerformedResponseImpl>
    implements _$$ActionPerformedResponseImplCopyWith<$Res> {
  __$$ActionPerformedResponseImplCopyWithImpl(
      _$ActionPerformedResponseImpl _value,
      $Res Function(_$ActionPerformedResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLiked = freezed,
    Object? isDisliked = freezed,
    Object? isBookmarked = freezed,
    Object? isViewed = freezed,
    Object? isShared = freezed,
    Object? sharedCount = freezed,
    Object? id = freezed,
    Object? userId = freezed,
    Object? articleId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(_$ActionPerformedResponseImpl(
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDisliked: freezed == isDisliked
          ? _value.isDisliked
          : isDisliked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isViewed: freezed == isViewed
          ? _value.isViewed
          : isViewed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isShared: freezed == isShared
          ? _value.isShared
          : isShared // ignore: cast_nullable_to_non_nullable
              as bool?,
      sharedCount: freezed == sharedCount
          ? _value.sharedCount
          : sharedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActionPerformedResponseImpl implements _ActionPerformedResponse {
  const _$ActionPerformedResponseImpl(
      {@JsonKey(name: "is_liked") this.isLiked,
      @JsonKey(name: "is_disliked") this.isDisliked,
      @JsonKey(name: "is_bookmarked") this.isBookmarked,
      @JsonKey(name: "is_viewed") this.isViewed,
      @JsonKey(name: "is_shared") this.isShared,
      @JsonKey(name: "shared_count") this.sharedCount,
      @JsonKey(name: "_id") this.id,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "article_id") this.articleId,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt,
      @JsonKey(name: "__v") this.v});

  factory _$ActionPerformedResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionPerformedResponseImplFromJson(json);

  @override
  @JsonKey(name: "is_liked")
  final bool? isLiked;
  @override
  @JsonKey(name: "is_disliked")
  final bool? isDisliked;
  @override
  @JsonKey(name: "is_bookmarked")
  final bool? isBookmarked;
  @override
  @JsonKey(name: "is_viewed")
  final bool? isViewed;
  @override
  @JsonKey(name: "is_shared")
  final bool? isShared;
  @override
  @JsonKey(name: "shared_count")
  final int? sharedCount;
  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "user_id")
  final String? userId;
  @override
  @JsonKey(name: "article_id")
  final String? articleId;
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
  String toString() {
    return 'ActionPerformedResponse(isLiked: $isLiked, isDisliked: $isDisliked, isBookmarked: $isBookmarked, isViewed: $isViewed, isShared: $isShared, sharedCount: $sharedCount, id: $id, userId: $userId, articleId: $articleId, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionPerformedResponseImpl &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isDisliked, isDisliked) ||
                other.isDisliked == isDisliked) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            (identical(other.isViewed, isViewed) ||
                other.isViewed == isViewed) &&
            (identical(other.isShared, isShared) ||
                other.isShared == isShared) &&
            (identical(other.sharedCount, sharedCount) ||
                other.sharedCount == sharedCount) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLiked,
      isDisliked,
      isBookmarked,
      isViewed,
      isShared,
      sharedCount,
      id,
      userId,
      articleId,
      createdAt,
      updatedAt,
      v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionPerformedResponseImplCopyWith<_$ActionPerformedResponseImpl>
      get copyWith => __$$ActionPerformedResponseImplCopyWithImpl<
          _$ActionPerformedResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionPerformedResponseImplToJson(
      this,
    );
  }
}

abstract class _ActionPerformedResponse implements ActionPerformedResponse {
  const factory _ActionPerformedResponse(
      {@JsonKey(name: "is_liked") final bool? isLiked,
      @JsonKey(name: "is_disliked") final bool? isDisliked,
      @JsonKey(name: "is_bookmarked") final bool? isBookmarked,
      @JsonKey(name: "is_viewed") final bool? isViewed,
      @JsonKey(name: "is_shared") final bool? isShared,
      @JsonKey(name: "shared_count") final int? sharedCount,
      @JsonKey(name: "_id") final String? id,
      @JsonKey(name: "user_id") final String? userId,
      @JsonKey(name: "article_id") final String? articleId,
      @JsonKey(name: "createdAt") final DateTime? createdAt,
      @JsonKey(name: "updatedAt") final DateTime? updatedAt,
      @JsonKey(name: "__v") final int? v}) = _$ActionPerformedResponseImpl;

  factory _ActionPerformedResponse.fromJson(Map<String, dynamic> json) =
      _$ActionPerformedResponseImpl.fromJson;

  @override
  @JsonKey(name: "is_liked")
  bool? get isLiked;
  @override
  @JsonKey(name: "is_disliked")
  bool? get isDisliked;
  @override
  @JsonKey(name: "is_bookmarked")
  bool? get isBookmarked;
  @override
  @JsonKey(name: "is_viewed")
  bool? get isViewed;
  @override
  @JsonKey(name: "is_shared")
  bool? get isShared;
  @override
  @JsonKey(name: "shared_count")
  int? get sharedCount;
  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "user_id")
  String? get userId;
  @override
  @JsonKey(name: "article_id")
  String? get articleId;
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
  @JsonKey(ignore: true)
  _$$ActionPerformedResponseImplCopyWith<_$ActionPerformedResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
