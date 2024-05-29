// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_username_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateUsernameRequestImpl _$$UpdateUsernameRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateUsernameRequestImpl(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$UpdateUsernameRequestImplToJson(
        _$UpdateUsernameRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$UpdateUsernameResponseImpl _$$UpdateUsernameResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateUsernameResponseImpl(
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$$UpdateUsernameResponseImplToJson(
        _$UpdateUsernameResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
    };
