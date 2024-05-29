// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetTagResponse _$GetTagResponseFromJson(Map<String, dynamic> json) {
  return _GetTagResponse.fromJson(json);
}

/// @nodoc
mixin _$GetTagResponse {
  @JsonKey(name: "source")
  List<Source>? get source => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetTagResponseCopyWith<GetTagResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTagResponseCopyWith<$Res> {
  factory $GetTagResponseCopyWith(
          GetTagResponse value, $Res Function(GetTagResponse) then) =
      _$GetTagResponseCopyWithImpl<$Res, GetTagResponse>;
  @useResult
  $Res call({@JsonKey(name: "source") List<Source>? source});
}

/// @nodoc
class _$GetTagResponseCopyWithImpl<$Res, $Val extends GetTagResponse>
    implements $GetTagResponseCopyWith<$Res> {
  _$GetTagResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = freezed,
  }) {
    return _then(_value.copyWith(
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as List<Source>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetTagResponseImplCopyWith<$Res>
    implements $GetTagResponseCopyWith<$Res> {
  factory _$$GetTagResponseImplCopyWith(_$GetTagResponseImpl value,
          $Res Function(_$GetTagResponseImpl) then) =
      __$$GetTagResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "source") List<Source>? source});
}

/// @nodoc
class __$$GetTagResponseImplCopyWithImpl<$Res>
    extends _$GetTagResponseCopyWithImpl<$Res, _$GetTagResponseImpl>
    implements _$$GetTagResponseImplCopyWith<$Res> {
  __$$GetTagResponseImplCopyWithImpl(
      _$GetTagResponseImpl _value, $Res Function(_$GetTagResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = freezed,
  }) {
    return _then(_$GetTagResponseImpl(
      source: freezed == source
          ? _value._source
          : source // ignore: cast_nullable_to_non_nullable
              as List<Source>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetTagResponseImpl implements _GetTagResponse {
  const _$GetTagResponseImpl(
      {@JsonKey(name: "source") final List<Source>? source})
      : _source = source;

  factory _$GetTagResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetTagResponseImplFromJson(json);

  final List<Source>? _source;
  @override
  @JsonKey(name: "source")
  List<Source>? get source {
    final value = _source;
    if (value == null) return null;
    if (_source is EqualUnmodifiableListView) return _source;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetTagResponse(source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTagResponseImpl &&
            const DeepCollectionEquality().equals(other._source, _source));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_source));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTagResponseImplCopyWith<_$GetTagResponseImpl> get copyWith =>
      __$$GetTagResponseImplCopyWithImpl<_$GetTagResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetTagResponseImplToJson(
      this,
    );
  }
}

abstract class _GetTagResponse implements GetTagResponse {
  const factory _GetTagResponse(
          {@JsonKey(name: "source") final List<Source>? source}) =
      _$GetTagResponseImpl;

  factory _GetTagResponse.fromJson(Map<String, dynamic> json) =
      _$GetTagResponseImpl.fromJson;

  @override
  @JsonKey(name: "source")
  List<Source>? get source;
  @override
  @JsonKey(ignore: true)
  _$$GetTagResponseImplCopyWith<_$GetTagResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Source _$SourceFromJson(Map<String, dynamic> json) {
  return _Source.fromJson(json);
}

/// @nodoc
mixin _$Source {
  @JsonKey(name: "source_priority")
  int? get sourcePriority => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "source_id")
  String? get sourceId => throw _privateConstructorUsedError;
  @JsonKey(name: "source_url")
  String? get sourceUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "source_icon")
  String? get sourceIcon => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "source_priority") int? sourcePriority,
      @JsonKey(name: "_id") String? id,
      @JsonKey(name: "source_id") String? sourceId,
      @JsonKey(name: "source_url") String? sourceUrl,
      @JsonKey(name: "source_icon") String? sourceIcon});
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
    Object? sourcePriority = freezed,
    Object? id = freezed,
    Object? sourceId = freezed,
    Object? sourceUrl = freezed,
    Object? sourceIcon = freezed,
  }) {
    return _then(_value.copyWith(
      sourcePriority: freezed == sourcePriority
          ? _value.sourcePriority
          : sourcePriority // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {@JsonKey(name: "source_priority") int? sourcePriority,
      @JsonKey(name: "_id") String? id,
      @JsonKey(name: "source_id") String? sourceId,
      @JsonKey(name: "source_url") String? sourceUrl,
      @JsonKey(name: "source_icon") String? sourceIcon});
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
    Object? sourcePriority = freezed,
    Object? id = freezed,
    Object? sourceId = freezed,
    Object? sourceUrl = freezed,
    Object? sourceIcon = freezed,
  }) {
    return _then(_$SourceImpl(
      sourcePriority: freezed == sourcePriority
          ? _value.sourcePriority
          : sourcePriority // ignore: cast_nullable_to_non_nullable
              as int?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SourceImpl implements _Source {
  const _$SourceImpl(
      {@JsonKey(name: "source_priority") this.sourcePriority,
      @JsonKey(name: "_id") this.id,
      @JsonKey(name: "source_id") this.sourceId,
      @JsonKey(name: "source_url") this.sourceUrl,
      @JsonKey(name: "source_icon") this.sourceIcon});

  factory _$SourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceImplFromJson(json);

  @override
  @JsonKey(name: "source_priority")
  final int? sourcePriority;
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
  String toString() {
    return 'Source(sourcePriority: $sourcePriority, id: $id, sourceId: $sourceId, sourceUrl: $sourceUrl, sourceIcon: $sourceIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceImpl &&
            (identical(other.sourcePriority, sourcePriority) ||
                other.sourcePriority == sourcePriority) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            (identical(other.sourceIcon, sourceIcon) ||
                other.sourceIcon == sourceIcon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, sourcePriority, id, sourceId, sourceUrl, sourceIcon);

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
      {@JsonKey(name: "source_priority") final int? sourcePriority,
      @JsonKey(name: "_id") final String? id,
      @JsonKey(name: "source_id") final String? sourceId,
      @JsonKey(name: "source_url") final String? sourceUrl,
      @JsonKey(name: "source_icon") final String? sourceIcon}) = _$SourceImpl;

  factory _Source.fromJson(Map<String, dynamic> json) = _$SourceImpl.fromJson;

  @override
  @JsonKey(name: "source_priority")
  int? get sourcePriority;
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
  @JsonKey(ignore: true)
  _$$SourceImplCopyWith<_$SourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
