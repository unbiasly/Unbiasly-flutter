// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportRequestImpl _$$ReportRequestImplFromJson(Map<String, dynamic> json) =>
    _$ReportRequestImpl(
      articleId: json['article_id'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$ReportRequestImplToJson(_$ReportRequestImpl instance) =>
    <String, dynamic>{
      'article_id': instance.articleId,
      'reason': instance.reason,
    };

_$ReportResponseImpl _$$ReportResponseImplFromJson(Map<String, dynamic> json) =>
    _$ReportResponseImpl(
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$ReportResponseImplToJson(
        _$ReportResponseImpl instance) =>
    <String, dynamic>{
      'reason': instance.reason,
    };
