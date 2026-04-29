// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalendarEvent _$CalendarEventFromJson(Map<String, dynamic> json) {
  return _CalendarEvent.fromJson(json);
}

/// @nodoc
mixin _$CalendarEvent {
  /// Stable identifier. Used as the widget key when rendering.
  String get id => throw _privateConstructorUsedError;

  /// Display title shown in the ribbon/chip.
  String get title => throw _privateConstructorUsedError;

  /// Start of the event (inclusive).
  DateTime get start => throw _privateConstructorUsedError;

  /// End of the event (inclusive). Must be `>= start`.
  DateTime get end => throw _privateConstructorUsedError;

  /// Ribbon/chip background color.
  @ColorConverter()
  Color get color => throw _privateConstructorUsedError;

  /// Optional secondary line shown beneath the title (where space allows).
  String? get subtitle => throw _privateConstructorUsedError;

  /// Arbitrary consumer-attached metadata. Round-trips through JSON
  /// only if its values are JSON-encodable.
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this CalendarEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalendarEventCopyWith<CalendarEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEventCopyWith<$Res> {
  factory $CalendarEventCopyWith(
          CalendarEvent value, $Res Function(CalendarEvent) then) =
      _$CalendarEventCopyWithImpl<$Res, CalendarEvent>;
  @useResult
  $Res call(
      {String id,
      String title,
      DateTime start,
      DateTime end,
      @ColorConverter() Color color,
      String? subtitle,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$CalendarEventCopyWithImpl<$Res, $Val extends CalendarEvent>
    implements $CalendarEventCopyWith<$Res> {
  _$CalendarEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? start = null,
    Object? end = null,
    Object? color = null,
    Object? subtitle = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarEventImplCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$$CalendarEventImplCopyWith(
          _$CalendarEventImpl value, $Res Function(_$CalendarEventImpl) then) =
      __$$CalendarEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      DateTime start,
      DateTime end,
      @ColorConverter() Color color,
      String? subtitle,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$CalendarEventImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$CalendarEventImpl>
    implements _$$CalendarEventImplCopyWith<$Res> {
  __$$CalendarEventImplCopyWithImpl(
      _$CalendarEventImpl _value, $Res Function(_$CalendarEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? start = null,
    Object? end = null,
    Object? color = null,
    Object? subtitle = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$CalendarEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalendarEventImpl implements _CalendarEvent {
  const _$CalendarEventImpl(
      {required this.id,
      required this.title,
      required this.start,
      required this.end,
      @ColorConverter() this.color = const Color(0xFF3B82F6),
      this.subtitle,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$CalendarEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarEventImplFromJson(json);

  /// Stable identifier. Used as the widget key when rendering.
  @override
  final String id;

  /// Display title shown in the ribbon/chip.
  @override
  final String title;

  /// Start of the event (inclusive).
  @override
  final DateTime start;

  /// End of the event (inclusive). Must be `>= start`.
  @override
  final DateTime end;

  /// Ribbon/chip background color.
  @override
  @JsonKey()
  @ColorConverter()
  final Color color;

  /// Optional secondary line shown beneath the title (where space allows).
  @override
  final String? subtitle;

  /// Arbitrary consumer-attached metadata. Round-trips through JSON
  /// only if its values are JSON-encodable.
  final Map<String, dynamic>? _metadata;

  /// Arbitrary consumer-attached metadata. Round-trips through JSON
  /// only if its values are JSON-encodable.
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CalendarEvent(id: $id, title: $title, start: $start, end: $end, color: $color, subtitle: $subtitle, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, start, end, color,
      subtitle, const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarEventImplCopyWith<_$CalendarEventImpl> get copyWith =>
      __$$CalendarEventImplCopyWithImpl<_$CalendarEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarEventImplToJson(
      this,
    );
  }
}

abstract class _CalendarEvent implements CalendarEvent {
  const factory _CalendarEvent(
      {required final String id,
      required final String title,
      required final DateTime start,
      required final DateTime end,
      @ColorConverter() final Color color,
      final String? subtitle,
      final Map<String, dynamic>? metadata}) = _$CalendarEventImpl;

  factory _CalendarEvent.fromJson(Map<String, dynamic> json) =
      _$CalendarEventImpl.fromJson;

  /// Stable identifier. Used as the widget key when rendering.
  @override
  String get id;

  /// Display title shown in the ribbon/chip.
  @override
  String get title;

  /// Start of the event (inclusive).
  @override
  DateTime get start;

  /// End of the event (inclusive). Must be `>= start`.
  @override
  DateTime get end;

  /// Ribbon/chip background color.
  @override
  @ColorConverter()
  Color get color;

  /// Optional secondary line shown beneath the title (where space allows).
  @override
  String? get subtitle;

  /// Arbitrary consumer-attached metadata. Round-trips through JSON
  /// only if its values are JSON-encodable.
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalendarEventImplCopyWith<_$CalendarEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
