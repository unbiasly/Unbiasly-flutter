// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedBackResponseImpl _$$FeedBackResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FeedBackResponseImpl(
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$FeedBackResponseImplToJson(
        _$FeedBackResponseImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };

_$FeedBackRequestImpl _$$FeedBackRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$FeedBackRequestImpl(
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$FeedBackRequestImplToJson(
        _$FeedBackRequestImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
