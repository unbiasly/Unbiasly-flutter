// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_by_id_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArticleByIdResponse _$ArticleByIdResponseFromJson(Map<String, dynamic> json) {
  return _ArticleByIdResponse.fromJson(json);
}

/// @nodoc
mixin _$ArticleByIdResponse {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "article_id")
  String? get articleId => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "body")
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: "body_short")
  String? get bodyShort => throw _privateConstructorUsedError;
  @JsonKey(name: "thumbnail_url")
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "thumbnail_type")
  String? get thumbnailType => throw _privateConstructorUsedError;
  @JsonKey(name: "author_name")
  String? get authorName => throw _privateConstructorUsedError;
  @JsonKey(name: "link")
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: "date")
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: "likes")
  int? get likes => throw _privateConstructorUsedError;
  @JsonKey(name: "dislikes")
  int? get dislikes => throw _privateConstructorUsedError;
  @JsonKey(name: "views")
  int? get views => throw _privateConstructorUsedError;
  @JsonKey(name: "bookmarks")
  int? get bookmarks => throw _privateConstructorUsedError;
  @JsonKey(name: "share")
  int? get share => throw _privateConstructorUsedError;
  @JsonKey(name: "language")
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: "category")
  List<Category>? get category => throw _privateConstructorUsedError;
  @JsonKey(name: "tags")
  List<Category>? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: "source")
  Source? get source => throw _privateConstructorUsedError;
  @JsonKey(name: "is_deleted")
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "ownCategories")
  List<OwnCategory>? get ownCategories => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "__v")
  int? get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleByIdResponseCopyWith<ArticleByIdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleByIdResponseCopyWith<$Res> {
  factory $ArticleByIdResponseCopyWith(
          ArticleByIdResponse value, $Res Function(ArticleByIdResponse) then) =
      _$ArticleByIdResponseCopyWithImpl<$Res, ArticleByIdResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "article_id") String? articleId,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "body") String? body,
      @JsonKey(name: "body_short") String? bodyShort,
      @JsonKey(name: "thumbnail_url") String? thumbnailUrl,
      @JsonKey(name: "thumbnail_type") String? thumbnailType,
      @JsonKey(name: "author_name") String? authorName,
      @JsonKey(name: "link") String? link,
      @JsonKey(name: "date") DateTime? date,
      @JsonKey(name: "likes") int? likes,
      @JsonKey(name: "dislikes") int? dislikes,
      @JsonKey(name: "views") int? views,
      @JsonKey(name: "bookmarks") int? bookmarks,
      @JsonKey(name: "share") int? share,
      @JsonKey(name: "language") String? language,
      @JsonKey(name: "category") List<Category>? category,
      @JsonKey(name: "tags") List<Category>? tags,
      @JsonKey(name: "source") Source? source,
      @JsonKey(name: "is_deleted") bool? isDeleted,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "ownCategories") List<OwnCategory>? ownCategories,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "__v") int? v});

  $SourceCopyWith<$Res>? get source;
}

/// @nodoc
class _$ArticleByIdResponseCopyWithImpl<$Res, $Val extends ArticleByIdResponse>
    implements $ArticleByIdResponseCopyWith<$Res> {
  _$ArticleByIdResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? articleId = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? bodyShort = freezed,
    Object? thumbnailUrl = freezed,
    Object? thumbnailType = freezed,
    Object? authorName = freezed,
    Object? link = freezed,
    Object? date = freezed,
    Object? likes = freezed,
    Object? dislikes = freezed,
    Object? views = freezed,
    Object? bookmarks = freezed,
    Object? share = freezed,
    Object? language = freezed,
    Object? category = freezed,
    Object? tags = freezed,
    Object? source = freezed,
    Object? isDeleted = freezed,
    Object? status = freezed,
    Object? ownCategories = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyShort: freezed == bodyShort
          ? _value.bodyShort
          : bodyShort // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailType: freezed == thumbnailType
          ? _value.thumbnailType
          : thumbnailType // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      dislikes: freezed == dislikes
          ? _value.dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as int?,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      bookmarks: freezed == bookmarks
          ? _value.bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as int?,
      share: freezed == share
          ? _value.share
          : share // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      ownCategories: freezed == ownCategories
          ? _value.ownCategories
          : ownCategories // ignore: cast_nullable_to_non_nullable
              as List<OwnCategory>?,
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

  @override
  @pragma('vm:prefer-inline')
  $SourceCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $SourceCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArticleByIdResponseImplCopyWith<$Res>
    implements $ArticleByIdResponseCopyWith<$Res> {
  factory _$$ArticleByIdResponseImplCopyWith(_$ArticleByIdResponseImpl value,
          $Res Function(_$ArticleByIdResponseImpl) then) =
      __$$ArticleByIdResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "article_id") String? articleId,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "body") String? body,
      @JsonKey(name: "body_short") String? bodyShort,
      @JsonKey(name: "thumbnail_url") String? thumbnailUrl,
      @JsonKey(name: "thumbnail_type") String? thumbnailType,
      @JsonKey(name: "author_name") String? authorName,
      @JsonKey(name: "link") String? link,
      @JsonKey(name: "date") DateTime? date,
      @JsonKey(name: "likes") int? likes,
      @JsonKey(name: "dislikes") int? dislikes,
      @JsonKey(name: "views") int? views,
      @JsonKey(name: "bookmarks") int? bookmarks,
      @JsonKey(name: "share") int? share,
      @JsonKey(name: "language") String? language,
      @JsonKey(name: "category") List<Category>? category,
      @JsonKey(name: "tags") List<Category>? tags,
      @JsonKey(name: "source") Source? source,
      @JsonKey(name: "is_deleted") bool? isDeleted,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "ownCategories") List<OwnCategory>? ownCategories,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "__v") int? v});

  @override
  $SourceCopyWith<$Res>? get source;
}

/// @nodoc
class __$$ArticleByIdResponseImplCopyWithImpl<$Res>
    extends _$ArticleByIdResponseCopyWithImpl<$Res, _$ArticleByIdResponseImpl>
    implements _$$ArticleByIdResponseImplCopyWith<$Res> {
  __$$ArticleByIdResponseImplCopyWithImpl(_$ArticleByIdResponseImpl _value,
      $Res Function(_$ArticleByIdResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? articleId = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? bodyShort = freezed,
    Object? thumbnailUrl = freezed,
    Object? thumbnailType = freezed,
    Object? authorName = freezed,
    Object? link = freezed,
    Object? date = freezed,
    Object? likes = freezed,
    Object? dislikes = freezed,
    Object? views = freezed,
    Object? bookmarks = freezed,
    Object? share = freezed,
    Object? language = freezed,
    Object? category = freezed,
    Object? tags = freezed,
    Object? source = freezed,
    Object? isDeleted = freezed,
    Object? status = freezed,
    Object? ownCategories = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(_$ArticleByIdResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyShort: freezed == bodyShort
          ? _value.bodyShort
          : bodyShort // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailType: freezed == thumbnailType
          ? _value.thumbnailType
          : thumbnailType // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      dislikes: freezed == dislikes
          ? _value.dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as int?,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      bookmarks: freezed == bookmarks
          ? _value.bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as int?,
      share: freezed == share
          ? _value.share
          : share // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      ownCategories: freezed == ownCategories
          ? _value._ownCategories
          : ownCategories // ignore: cast_nullable_to_non_nullable
              as List<OwnCategory>?,
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
class _$ArticleByIdResponseImpl implements _ArticleByIdResponse {
  const _$ArticleByIdResponseImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "article_id") this.articleId,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "body") this.body,
      @JsonKey(name: "body_short") this.bodyShort,
      @JsonKey(name: "thumbnail_url") this.thumbnailUrl,
      @JsonKey(name: "thumbnail_type") this.thumbnailType,
      @JsonKey(name: "author_name") this.authorName,
      @JsonKey(name: "link") this.link,
      @JsonKey(name: "date") this.date,
      @JsonKey(name: "likes") this.likes,
      @JsonKey(name: "dislikes") this.dislikes,
      @JsonKey(name: "views") this.views,
      @JsonKey(name: "bookmarks") this.bookmarks,
      @JsonKey(name: "share") this.share,
      @JsonKey(name: "language") this.language,
      @JsonKey(name: "category") final List<Category>? category,
      @JsonKey(name: "tags") final List<Category>? tags,
      @JsonKey(name: "source") this.source,
      @JsonKey(name: "is_deleted") this.isDeleted,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "ownCategories") final List<OwnCategory>? ownCategories,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt,
      @JsonKey(name: "__v") this.v})
      : _category = category,
        _tags = tags,
        _ownCategories = ownCategories;

  factory _$ArticleByIdResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleByIdResponseImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "article_id")
  final String? articleId;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "body")
  final String? body;
  @override
  @JsonKey(name: "body_short")
  final String? bodyShort;
  @override
  @JsonKey(name: "thumbnail_url")
  final String? thumbnailUrl;
  @override
  @JsonKey(name: "thumbnail_type")
  final String? thumbnailType;
  @override
  @JsonKey(name: "author_name")
  final String? authorName;
  @override
  @JsonKey(name: "link")
  final String? link;
  @override
  @JsonKey(name: "date")
  final DateTime? date;
  @override
  @JsonKey(name: "likes")
  final int? likes;
  @override
  @JsonKey(name: "dislikes")
  final int? dislikes;
  @override
  @JsonKey(name: "views")
  final int? views;
  @override
  @JsonKey(name: "bookmarks")
  final int? bookmarks;
  @override
  @JsonKey(name: "share")
  final int? share;
  @override
  @JsonKey(name: "language")
  final String? language;
  final List<Category>? _category;
  @override
  @JsonKey(name: "category")
  List<Category>? get category {
    final value = _category;
    if (value == null) return null;
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Category>? _tags;
  @override
  @JsonKey(name: "tags")
  List<Category>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "source")
  final Source? source;
  @override
  @JsonKey(name: "is_deleted")
  final bool? isDeleted;
  @override
  @JsonKey(name: "status")
  final String? status;
  final List<OwnCategory>? _ownCategories;
  @override
  @JsonKey(name: "ownCategories")
  List<OwnCategory>? get ownCategories {
    final value = _ownCategories;
    if (value == null) return null;
    if (_ownCategories is EqualUnmodifiableListView) return _ownCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
    return 'ArticleByIdResponse(id: $id, articleId: $articleId, title: $title, body: $body, bodyShort: $bodyShort, thumbnailUrl: $thumbnailUrl, thumbnailType: $thumbnailType, authorName: $authorName, link: $link, date: $date, likes: $likes, dislikes: $dislikes, views: $views, bookmarks: $bookmarks, share: $share, language: $language, category: $category, tags: $tags, source: $source, isDeleted: $isDeleted, status: $status, ownCategories: $ownCategories, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleByIdResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.bodyShort, bodyShort) ||
                other.bodyShort == bodyShort) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.thumbnailType, thumbnailType) ||
                other.thumbnailType == thumbnailType) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.dislikes, dislikes) ||
                other.dislikes == dislikes) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.bookmarks, bookmarks) ||
                other.bookmarks == bookmarks) &&
            (identical(other.share, share) || other.share == share) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._ownCategories, _ownCategories) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        articleId,
        title,
        body,
        bodyShort,
        thumbnailUrl,
        thumbnailType,
        authorName,
        link,
        date,
        likes,
        dislikes,
        views,
        bookmarks,
        share,
        language,
        const DeepCollectionEquality().hash(_category),
        const DeepCollectionEquality().hash(_tags),
        source,
        isDeleted,
        status,
        const DeepCollectionEquality().hash(_ownCategories),
        createdAt,
        updatedAt,
        v
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleByIdResponseImplCopyWith<_$ArticleByIdResponseImpl> get copyWith =>
      __$$ArticleByIdResponseImplCopyWithImpl<_$ArticleByIdResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleByIdResponseImplToJson(
      this,
    );
  }
}

abstract class _ArticleByIdResponse implements ArticleByIdResponse {
  const factory _ArticleByIdResponse(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "article_id") final String? articleId,
      @JsonKey(name: "title") final String? title,
      @JsonKey(name: "body") final String? body,
      @JsonKey(name: "body_short") final String? bodyShort,
      @JsonKey(name: "thumbnail_url") final String? thumbnailUrl,
      @JsonKey(name: "thumbnail_type") final String? thumbnailType,
      @JsonKey(name: "author_name") final String? authorName,
      @JsonKey(name: "link") final String? link,
      @JsonKey(name: "date") final DateTime? date,
      @JsonKey(name: "likes") final int? likes,
      @JsonKey(name: "dislikes") final int? dislikes,
      @JsonKey(name: "views") final int? views,
      @JsonKey(name: "bookmarks") final int? bookmarks,
      @JsonKey(name: "share") final int? share,
      @JsonKey(name: "language") final String? language,
      @JsonKey(name: "category") final List<Category>? category,
      @JsonKey(name: "tags") final List<Category>? tags,
      @JsonKey(name: "source") final Source? source,
      @JsonKey(name: "is_deleted") final bool? isDeleted,
      @JsonKey(name: "status") final String? status,
      @JsonKey(name: "ownCategories") final List<OwnCategory>? ownCategories,
      @JsonKey(name: "createdAt") final DateTime? createdAt,
      @JsonKey(name: "updatedAt") final DateTime? updatedAt,
      @JsonKey(name: "__v") final int? v}) = _$ArticleByIdResponseImpl;

  factory _ArticleByIdResponse.fromJson(Map<String, dynamic> json) =
      _$ArticleByIdResponseImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "article_id")
  String? get articleId;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "body")
  String? get body;
  @override
  @JsonKey(name: "body_short")
  String? get bodyShort;
  @override
  @JsonKey(name: "thumbnail_url")
  String? get thumbnailUrl;
  @override
  @JsonKey(name: "thumbnail_type")
  String? get thumbnailType;
  @override
  @JsonKey(name: "author_name")
  String? get authorName;
  @override
  @JsonKey(name: "link")
  String? get link;
  @override
  @JsonKey(name: "date")
  DateTime? get date;
  @override
  @JsonKey(name: "likes")
  int? get likes;
  @override
  @JsonKey(name: "dislikes")
  int? get dislikes;
  @override
  @JsonKey(name: "views")
  int? get views;
  @override
  @JsonKey(name: "bookmarks")
  int? get bookmarks;
  @override
  @JsonKey(name: "share")
  int? get share;
  @override
  @JsonKey(name: "language")
  String? get language;
  @override
  @JsonKey(name: "category")
  List<Category>? get category;
  @override
  @JsonKey(name: "tags")
  List<Category>? get tags;
  @override
  @JsonKey(name: "source")
  Source? get source;
  @override
  @JsonKey(name: "is_deleted")
  bool? get isDeleted;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "ownCategories")
  List<OwnCategory>? get ownCategories;
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
  _$$ArticleByIdResponseImplCopyWith<_$ArticleByIdResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "__v")
  int? get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "__v") int? v});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "__v") int? v});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(_$CategoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
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
class _$CategoryImpl implements _Category {
  const _$CategoryImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "slug") this.slug,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt,
      @JsonKey(name: "__v") this.v});

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "slug")
  final String? slug;
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
    return 'Category(id: $id, name: $name, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, slug, createdAt, updatedAt, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "slug") final String? slug,
      @JsonKey(name: "createdAt") final DateTime? createdAt,
      @JsonKey(name: "updatedAt") final DateTime? updatedAt,
      @JsonKey(name: "__v") final int? v}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "slug")
  String? get slug;
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
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OwnCategory _$OwnCategoryFromJson(Map<String, dynamic> json) {
  return _OwnCategory.fromJson(json);
}

/// @nodoc
mixin _$OwnCategory {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "sources")
  List<dynamic>? get sources => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "__v")
  int? get v => throw _privateConstructorUsedError;
  @JsonKey(name: "count")
  int? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OwnCategoryCopyWith<OwnCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnCategoryCopyWith<$Res> {
  factory $OwnCategoryCopyWith(
          OwnCategory value, $Res Function(OwnCategory) then) =
      _$OwnCategoryCopyWithImpl<$Res, OwnCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "sources") List<dynamic>? sources,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "__v") int? v,
      @JsonKey(name: "count") int? count});
}

/// @nodoc
class _$OwnCategoryCopyWithImpl<$Res, $Val extends OwnCategory>
    implements $OwnCategoryCopyWith<$Res> {
  _$OwnCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? sources = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      sources: freezed == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
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
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OwnCategoryImplCopyWith<$Res>
    implements $OwnCategoryCopyWith<$Res> {
  factory _$$OwnCategoryImplCopyWith(
          _$OwnCategoryImpl value, $Res Function(_$OwnCategoryImpl) then) =
      __$$OwnCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "sources") List<dynamic>? sources,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "__v") int? v,
      @JsonKey(name: "count") int? count});
}

/// @nodoc
class __$$OwnCategoryImplCopyWithImpl<$Res>
    extends _$OwnCategoryCopyWithImpl<$Res, _$OwnCategoryImpl>
    implements _$$OwnCategoryImplCopyWith<$Res> {
  __$$OwnCategoryImplCopyWithImpl(
      _$OwnCategoryImpl _value, $Res Function(_$OwnCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? sources = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? count = freezed,
  }) {
    return _then(_$OwnCategoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      sources: freezed == sources
          ? _value._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
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
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OwnCategoryImpl implements _OwnCategory {
  const _$OwnCategoryImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "slug") this.slug,
      @JsonKey(name: "sources") final List<dynamic>? sources,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt,
      @JsonKey(name: "__v") this.v,
      @JsonKey(name: "count") this.count})
      : _sources = sources;

  factory _$OwnCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnCategoryImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "slug")
  final String? slug;
  final List<dynamic>? _sources;
  @override
  @JsonKey(name: "sources")
  List<dynamic>? get sources {
    final value = _sources;
    if (value == null) return null;
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
  @JsonKey(name: "count")
  final int? count;

  @override
  String toString() {
    return 'OwnCategory(id: $id, name: $name, slug: $slug, sources: $sources, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            const DeepCollectionEquality().equals(other._sources, _sources) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      slug,
      const DeepCollectionEquality().hash(_sources),
      createdAt,
      updatedAt,
      v,
      count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnCategoryImplCopyWith<_$OwnCategoryImpl> get copyWith =>
      __$$OwnCategoryImplCopyWithImpl<_$OwnCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnCategoryImplToJson(
      this,
    );
  }
}

abstract class _OwnCategory implements OwnCategory {
  const factory _OwnCategory(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "slug") final String? slug,
      @JsonKey(name: "sources") final List<dynamic>? sources,
      @JsonKey(name: "createdAt") final DateTime? createdAt,
      @JsonKey(name: "updatedAt") final DateTime? updatedAt,
      @JsonKey(name: "__v") final int? v,
      @JsonKey(name: "count") final int? count}) = _$OwnCategoryImpl;

  factory _OwnCategory.fromJson(Map<String, dynamic> json) =
      _$OwnCategoryImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "slug")
  String? get slug;
  @override
  @JsonKey(name: "sources")
  List<dynamic>? get sources;
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
  @JsonKey(name: "count")
  int? get count;
  @override
  @JsonKey(ignore: true)
  _$$OwnCategoryImplCopyWith<_$OwnCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Source _$SourceFromJson(Map<String, dynamic> json) {
  return _Source.fromJson(json);
}

/// @nodoc
mixin _$Source {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "source_id")
  String? get sourceId => throw _privateConstructorUsedError;
  @JsonKey(name: "source_url")
  String? get sourceUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "source_icon")
  String? get sourceIcon => throw _privateConstructorUsedError;
  @JsonKey(name: "source_priority")
  int? get sourcePriority => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "__v")
  int? get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SourceCopyWith<Source> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceCopyWith<$Res> {
  factory $SourceCopyWith(Source value, $Res Function(Source) then) =
      _$SourceCopyWithImpl<$Res, Source>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "source_id") String? sourceId,
      @JsonKey(name: "source_url") String? sourceUrl,
      @JsonKey(name: "source_icon") String? sourceIcon,
      @JsonKey(name: "source_priority") int? sourcePriority,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "__v") int? v});
}

/// @nodoc
class _$SourceCopyWithImpl<$Res, $Val extends Source>
    implements $SourceCopyWith<$Res> {
  _$SourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sourceId = freezed,
    Object? sourceUrl = freezed,
    Object? sourceIcon = freezed,
    Object? sourcePriority = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceId: freezed == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceIcon: freezed == sourceIcon
          ? _value.sourceIcon
          : sourceIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      sourcePriority: freezed == sourcePriority
          ? _value.sourcePriority
          : sourcePriority // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SourceImplCopyWith<$Res> implements $SourceCopyWith<$Res> {
  factory _$$SourceImplCopyWith(
          _$SourceImpl value, $Res Function(_$SourceImpl) then) =
      __$$SourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "source_id") String? sourceId,
      @JsonKey(name: "source_url") String? sourceUrl,
      @JsonKey(name: "source_icon") String? sourceIcon,
      @JsonKey(name: "source_priority") int? sourcePriority,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "__v") int? v});
}

/// @nodoc
class __$$SourceImplCopyWithImpl<$Res>
    extends _$SourceCopyWithImpl<$Res, _$SourceImpl>
    implements _$$SourceImplCopyWith<$Res> {
  __$$SourceImplCopyWithImpl(
      _$SourceImpl _value, $Res Function(_$SourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sourceId = freezed,
    Object? sourceUrl = freezed,
    Object? sourceIcon = freezed,
    Object? sourcePriority = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(_$SourceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceId: freezed == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceIcon: freezed == sourceIcon
          ? _value.sourceIcon
          : sourceIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      sourcePriority: freezed == sourcePriority
          ? _value.sourcePriority
          : sourcePriority // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
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
class _$SourceImpl implements _Source {
  const _$SourceImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "source_id") this.sourceId,
      @JsonKey(name: "source_url") this.sourceUrl,
      @JsonKey(name: "source_icon") this.sourceIcon,
      @JsonKey(name: "source_priority") this.sourcePriority,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt,
      @JsonKey(name: "__v") this.v});

  factory _$SourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "source_id")
  final String? sourceId;
  @override
  @JsonKey(name: "source_url")
  final String? sourceUrl;
  @override
  @JsonKey(name: "source_icon")
  final String? sourceIcon;
  @override
  @JsonKey(name: "source_priority")
  final int? sourcePriority;
  @override
  @JsonKey(name: "status")
  final String? status;
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
    return 'Source(id: $id, sourceId: $sourceId, sourceUrl: $sourceUrl, sourceIcon: $sourceIcon, sourcePriority: $sourcePriority, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            (identical(other.sourceIcon, sourceIcon) ||
                other.sourceIcon == sourceIcon) &&
            (identical(other.sourcePriority, sourcePriority) ||
                other.sourcePriority == sourcePriority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, sourceId, sourceUrl,
      sourceIcon, sourcePriority, status, createdAt, updatedAt, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceImplCopyWith<_$SourceImpl> get copyWith =>
      __$$SourceImplCopyWithImpl<_$SourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourceImplToJson(
      this,
    );
  }
}

abstract class _Source implements Source {
  const factory _Source(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "source_id") final String? sourceId,
      @JsonKey(name: "source_url") final String? sourceUrl,
      @JsonKey(name: "source_icon") final String? sourceIcon,
      @JsonKey(name: "source_priority") final int? sourcePriority,
      @JsonKey(name: "status") final String? status,
      @JsonKey(name: "createdAt") final DateTime? createdAt,
      @JsonKey(name: "updatedAt") final DateTime? updatedAt,
      @JsonKey(name: "__v") final int? v}) = _$SourceImpl;

  factory _Source.fromJson(Map<String, dynamic> json) = _$SourceImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "source_id")
  String? get sourceId;
  @override
  @JsonKey(name: "source_url")
  String? get sourceUrl;
  @override
  @JsonKey(name: "source_icon")
  String? get sourceIcon;
  @override
  @JsonKey(name: "source_priority")
  int? get sourcePriority;
  @override
  @JsonKey(name: "status")
  String? get status;
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
  _$$SourceImplCopyWith<_$SourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
