// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ribbon_segment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RibbonSegment {
  /// The source event this segment renders.
  CalendarEvent get event => throw _privateConstructorUsedError;

  /// Zero-based column index where the segment starts (0 = leftmost).
  int get startColumn => throw _privateConstructorUsedError;

  /// Zero-based column index where the segment ends, inclusive.
  int get endColumn => throw _privateConstructorUsedError;

  /// Vertical lane assignment within the week row (0-based).
  int get lane => throw _privateConstructorUsedError;

  /// Whether the event continues from the previous week (clipped left).
  bool get continuesFromPreviousWeek => throw _privateConstructorUsedError;

  /// Whether the event continues into the next week (clipped right).
  bool get continuesIntoNextWeek => throw _privateConstructorUsedError;

  /// Create a copy of RibbonSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RibbonSegmentCopyWith<RibbonSegment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RibbonSegmentCopyWith<$Res> {
  factory $RibbonSegmentCopyWith(
          RibbonSegment value, $Res Function(RibbonSegment) then) =
      _$RibbonSegmentCopyWithImpl<$Res, RibbonSegment>;
  @useResult
  $Res call(
      {CalendarEvent event,
      int startColumn,
      int endColumn,
      int lane,
      bool continuesFromPreviousWeek,
      bool continuesIntoNextWeek});

  $CalendarEventCopyWith<$Res> get event;
}

/// @nodoc
class _$RibbonSegmentCopyWithImpl<$Res, $Val extends RibbonSegment>
    implements $RibbonSegmentCopyWith<$Res> {
  _$RibbonSegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RibbonSegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? startColumn = null,
    Object? endColumn = null,
    Object? lane = null,
    Object? continuesFromPreviousWeek = null,
    Object? continuesIntoNextWeek = null,
  }) {
    return _then(_value.copyWith(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as CalendarEvent,
      startColumn: null == startColumn
          ? _value.startColumn
          : startColumn // ignore: cast_nullable_to_non_nullable
              as int,
      endColumn: null == endColumn
          ? _value.endColumn
          : endColumn // ignore: cast_nullable_to_non_nullable
              as int,
      lane: null == lane
          ? _value.lane
          : lane // ignore: cast_nullable_to_non_nullable
              as int,
      continuesFromPreviousWeek: null == continuesFromPreviousWeek
          ? _value.continuesFromPreviousWeek
          : continuesFromPreviousWeek // ignore: cast_nullable_to_non_nullable
              as bool,
      continuesIntoNextWeek: null == continuesIntoNextWeek
          ? _value.continuesIntoNextWeek
          : continuesIntoNextWeek // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of RibbonSegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalendarEventCopyWith<$Res> get event {
    return $CalendarEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RibbonSegmentImplCopyWith<$Res>
    implements $RibbonSegmentCopyWith<$Res> {
  factory _$$RibbonSegmentImplCopyWith(
          _$RibbonSegmentImpl value, $Res Function(_$RibbonSegmentImpl) then) =
      __$$RibbonSegmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CalendarEvent event,
      int startColumn,
      int endColumn,
      int lane,
      bool continuesFromPreviousWeek,
      bool continuesIntoNextWeek});

  @override
  $CalendarEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$RibbonSegmentImplCopyWithImpl<$Res>
    extends _$RibbonSegmentCopyWithImpl<$Res, _$RibbonSegmentImpl>
    implements _$$RibbonSegmentImplCopyWith<$Res> {
  __$$RibbonSegmentImplCopyWithImpl(
      _$RibbonSegmentImpl _value, $Res Function(_$RibbonSegmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of RibbonSegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? startColumn = null,
    Object? endColumn = null,
    Object? lane = null,
    Object? continuesFromPreviousWeek = null,
    Object? continuesIntoNextWeek = null,
  }) {
    return _then(_$RibbonSegmentImpl(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as CalendarEvent,
      startColumn: null == startColumn
          ? _value.startColumn
          : startColumn // ignore: cast_nullable_to_non_nullable
              as int,
      endColumn: null == endColumn
          ? _value.endColumn
          : endColumn // ignore: cast_nullable_to_non_nullable
              as int,
      lane: null == lane
          ? _value.lane
          : lane // ignore: cast_nullable_to_non_nullable
              as int,
      continuesFromPreviousWeek: null == continuesFromPreviousWeek
          ? _value.continuesFromPreviousWeek
          : continuesFromPreviousWeek // ignore: cast_nullable_to_non_nullable
              as bool,
      continuesIntoNextWeek: null == continuesIntoNextWeek
          ? _value.continuesIntoNextWeek
          : continuesIntoNextWeek // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RibbonSegmentImpl implements _RibbonSegment {
  const _$RibbonSegmentImpl(
      {required this.event,
      required this.startColumn,
      required this.endColumn,
      required this.lane,
      required this.continuesFromPreviousWeek,
      required this.continuesIntoNextWeek});

  /// The source event this segment renders.
  @override
  final CalendarEvent event;

  /// Zero-based column index where the segment starts (0 = leftmost).
  @override
  final int startColumn;

  /// Zero-based column index where the segment ends, inclusive.
  @override
  final int endColumn;

  /// Vertical lane assignment within the week row (0-based).
  @override
  final int lane;

  /// Whether the event continues from the previous week (clipped left).
  @override
  final bool continuesFromPreviousWeek;

  /// Whether the event continues into the next week (clipped right).
  @override
  final bool continuesIntoNextWeek;

  @override
  String toString() {
    return 'RibbonSegment(event: $event, startColumn: $startColumn, endColumn: $endColumn, lane: $lane, continuesFromPreviousWeek: $continuesFromPreviousWeek, continuesIntoNextWeek: $continuesIntoNextWeek)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RibbonSegmentImpl &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.startColumn, startColumn) ||
                other.startColumn == startColumn) &&
            (identical(other.endColumn, endColumn) ||
                other.endColumn == endColumn) &&
            (identical(other.lane, lane) || other.lane == lane) &&
            (identical(other.continuesFromPreviousWeek,
                    continuesFromPreviousWeek) ||
                other.continuesFromPreviousWeek == continuesFromPreviousWeek) &&
            (identical(other.continuesIntoNextWeek, continuesIntoNextWeek) ||
                other.continuesIntoNextWeek == continuesIntoNextWeek));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event, startColumn, endColumn,
      lane, continuesFromPreviousWeek, continuesIntoNextWeek);

  /// Create a copy of RibbonSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RibbonSegmentImplCopyWith<_$RibbonSegmentImpl> get copyWith =>
      __$$RibbonSegmentImplCopyWithImpl<_$RibbonSegmentImpl>(this, _$identity);
}

abstract class _RibbonSegment implements RibbonSegment {
  const factory _RibbonSegment(
      {required final CalendarEvent event,
      required final int startColumn,
      required final int endColumn,
      required final int lane,
      required final bool continuesFromPreviousWeek,
      required final bool continuesIntoNextWeek}) = _$RibbonSegmentImpl;

  /// The source event this segment renders.
  @override
  CalendarEvent get event;

  /// Zero-based column index where the segment starts (0 = leftmost).
  @override
  int get startColumn;

  /// Zero-based column index where the segment ends, inclusive.
  @override
  int get endColumn;

  /// Vertical lane assignment within the week row (0-based).
  @override
  int get lane;

  /// Whether the event continues from the previous week (clipped left).
  @override
  bool get continuesFromPreviousWeek;

  /// Whether the event continues into the next week (clipped right).
  @override
  bool get continuesIntoNextWeek;

  /// Create a copy of RibbonSegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RibbonSegmentImplCopyWith<_$RibbonSegmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
