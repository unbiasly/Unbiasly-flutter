// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetCategoryResponse _$GetCategoryResponseFromJson(Map<String, dynamic> json) {
  return _GetCategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$GetCategoryResponse {
  @JsonKey(name: "articleCategory")
  List<ArticleCategory>? get articleCategory =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetCategoryResponseCopyWith<GetCategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCategoryResponseCopyWith<$Res> {
  factory $GetCategoryResponseCopyWith(
          GetCategoryResponse value, $Res Function(GetCategoryResponse) then) =
      _$GetCategoryResponseCopyWithImpl<$Res, GetCategoryResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "articleCategory")
      List<ArticleCategory>? articleCategory});
}

/// @nodoc
class _$GetCategoryResponseCopyWithImpl<$Res, $Val extends GetCategoryResponse>
    implements $GetCategoryResponseCopyWith<$Res> {
  _$GetCategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleCategory = freezed,
  }) {
    return _then(_value.copyWith(
      articleCategory: freezed == articleCategory
          ? _value.articleCategory
          : articleCategory // ignore: cast_nullable_to_non_nullable
              as List<ArticleCategory>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCategoryResponseImplCopyWith<$Res>
    implements $GetCategoryResponseCopyWith<$Res> {
  factory _$$GetCategoryResponseImplCopyWith(_$GetCategoryResponseImpl value,
          $Res Function(_$GetCategoryResponseImpl) then) =
      __$$GetCategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "articleCategory")
      List<ArticleCategory>? articleCategory});
}

/// @nodoc
class __$$GetCategoryResponseImplCopyWithImpl<$Res>
    extends _$GetCategoryResponseCopyWithImpl<$Res, _$GetCategoryResponseImpl>
    implements _$$GetCategoryResponseImplCopyWith<$Res> {
  __$$GetCategoryResponseImplCopyWithImpl(_$GetCategoryResponseImpl _value,
      $Res Function(_$GetCategoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleCategory = freezed,
  }) {
    return _then(_$GetCategoryResponseImpl(
      articleCategory: freezed == articleCategory
          ? _value._articleCategory
          : articleCategory // ignore: cast_nullable_to_non_nullable
              as List<ArticleCategory>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetCategoryResponseImpl implements _GetCategoryResponse {
  const _$GetCategoryResponseImpl(
      {@JsonKey(name: "articleCategory")
      final List<ArticleCategory>? articleCategory})
      : _articleCategory = articleCategory;

  factory _$GetCategoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetCategoryResponseImplFromJson(json);

  final List<ArticleCategory>? _articleCategory;
  @override
  @JsonKey(name: "articleCategory")
  List<ArticleCategory>? get articleCategory {
    final value = _articleCategory;
    if (value == null) return null;
    if (_articleCategory is EqualUnmodifiableListView) return _articleCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetCategoryResponse(articleCategory: $articleCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCategoryResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._articleCategory, _articleCategory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_articleCategory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCategoryResponseImplCopyWith<_$GetCategoryResponseImpl> get copyWith =>
      __$$GetCategoryResponseImplCopyWithImpl<_$GetCategoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetCategoryResponseImplToJson(
      this,
    );
  }
}

abstract class _GetCategoryResponse implements GetCategoryResponse {
  const factory _GetCategoryResponse(
          {@JsonKey(name: "articleCategory")
          final List<ArticleCategory>? articleCategory}) =
      _$GetCategoryResponseImpl;

  factory _GetCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$GetCategoryResponseImpl.fromJson;

  @override
  @JsonKey(name: "articleCategory")
  List<ArticleCategory>? get articleCategory;
  @override
  @JsonKey(ignore: true)
  _$$GetCategoryResponseImplCopyWith<_$GetCategoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArticleCategory _$ArticleCategoryFromJson(Map<String, dynamic> json) {
  return _ArticleCategory.fromJson(json);
}

/// @nodoc
mixin _$ArticleCategory {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "slug")
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "__v")
  int? get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleCategoryCopyWith<ArticleCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleCategoryCopyWith<$Res> {
  factory $ArticleCategoryCopyWith(
          ArticleCategory value, $Res Function(ArticleCategory) then) =
      _$ArticleCategoryCopyWithImpl<$Res, ArticleCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "__v") int? v});
}

/// @nodoc
class _$ArticleCategoryCopyWithImpl<$Res, $Val extends ArticleCategory>
    implements $ArticleCategoryCopyWith<$Res> {
  _$ArticleCategoryCopyWithImpl(this._value, this._then);

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
    Object? description = freezed,
    Object? image = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ArticleCategoryImplCopyWith<$Res>
    implements $ArticleCategoryCopyWith<$Res> {
  factory _$$ArticleCategoryImplCopyWith(_$ArticleCategoryImpl value,
          $Res Function(_$ArticleCategoryImpl) then) =
      __$$ArticleCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "slug") String? slug,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "image") String? image,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "updatedAt") DateTime? updatedAt,
      @JsonKey(name: "__v") int? v});
}

/// @nodoc
class __$$ArticleCategoryImplCopyWithImpl<$Res>
    extends _$ArticleCategoryCopyWithImpl<$Res, _$ArticleCategoryImpl>
    implements _$$ArticleCategoryImplCopyWith<$Res> {
  __$$ArticleCategoryImplCopyWithImpl(
      _$ArticleCategoryImpl _value, $Res Function(_$ArticleCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(_$ArticleCategoryImpl(
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
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
class _$ArticleCategoryImpl implements _ArticleCategory {
  const _$ArticleCategoryImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "slug") this.slug,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "image") this.image,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt,
      @JsonKey(name: "__v") this.v});

  factory _$ArticleCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleCategoryImplFromJson(json);

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
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "image")
  final String? image;
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
    return 'ArticleCategory(id: $id, name: $name, slug: $slug, description: $description, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, slug, description, image, createdAt, updatedAt, v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleCategoryImplCopyWith<_$ArticleCategoryImpl> get copyWith =>
      __$$ArticleCategoryImplCopyWithImpl<_$ArticleCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleCategoryImplToJson(
      this,
    );
  }
}

abstract class _ArticleCategory implements ArticleCategory {
  const factory _ArticleCategory(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "slug") final String? slug,
      @JsonKey(name: "description") final String? description,
      @JsonKey(name: "image") final String? image,
      @JsonKey(name: "createdAt") final DateTime? createdAt,
      @JsonKey(name: "updatedAt") final DateTime? updatedAt,
      @JsonKey(name: "__v") final int? v}) = _$ArticleCategoryImpl;

  factory _ArticleCategory.fromJson(Map<String, dynamic> json) =
      _$ArticleCategoryImpl.fromJson;

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
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "image")
  String? get image;
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
  _$$ArticleCategoryImplCopyWith<_$ArticleCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
