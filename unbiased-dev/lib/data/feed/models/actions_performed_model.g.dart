// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions_performed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActionPerformedResponseImpl _$$ActionPerformedResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ActionPerformedResponseImpl(
      isLiked: json['is_liked'] as bool?,
      isDisliked: json['is_disliked'] as bool?,
      isBookmarked: json['is_bookmarked'] as bool?,
      isViewed: json['is_viewed'] as bool?,
      isShared: json['is_shared'] as bool?,
      sharedCount: json['shared_count'] as int?,
      id: json['_id'] as String?,
      userId: json['user_id'] as String?,
      articleId: json['article_id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$$ActionPerformedResponseImplToJson(
        _$ActionPerformedResponseImpl instance) =>
    <String, dynamic>{
      'is_liked': instance.isLiked,
      'is_disliked': instance.isDisliked,
      'is_bookmarked': instance.isBookmarked,
      'is_viewed': instance.isViewed,
      'is_shared': instance.isShared,
      'shared_count': instance.sharedCount,
      '_id': instance.id,
      'user_id': instance.userId,
      'article_id': instance.articleId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
