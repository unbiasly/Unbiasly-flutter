// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetTagResponseImpl _$$GetTagResponseImplFromJson(Map<String, dynamic> json) =>
    _$GetTagResponseImpl(
      source: (json['source'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetTagResponseImplToJson(
        _$GetTagResponseImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
    };

_$SourceImpl _$$SourceImplFromJson(Map<String, dynamic> json) => _$SourceImpl(
      sourcePriority: json['source_priority'] as int?,
      id: json['_id'] as String?,
      sourceId: json['source_id'] as String?,
      sourceUrl: json['source_url'] as String?,
      sourceIcon: json['source_icon'] as String?,
    );

Map<String, dynamic> _$$SourceImplToJson(_$SourceImpl instance) =>
    <String, dynamic>{
      'source_priority': instance.sourcePriority,
      '_id': instance.id,
      'source_id': instance.sourceId,
      'source_url': instance.sourceUrl,
      'source_icon': instance.sourceIcon,
    };
