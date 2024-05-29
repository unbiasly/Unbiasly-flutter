// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetFeedResponse _$GetFeedResponseFromJson(Map<String, dynamic> json) {
  return _GetFeedResponse.fromJson(json);
}

/// @nodoc
mixin _$GetFeedResponse {
  @JsonKey(name: "articles")
  List<Article>? get articles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetFeedResponseCopyWith<GetFeedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFeedResponseCopyWith<$Res> {
  factory $GetFeedResponseCopyWith(
          GetFeedResponse value, $Res Function(GetFeedResponse) then) =
      _$GetFeedResponseCopyWithImpl<$Res, GetFeedResponse>;
  @useResult
  $Res call({@JsonKey(name: "articles") List<Article>? articles});
}

/// @nodoc
class _$GetFeedResponseCopyWithImpl<$Res, $Val extends GetFeedResponse>
    implements $GetFeedResponseCopyWith<$Res> {
  _$GetFeedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = freezed,
  }) {
    return _then(_value.copyWith(
      articles: freezed == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetFeedResponseImplCopyWith<$Res>
    implements $GetFeedResponseCopyWith<$Res> {
  factory _$$GetFeedResponseImplCopyWith(_$GetFeedResponseImpl value,
          $Res Function(_$GetFeedResponseImpl) then) =
      __$$GetFeedResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "articles") List<Article>? articles});
}

/// @nodoc
class __$$GetFeedResponseImplCopyWithImpl<$Res>
    extends _$GetFeedResponseCopyWithImpl<$Res, _$GetFeedResponseImpl>
    implements _$$GetFeedResponseImplCopyWith<$Res> {
  __$$GetFeedResponseImplCopyWithImpl(
      _$GetFeedResponseImpl _value, $Res Function(_$GetFeedResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = freezed,
  }) {
    return _then(_$GetFeedResponseImpl(
      articles: freezed == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetFeedResponseImpl implements _GetFeedResponse {
  const _$GetFeedResponseImpl(
      {@JsonKey(name: "articles") final List<Article>? articles})
      : _articles = articles;

  factory _$GetFeedResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetFeedResponseImplFromJson(json);

  final List<Article>? _articles;
  @override
  @JsonKey(name: "articles")
  List<Article>? get articles {
    final value = _articles;
    if (value == null) return null;
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetFeedResponse(articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFeedResponseImpl &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_articles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFeedResponseImplCopyWith<_$GetFeedResponseImpl> get copyWith =>
      __$$GetFeedResponseImplCopyWithImpl<_$GetFeedResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetFeedResponseImplToJson(
      this,
    );
  }
}

abstract class _GetFeedResponse implements GetFeedResponse {
  const factory _GetFeedResponse(
          {@JsonKey(name: "articles") final List<Article>? articles}) =
      _$GetFeedResponseImpl;

  factory _GetFeedResponse.fromJson(Map<String, dynamic> json) =
      _$GetFeedResponseImpl.fromJson;

  @override
  @JsonKey(name: "articles")
  List<Article>? get articles;
  @override
  @JsonKey(ignore: true)
  _$$GetFeedResponseImplCopyWith<_$GetFeedResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return _Article.fromJson(json);
}

/// @nodoc
mixin _$Article {
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
  List<OwnCategoryElement>? get category => throw _privateConstructorUsedError;
  @JsonKey(name: "tags")
  List<dynamic>? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: "source")
  Source? get source => throw _privateConstructorUsedError;
  @JsonKey(name: "is_deleted")
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "created_by")
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_by")
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: "verifiedSource")
  String? get verifiedSource => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "__v")
  int? get v => throw _privateConstructorUsedError;
  @JsonKey(name: "author_name")
  String? get authorName => throw _privateConstructorUsedError;
  @JsonKey(name: "sentiment")
  String? get sentiment => throw _privateConstructorUsedError;
  @JsonKey(name: "categories")
  List<TagsInfoElement>? get categories => throw _privateConstructorUsedError;
  @JsonKey(name: "tagsInfo")
  List<TagsInfoElement>? get tagsInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "sourceInfo")
  SourceInfo? get sourceInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "ownCategories")
  List<OwnCategoryElement>? get ownCategories =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "notification")
  bool? get notification => throw _privateConstructorUsedError;
  @JsonKey(name: "action")
  ArticleActionNew? get articleActionNew => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleCopyWith<Article> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleCopyWith<$Res> {
  factory $ArticleCopyWith(Article value, $Res Function(Article) then) =
      _$ArticleCopyWithImpl<$Res, Article>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "article_id") String? articleId,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "body") String? body,
      @JsonKey(name: "body_short") String? bodyShort,
      @JsonKey(name: "thumbnail_url") String? thumbnailUrl,
      @JsonKey(name: "thumbnail_type") String? thumbnailType,
      @JsonKey(name: "link") String? link,
      @JsonKey(name: "date") DateTime? date,
      @JsonKey(name: "likes") int? likes,
      @JsonKey(name: "dislikes") int? dislikes,
      @JsonKey(name: "views") int? views,
      @JsonKey(name: "bookmarks") int? bookmarks,
      @JsonKey(name: "share") int? share,
      @JsonKey(name: "language") String? language,
      @JsonKey(name: "category") List<OwnCategoryElement>? category,
      @JsonKey(name: "tags") List<dynamic>? tags,
      @JsonKey(name: "source") Source? source,
      @JsonKey(name: "is_deleted") bool? isDeleted,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "created_by") String? createdBy,
      @JsonKey(name: "updated_by") String? updatedBy,
      @JsonKey(name: "verifiedSource") String? verifiedSource,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "__v") int? v,
      @JsonKey(name: "author_name") String? authorName,
      @JsonKey(name: "sentiment") String? sentiment,
      @JsonKey(name: "categories") List<TagsInfoElement>? categories,
      @JsonKey(name: "tagsInfo") List<TagsInfoElement>? tagsInfo,
      @JsonKey(name: "sourceInfo") SourceInfo? sourceInfo,
      @JsonKey(name: "ownCategories") List<OwnCategoryElement>? ownCategories,
      @JsonKey(name: "notification") bool? notification,
      @JsonKey(name: "action") ArticleActionNew? articleActionNew});

  $SourceCopyWith<$Res>? get source;
  $SourceInfoCopyWith<$Res>? get sourceInfo;
}

/// @nodoc
class _$ArticleCopyWithImpl<$Res, $Val extends Article>
    implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._value, this._then);

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
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? verifiedSource = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? authorName = freezed,
    Object? sentiment = freezed,
    Object? categories = freezed,
    Object? tagsInfo = freezed,
    Object? sourceInfo = freezed,
    Object? ownCategories = freezed,
    Object? notification = freezed,
    Object? articleActionNew = freezed,
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
              as List<OwnCategoryElement>?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
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
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedSource: freezed == verifiedSource
          ? _value.verifiedSource
          : verifiedSource // ignore: cast_nullable_to_non_nullable
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
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      sentiment: freezed == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<TagsInfoElement>?,
      tagsInfo: freezed == tagsInfo
          ? _value.tagsInfo
          : tagsInfo // ignore: cast_nullable_to_non_nullable
              as List<TagsInfoElement>?,
      sourceInfo: freezed == sourceInfo
          ? _value.sourceInfo
          : sourceInfo // ignore: cast_nullable_to_non_nullable
              as SourceInfo?,
      ownCategories: freezed == ownCategories
          ? _value.ownCategories
          : ownCategories // ignore: cast_nullable_to_non_nullable
              as List<OwnCategoryElement>?,
      notification: freezed == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as bool?,
      articleActionNew: freezed == articleActionNew
          ? _value.articleActionNew
          : articleActionNew // ignore: cast_nullable_to_non_nullable
              as ArticleActionNew?,
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

  @override
  @pragma('vm:prefer-inline')
  $SourceInfoCopyWith<$Res>? get sourceInfo {
    if (_value.sourceInfo == null) {
      return null;
    }

    return $SourceInfoCopyWith<$Res>(_value.sourceInfo!, (value) {
      return _then(_value.copyWith(sourceInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArticleImplCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$$ArticleImplCopyWith(
          _$ArticleImpl value, $Res Function(_$ArticleImpl) then) =
      __$$ArticleImplCopyWithImpl<$Res>;
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
      @JsonKey(name: "link") String? link,
      @JsonKey(name: "date") DateTime? date,
      @JsonKey(name: "likes") int? likes,
      @JsonKey(name: "dislikes") int? dislikes,
      @JsonKey(name: "views") int? views,
      @JsonKey(name: "bookmarks") int? bookmarks,
      @JsonKey(name: "share") int? share,
      @JsonKey(name: "language") String? language,
      @JsonKey(name: "category") List<OwnCategoryElement>? category,
      @JsonKey(name: "tags") List<dynamic>? tags,
      @JsonKey(name: "source") Source? source,
      @JsonKey(name: "is_deleted") bool? isDeleted,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "created_by") String? createdBy,
      @JsonKey(name: "updated_by") String? updatedBy,
      @JsonKey(name: "verifiedSource") String? verifiedSource,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "__v") int? v,
      @JsonKey(name: "author_name") String? authorName,
      @JsonKey(name: "sentiment") String? sentiment,
      @JsonKey(name: "categories") List<TagsInfoElement>? categories,
      @JsonKey(name: "tagsInfo") List<TagsInfoElement>? tagsInfo,
      @JsonKey(name: "sourceInfo") SourceInfo? sourceInfo,
      @JsonKey(name: "ownCategories") List<OwnCategoryElement>? ownCategories,
      @JsonKey(name: "notification") bool? notification,
      @JsonKey(name: "action") ArticleActionNew? articleActionNew});

  @override
  $SourceCopyWith<$Res>? get source;
  @override
  $SourceInfoCopyWith<$Res>? get sourceInfo;
}

/// @nodoc
class __$$ArticleImplCopyWithImpl<$Res>
    extends _$ArticleCopyWithImpl<$Res, _$ArticleImpl>
    implements _$$ArticleImplCopyWith<$Res> {
  __$$ArticleImplCopyWithImpl(
      _$ArticleImpl _value, $Res Function(_$ArticleImpl) _then)
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
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? verifiedSource = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
    Object? authorName = freezed,
    Object? sentiment = freezed,
    Object? categories = freezed,
    Object? tagsInfo = freezed,
    Object? sourceInfo = freezed,
    Object? ownCategories = freezed,
    Object? notification = freezed,
    Object? articleActionNew = freezed,
  }) {
    return _then(_$ArticleImpl(
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
              as List<OwnCategoryElement>?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
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
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedSource: freezed == verifiedSource
          ? _value.verifiedSource
          : verifiedSource // ignore: cast_nullable_to_non_nullable
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
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      sentiment: freezed == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<TagsInfoElement>?,
      tagsInfo: freezed == tagsInfo
          ? _value._tagsInfo
          : tagsInfo // ignore: cast_nullable_to_non_nullable
              as List<TagsInfoElement>?,
      sourceInfo: freezed == sourceInfo
          ? _value.sourceInfo
          : sourceInfo // ignore: cast_nullable_to_non_nullable
              as SourceInfo?,
      ownCategories: freezed == ownCategories
          ? _value._ownCategories
          : ownCategories // ignore: cast_nullable_to_non_nullable
              as List<OwnCategoryElement>?,
      notification: freezed == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as bool?,
      articleActionNew: freezed == articleActionNew
          ? _value.articleActionNew
          : articleActionNew // ignore: cast_nullable_to_non_nullable
              as ArticleActionNew?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleImpl implements _Article {
  const _$ArticleImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "article_id") this.articleId,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "body") this.body,
      @JsonKey(name: "body_short") this.bodyShort,
      @JsonKey(name: "thumbnail_url") this.thumbnailUrl,
      @JsonKey(name: "thumbnail_type") this.thumbnailType,
      @JsonKey(name: "link") this.link,
      @JsonKey(name: "date") this.date,
      @JsonKey(name: "likes") this.likes,
      @JsonKey(name: "dislikes") this.dislikes,
      @JsonKey(name: "views") this.views,
      @JsonKey(name: "bookmarks") this.bookmarks,
      @JsonKey(name: "share") this.share,
      @JsonKey(name: "language") this.language,
      @JsonKey(name: "category") final List<OwnCategoryElement>? category,
      @JsonKey(name: "tags") final List<dynamic>? tags,
      @JsonKey(name: "source") this.source,
      @JsonKey(name: "is_deleted") this.isDeleted,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "created_by") this.createdBy,
      @JsonKey(name: "updated_by") this.updatedBy,
      @JsonKey(name: "verifiedSource") this.verifiedSource,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt,
      @JsonKey(name: "__v") this.v,
      @JsonKey(name: "author_name") this.authorName,
      @JsonKey(name: "sentiment") this.sentiment,
      @JsonKey(name: "categories") final List<TagsInfoElement>? categories,
      @JsonKey(name: "tagsInfo") final List<TagsInfoElement>? tagsInfo,
      @JsonKey(name: "sourceInfo") this.sourceInfo,
      @JsonKey(name: "ownCategories")
      final List<OwnCategoryElement>? ownCategories,
      @JsonKey(name: "notification") this.notification,
      @JsonKey(name: "action") this.articleActionNew})
      : _category = category,
        _tags = tags,
        _categories = categories,
        _tagsInfo = tagsInfo,
        _ownCategories = ownCategories;

  factory _$ArticleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleImplFromJson(json);

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
  final List<OwnCategoryElement>? _category;
  @override
  @JsonKey(name: "category")
  List<OwnCategoryElement>? get category {
    final value = _category;
    if (value == null) return null;
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _tags;
  @override
  @JsonKey(name: "tags")
  List<dynamic>? get tags {
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
  @override
  @JsonKey(name: "created_by")
  final String? createdBy;
  @override
  @JsonKey(name: "updated_by")
  final String? updatedBy;
  @override
  @JsonKey(name: "verifiedSource")
  final String? verifiedSource;
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
  @JsonKey(name: "author_name")
  final String? authorName;
  @override
  @JsonKey(name: "sentiment")
  final String? sentiment;
  final List<TagsInfoElement>? _categories;
  @override
  @JsonKey(name: "categories")
  List<TagsInfoElement>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TagsInfoElement>? _tagsInfo;
  @override
  @JsonKey(name: "tagsInfo")
  List<TagsInfoElement>? get tagsInfo {
    final value = _tagsInfo;
    if (value == null) return null;
    if (_tagsInfo is EqualUnmodifiableListView) return _tagsInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "sourceInfo")
  final SourceInfo? sourceInfo;
  final List<OwnCategoryElement>? _ownCategories;
  @override
  @JsonKey(name: "ownCategories")
  List<OwnCategoryElement>? get ownCategories {
    final value = _ownCategories;
    if (value == null) return null;
    if (_ownCategories is EqualUnmodifiableListView) return _ownCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "notification")
  final bool? notification;
  @override
  @JsonKey(name: "action")
  final ArticleActionNew? articleActionNew;

  @override
  String toString() {
    return 'Article(id: $id, articleId: $articleId, title: $title, body: $body, bodyShort: $bodyShort, thumbnailUrl: $thumbnailUrl, thumbnailType: $thumbnailType, link: $link, date: $date, likes: $likes, dislikes: $dislikes, views: $views, bookmarks: $bookmarks, share: $share, language: $language, category: $category, tags: $tags, source: $source, isDeleted: $isDeleted, status: $status, createdBy: $createdBy, updatedBy: $updatedBy, verifiedSource: $verifiedSource, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, authorName: $authorName, sentiment: $sentiment, categories: $categories, tagsInfo: $tagsInfo, sourceInfo: $sourceInfo, ownCategories: $ownCategories, notification: $notification, action: $articleActionNew)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleImpl &&
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
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.verifiedSource, verifiedSource) ||
                other.verifiedSource == verifiedSource) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.sentiment, sentiment) ||
                other.sentiment == sentiment) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._tagsInfo, _tagsInfo) &&
            (identical(other.sourceInfo, sourceInfo) ||
                other.sourceInfo == sourceInfo) &&
            const DeepCollectionEquality()
                .equals(other._ownCategories, _ownCategories) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.articleActionNew, articleActionNew) ||
                other.articleActionNew == articleActionNew));
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
        createdBy,
        updatedBy,
        verifiedSource,
        createdAt,
        updatedAt,
        v,
        authorName,
        sentiment,
        const DeepCollectionEquality().hash(_categories),
        const DeepCollectionEquality().hash(_tagsInfo),
        sourceInfo,
        const DeepCollectionEquality().hash(_ownCategories),
        notification,
        articleActionNew
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleImplCopyWith<_$ArticleImpl> get copyWith =>
      __$$ArticleImplCopyWithImpl<_$ArticleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleImplToJson(
      this,
    );
  }
}

abstract class _Article implements Article {
  const factory _Article(
          {@JsonKey(name: "_id") final String? id,
          @JsonKey(name: "article_id") final String? articleId,
          @JsonKey(name: "title") final String? title,
          @JsonKey(name: "body") final String? body,
          @JsonKey(name: "body_short") final String? bodyShort,
          @JsonKey(name: "thumbnail_url") final String? thumbnailUrl,
          @JsonKey(name: "thumbnail_type") final String? thumbnailType,
          @JsonKey(name: "link") final String? link,
          @JsonKey(name: "date") final DateTime? date,
          @JsonKey(name: "likes") final int? likes,
          @JsonKey(name: "dislikes") final int? dislikes,
          @JsonKey(name: "views") final int? views,
          @JsonKey(name: "bookmarks") final int? bookmarks,
          @JsonKey(name: "share") final int? share,
          @JsonKey(name: "language") final String? language,
          @JsonKey(name: "category") final List<OwnCategoryElement>? category,
          @JsonKey(name: "tags") final List<dynamic>? tags,
          @JsonKey(name: "source") final Source? source,
          @JsonKey(name: "is_deleted") final bool? isDeleted,
          @JsonKey(name: "status") final String? status,
          @JsonKey(name: "created_by") final String? createdBy,
          @JsonKey(name: "updated_by") final String? updatedBy,
          @JsonKey(name: "verifiedSource") final String? verifiedSource,
          @JsonKey(name: "createdAt") final DateTime? createdAt,
          @JsonKey(name: "updatedAt") final DateTime? updatedAt,
          @JsonKey(name: "__v") final int? v,
          @JsonKey(name: "author_name") final String? authorName,
          @JsonKey(name: "sentiment") final String? sentiment,
          @JsonKey(name: "categories") final List<TagsInfoElement>? categories,
          @JsonKey(name: "tagsInfo") final List<TagsInfoElement>? tagsInfo,
          @JsonKey(name: "sourceInfo") final SourceInfo? sourceInfo,
          @JsonKey(name: "ownCategories")
          final List<OwnCategoryElement>? ownCategories,
          @JsonKey(name: "notification") final bool? notification,
          @JsonKey(name: "action") final ArticleActionNew? articleActionNew}) =
      _$ArticleImpl;

  factory _Article.fromJson(Map<String, dynamic> json) = _$ArticleImpl.fromJson;

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
  List<OwnCategoryElement>? get category;
  @override
  @JsonKey(name: "tags")
  List<dynamic>? get tags;
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
  @JsonKey(name: "created_by")
  String? get createdBy;
  @override
  @JsonKey(name: "updated_by")
  String? get updatedBy;
  @override
  @JsonKey(name: "verifiedSource")
  String? get verifiedSource;
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
  @JsonKey(name: "author_name")
  String? get authorName;
  @override
  @JsonKey(name: "sentiment")
  String? get sentiment;
  @override
  @JsonKey(name: "categories")
  List<TagsInfoElement>? get categories;
  @override
  @JsonKey(name: "tagsInfo")
  List<TagsInfoElement>? get tagsInfo;
  @override
  @JsonKey(name: "sourceInfo")
  SourceInfo? get sourceInfo;
  @override
  @JsonKey(name: "ownCategories")
  List<OwnCategoryElement>? get ownCategories;
  @override
  @JsonKey(name: "notification")
  bool? get notification;
  @override
  @JsonKey(name: "action")
  ArticleActionNew? get articleActionNew;
  @override
  @JsonKey(ignore: true)
  _$$ArticleImplCopyWith<_$ArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TagsInfoElement _$TagsInfoElementFromJson(Map<String, dynamic> json) {
  return _TagsInfoElement.fromJson(json);
}

/// @nodoc
mixin _$TagsInfoElement {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagsInfoElementCopyWith<TagsInfoElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagsInfoElementCopyWith<$Res> {
  factory $TagsInfoElementCopyWith(
          TagsInfoElement value, $Res Function(TagsInfoElement) then) =
      _$TagsInfoElementCopyWithImpl<$Res, TagsInfoElement>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "name") String? name});
}

/// @nodoc
class _$TagsInfoElementCopyWithImpl<$Res, $Val extends TagsInfoElement>
    implements $TagsInfoElementCopyWith<$Res> {
  _$TagsInfoElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagsInfoElementImplCopyWith<$Res>
    implements $TagsInfoElementCopyWith<$Res> {
  factory _$$TagsInfoElementImplCopyWith(_$TagsInfoElementImpl value,
          $Res Function(_$TagsInfoElementImpl) then) =
      __$$TagsInfoElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "name") String? name});
}

/// @nodoc
class __$$TagsInfoElementImplCopyWithImpl<$Res>
    extends _$TagsInfoElementCopyWithImpl<$Res, _$TagsInfoElementImpl>
    implements _$$TagsInfoElementImplCopyWith<$Res> {
  __$$TagsInfoElementImplCopyWithImpl(
      _$TagsInfoElementImpl _value, $Res Function(_$TagsInfoElementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? name = freezed,
  }) {
    return _then(_$TagsInfoElementImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TagsInfoElementImpl implements _TagsInfoElement {
  const _$TagsInfoElementImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "slug") this.slug,
      @JsonKey(name: "name") this.name});

  factory _$TagsInfoElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagsInfoElementImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "slug")
  final String? slug;
  @override
  @JsonKey(name: "name")
  final String? name;

  @override
  String toString() {
    return 'TagsInfoElement(id: $id, slug: $slug, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagsInfoElementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, slug, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagsInfoElementImplCopyWith<_$TagsInfoElementImpl> get copyWith =>
      __$$TagsInfoElementImplCopyWithImpl<_$TagsInfoElementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagsInfoElementImplToJson(
      this,
    );
  }
}

abstract class _TagsInfoElement implements TagsInfoElement {
  const factory _TagsInfoElement(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "slug") final String? slug,
      @JsonKey(name: "name") final String? name}) = _$TagsInfoElementImpl;

  factory _TagsInfoElement.fromJson(Map<String, dynamic> json) =
      _$TagsInfoElementImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "slug")
  String? get slug;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$TagsInfoElementImplCopyWith<_$TagsInfoElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OwnCategoryElement _$OwnCategoryElementFromJson(Map<String, dynamic> json) {
  return _OwnCategoryElement.fromJson(json);
}

/// @nodoc
mixin _$OwnCategoryElement {
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
  $OwnCategoryElementCopyWith<OwnCategoryElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnCategoryElementCopyWith<$Res> {
  factory $OwnCategoryElementCopyWith(
          OwnCategoryElement value, $Res Function(OwnCategoryElement) then) =
      _$OwnCategoryElementCopyWithImpl<$Res, OwnCategoryElement>;
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
class _$OwnCategoryElementCopyWithImpl<$Res, $Val extends OwnCategoryElement>
    implements $OwnCategoryElementCopyWith<$Res> {
  _$OwnCategoryElementCopyWithImpl(this._value, this._then);

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
abstract class _$$OwnCategoryElementImplCopyWith<$Res>
    implements $OwnCategoryElementCopyWith<$Res> {
  factory _$$OwnCategoryElementImplCopyWith(_$OwnCategoryElementImpl value,
          $Res Function(_$OwnCategoryElementImpl) then) =
      __$$OwnCategoryElementImplCopyWithImpl<$Res>;
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
class __$$OwnCategoryElementImplCopyWithImpl<$Res>
    extends _$OwnCategoryElementCopyWithImpl<$Res, _$OwnCategoryElementImpl>
    implements _$$OwnCategoryElementImplCopyWith<$Res> {
  __$$OwnCategoryElementImplCopyWithImpl(_$OwnCategoryElementImpl _value,
      $Res Function(_$OwnCategoryElementImpl) _then)
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
    return _then(_$OwnCategoryElementImpl(
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
class _$OwnCategoryElementImpl implements _OwnCategoryElement {
  const _$OwnCategoryElementImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "slug") this.slug,
      @JsonKey(name: "sources") final List<dynamic>? sources,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt,
      @JsonKey(name: "__v") this.v,
      @JsonKey(name: "count") this.count})
      : _sources = sources;

  factory _$OwnCategoryElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnCategoryElementImplFromJson(json);

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
    return 'OwnCategoryElement(id: $id, name: $name, slug: $slug, sources: $sources, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnCategoryElementImpl &&
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
  _$$OwnCategoryElementImplCopyWith<_$OwnCategoryElementImpl> get copyWith =>
      __$$OwnCategoryElementImplCopyWithImpl<_$OwnCategoryElementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnCategoryElementImplToJson(
      this,
    );
  }
}

abstract class _OwnCategoryElement implements OwnCategoryElement {
  const factory _OwnCategoryElement(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "slug") final String? slug,
      @JsonKey(name: "sources") final List<dynamic>? sources,
      @JsonKey(name: "createdAt") final DateTime? createdAt,
      @JsonKey(name: "updatedAt") final DateTime? updatedAt,
      @JsonKey(name: "__v") final int? v,
      @JsonKey(name: "count") final int? count}) = _$OwnCategoryElementImpl;

  factory _OwnCategoryElement.fromJson(Map<String, dynamic> json) =
      _$OwnCategoryElementImpl.fromJson;

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
  _$$OwnCategoryElementImplCopyWith<_$OwnCategoryElementImpl> get copyWith =>
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

SourceInfo _$SourceInfoFromJson(Map<String, dynamic> json) {
  return _SourceInfo.fromJson(json);
}

/// @nodoc
mixin _$SourceInfo {
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SourceInfoCopyWith<SourceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceInfoCopyWith<$Res> {
  factory $SourceInfoCopyWith(
          SourceInfo value, $Res Function(SourceInfo) then) =
      _$SourceInfoCopyWithImpl<$Res, SourceInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "source_id") String? sourceId,
      @JsonKey(name: "source_url") String? sourceUrl,
      @JsonKey(name: "source_icon") String? sourceIcon,
      @JsonKey(name: "source_priority") int? sourcePriority});
}

/// @nodoc
class _$SourceInfoCopyWithImpl<$Res, $Val extends SourceInfo>
    implements $SourceInfoCopyWith<$Res> {
  _$SourceInfoCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourceInfoImplCopyWith<$Res>
    implements $SourceInfoCopyWith<$Res> {
  factory _$$SourceInfoImplCopyWith(
          _$SourceInfoImpl value, $Res Function(_$SourceInfoImpl) then) =
      __$$SourceInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "source_id") String? sourceId,
      @JsonKey(name: "source_url") String? sourceUrl,
      @JsonKey(name: "source_icon") String? sourceIcon,
      @JsonKey(name: "source_priority") int? sourcePriority});
}

/// @nodoc
class __$$SourceInfoImplCopyWithImpl<$Res>
    extends _$SourceInfoCopyWithImpl<$Res, _$SourceInfoImpl>
    implements _$$SourceInfoImplCopyWith<$Res> {
  __$$SourceInfoImplCopyWithImpl(
      _$SourceInfoImpl _value, $Res Function(_$SourceInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sourceId = freezed,
    Object? sourceUrl = freezed,
    Object? sourceIcon = freezed,
    Object? sourcePriority = freezed,
  }) {
    return _then(_$SourceInfoImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SourceInfoImpl implements _SourceInfo {
  const _$SourceInfoImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "source_id") this.sourceId,
      @JsonKey(name: "source_url") this.sourceUrl,
      @JsonKey(name: "source_icon") this.sourceIcon,
      @JsonKey(name: "source_priority") this.sourcePriority});

  factory _$SourceInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceInfoImplFromJson(json);

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
  String toString() {
    return 'SourceInfo(id: $id, sourceId: $sourceId, sourceUrl: $sourceUrl, sourceIcon: $sourceIcon, sourcePriority: $sourcePriority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            (identical(other.sourceIcon, sourceIcon) ||
                other.sourceIcon == sourceIcon) &&
            (identical(other.sourcePriority, sourcePriority) ||
                other.sourcePriority == sourcePriority));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, sourceId, sourceUrl, sourceIcon, sourcePriority);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceInfoImplCopyWith<_$SourceInfoImpl> get copyWith =>
      __$$SourceInfoImplCopyWithImpl<_$SourceInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourceInfoImplToJson(
      this,
    );
  }
}

abstract class _SourceInfo implements SourceInfo {
  const factory _SourceInfo(
          {@JsonKey(name: "_id") final String? id,
          @JsonKey(name: "source_id") final String? sourceId,
          @JsonKey(name: "source_url") final String? sourceUrl,
          @JsonKey(name: "source_icon") final String? sourceIcon,
          @JsonKey(name: "source_priority") final int? sourcePriority}) =
      _$SourceInfoImpl;

  factory _SourceInfo.fromJson(Map<String, dynamic> json) =
      _$SourceInfoImpl.fromJson;

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
  @JsonKey(ignore: true)
  _$$SourceInfoImplCopyWith<_$SourceInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedListRequest _$FeedListRequestFromJson(Map<String, dynamic> json) {
  return _FeedListRequest.fromJson(json);
}

/// @nodoc
mixin _$FeedListRequest {
  @JsonKey(name: "categoryIds")
  List<String>? get categoryIds => throw _privateConstructorUsedError;
  @JsonKey(name: "sourceIds")
  List<String>? get sourceIds => throw _privateConstructorUsedError;
  @JsonKey(name: "language")
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int? get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedListRequestCopyWith<FeedListRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedListRequestCopyWith<$Res> {
  factory $FeedListRequestCopyWith(
          FeedListRequest value, $Res Function(FeedListRequest) then) =
      _$FeedListRequestCopyWithImpl<$Res, FeedListRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "categoryIds") List<String>? categoryIds,
      @JsonKey(name: "sourceIds") List<String>? sourceIds,
      @JsonKey(name: "language") String? language,
      @JsonKey(name: "page") int? page});
}

/// @nodoc
class _$FeedListRequestCopyWithImpl<$Res, $Val extends FeedListRequest>
    implements $FeedListRequestCopyWith<$Res> {
  _$FeedListRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryIds = freezed,
    Object? sourceIds = freezed,
    Object? language = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      categoryIds: freezed == categoryIds
          ? _value.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sourceIds: freezed == sourceIds
          ? _value.sourceIds
          : sourceIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedListRequestImplCopyWith<$Res>
    implements $FeedListRequestCopyWith<$Res> {
  factory _$$FeedListRequestImplCopyWith(_$FeedListRequestImpl value,
          $Res Function(_$FeedListRequestImpl) then) =
      __$$FeedListRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "categoryIds") List<String>? categoryIds,
      @JsonKey(name: "sourceIds") List<String>? sourceIds,
      @JsonKey(name: "language") String? language,
      @JsonKey(name: "page") int? page});
}

/// @nodoc
class __$$FeedListRequestImplCopyWithImpl<$Res>
    extends _$FeedListRequestCopyWithImpl<$Res, _$FeedListRequestImpl>
    implements _$$FeedListRequestImplCopyWith<$Res> {
  __$$FeedListRequestImplCopyWithImpl(
      _$FeedListRequestImpl _value, $Res Function(_$FeedListRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryIds = freezed,
    Object? sourceIds = freezed,
    Object? language = freezed,
    Object? page = freezed,
  }) {
    return _then(_$FeedListRequestImpl(
      categoryIds: freezed == categoryIds
          ? _value._categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sourceIds: freezed == sourceIds
          ? _value._sourceIds
          : sourceIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedListRequestImpl implements _FeedListRequest {
  const _$FeedListRequestImpl(
      {@JsonKey(name: "categoryIds") final List<String>? categoryIds,
      @JsonKey(name: "sourceIds") final List<String>? sourceIds,
      @JsonKey(name: "language") this.language,
      @JsonKey(name: "page") this.page})
      : _categoryIds = categoryIds,
        _sourceIds = sourceIds;

  factory _$FeedListRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedListRequestImplFromJson(json);

  final List<String>? _categoryIds;
  @override
  @JsonKey(name: "categoryIds")
  List<String>? get categoryIds {
    final value = _categoryIds;
    if (value == null) return null;
    if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _sourceIds;
  @override
  @JsonKey(name: "sourceIds")
  List<String>? get sourceIds {
    final value = _sourceIds;
    if (value == null) return null;
    if (_sourceIds is EqualUnmodifiableListView) return _sourceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "language")
  final String? language;
  @override
  @JsonKey(name: "page")
  final int? page;

  @override
  String toString() {
    return 'FeedListRequest(categoryIds: $categoryIds, sourceIds: $sourceIds, language: $language, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedListRequestImpl &&
            const DeepCollectionEquality()
                .equals(other._categoryIds, _categoryIds) &&
            const DeepCollectionEquality()
                .equals(other._sourceIds, _sourceIds) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categoryIds),
      const DeepCollectionEquality().hash(_sourceIds),
      language,
      page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedListRequestImplCopyWith<_$FeedListRequestImpl> get copyWith =>
      __$$FeedListRequestImplCopyWithImpl<_$FeedListRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedListRequestImplToJson(
      this,
    );
  }
}

abstract class _FeedListRequest implements FeedListRequest {
  const factory _FeedListRequest(
      {@JsonKey(name: "categoryIds") final List<String>? categoryIds,
      @JsonKey(name: "sourceIds") final List<String>? sourceIds,
      @JsonKey(name: "language") final String? language,
      @JsonKey(name: "page") final int? page}) = _$FeedListRequestImpl;

  factory _FeedListRequest.fromJson(Map<String, dynamic> json) =
      _$FeedListRequestImpl.fromJson;

  @override
  @JsonKey(name: "categoryIds")
  List<String>? get categoryIds;
  @override
  @JsonKey(name: "sourceIds")
  List<String>? get sourceIds;
  @override
  @JsonKey(name: "language")
  String? get language;
  @override
  @JsonKey(name: "page")
  int? get page;
  @override
  @JsonKey(ignore: true)
  _$$FeedListRequestImplCopyWith<_$FeedListRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
