// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ribbon_segment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RibbonSegment {
  /// The source event this segment renders.
  CalendarEvent get event;

  /// Zero-based column index where the segment starts (0 = leftmost).
  int get startColumn;

  /// Zero-based column index where the segment ends, inclusive.
  int get endColumn;

  /// Vertical lane assignment within the week row (0-based).
  int get lane;

  /// Whether the event continues from the previous week (clipped left).
  bool get continuesFromPreviousWeek;

  /// Whether the event continues into the next week (clipped right).
  bool get continuesIntoNextWeek;

  /// Create a copy of RibbonSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RibbonSegmentCopyWith<RibbonSegment> get copyWith =>
      _$RibbonSegmentCopyWithImpl<RibbonSegment>(
          this as RibbonSegment, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RibbonSegment &&
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

  @override
  String toString() {
    return 'RibbonSegment(event: $event, startColumn: $startColumn, endColumn: $endColumn, lane: $lane, continuesFromPreviousWeek: $continuesFromPreviousWeek, continuesIntoNextWeek: $continuesIntoNextWeek)';
  }
}

/// @nodoc
abstract mixin class $RibbonSegmentCopyWith<$Res> {
  factory $RibbonSegmentCopyWith(
          RibbonSegment value, $Res Function(RibbonSegment) _then) =
      _$RibbonSegmentCopyWithImpl;
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
class _$RibbonSegmentCopyWithImpl<$Res>
    implements $RibbonSegmentCopyWith<$Res> {
  _$RibbonSegmentCopyWithImpl(this._self, this._then);

  final RibbonSegment _self;
  final $Res Function(RibbonSegment) _then;

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
    return _then(_self.copyWith(
      event: null == event
          ? _self.event
          : event // ignore: cast_nullable_to_non_nullable
              as CalendarEvent,
      startColumn: null == startColumn
          ? _self.startColumn
          : startColumn // ignore: cast_nullable_to_non_nullable
              as int,
      endColumn: null == endColumn
          ? _self.endColumn
          : endColumn // ignore: cast_nullable_to_non_nullable
              as int,
      lane: null == lane
          ? _self.lane
          : lane // ignore: cast_nullable_to_non_nullable
              as int,
      continuesFromPreviousWeek: null == continuesFromPreviousWeek
          ? _self.continuesFromPreviousWeek
          : continuesFromPreviousWeek // ignore: cast_nullable_to_non_nullable
              as bool,
      continuesIntoNextWeek: null == continuesIntoNextWeek
          ? _self.continuesIntoNextWeek
          : continuesIntoNextWeek // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of RibbonSegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalendarEventCopyWith<$Res> get event {
    return $CalendarEventCopyWith<$Res>(_self.event, (value) {
      return _then(_self.copyWith(event: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RibbonSegment].
extension RibbonSegmentPatterns on RibbonSegment {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RibbonSegment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RibbonSegment() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RibbonSegment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RibbonSegment():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RibbonSegment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RibbonSegment() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            CalendarEvent event,
            int startColumn,
            int endColumn,
            int lane,
            bool continuesFromPreviousWeek,
            bool continuesIntoNextWeek)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RibbonSegment() when $default != null:
        return $default(
            _that.event,
            _that.startColumn,
            _that.endColumn,
            _that.lane,
            _that.continuesFromPreviousWeek,
            _that.continuesIntoNextWeek);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            CalendarEvent event,
            int startColumn,
            int endColumn,
            int lane,
            bool continuesFromPreviousWeek,
            bool continuesIntoNextWeek)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RibbonSegment():
        return $default(
            _that.event,
            _that.startColumn,
            _that.endColumn,
            _that.lane,
            _that.continuesFromPreviousWeek,
            _that.continuesIntoNextWeek);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            CalendarEvent event,
            int startColumn,
            int endColumn,
            int lane,
            bool continuesFromPreviousWeek,
            bool continuesIntoNextWeek)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RibbonSegment() when $default != null:
        return $default(
            _that.event,
            _that.startColumn,
            _that.endColumn,
            _that.lane,
            _that.continuesFromPreviousWeek,
            _that.continuesIntoNextWeek);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RibbonSegment implements RibbonSegment {
  const _RibbonSegment(
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

  /// Create a copy of RibbonSegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RibbonSegmentCopyWith<_RibbonSegment> get copyWith =>
      __$RibbonSegmentCopyWithImpl<_RibbonSegment>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RibbonSegment &&
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

  @override
  String toString() {
    return 'RibbonSegment(event: $event, startColumn: $startColumn, endColumn: $endColumn, lane: $lane, continuesFromPreviousWeek: $continuesFromPreviousWeek, continuesIntoNextWeek: $continuesIntoNextWeek)';
  }
}

/// @nodoc
abstract mixin class _$RibbonSegmentCopyWith<$Res>
    implements $RibbonSegmentCopyWith<$Res> {
  factory _$RibbonSegmentCopyWith(
          _RibbonSegment value, $Res Function(_RibbonSegment) _then) =
      __$RibbonSegmentCopyWithImpl;
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
class __$RibbonSegmentCopyWithImpl<$Res>
    implements _$RibbonSegmentCopyWith<$Res> {
  __$RibbonSegmentCopyWithImpl(this._self, this._then);

  final _RibbonSegment _self;
  final $Res Function(_RibbonSegment) _then;

  /// Create a copy of RibbonSegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? event = null,
    Object? startColumn = null,
    Object? endColumn = null,
    Object? lane = null,
    Object? continuesFromPreviousWeek = null,
    Object? continuesIntoNextWeek = null,
  }) {
    return _then(_RibbonSegment(
      event: null == event
          ? _self.event
          : event // ignore: cast_nullable_to_non_nullable
              as CalendarEvent,
      startColumn: null == startColumn
          ? _self.startColumn
          : startColumn // ignore: cast_nullable_to_non_nullable
              as int,
      endColumn: null == endColumn
          ? _self.endColumn
          : endColumn // ignore: cast_nullable_to_non_nullable
              as int,
      lane: null == lane
          ? _self.lane
          : lane // ignore: cast_nullable_to_non_nullable
              as int,
      continuesFromPreviousWeek: null == continuesFromPreviousWeek
          ? _self.continuesFromPreviousWeek
          : continuesFromPreviousWeek // ignore: cast_nullable_to_non_nullable
              as bool,
      continuesIntoNextWeek: null == continuesIntoNextWeek
          ? _self.continuesIntoNextWeek
          : continuesIntoNextWeek // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of RibbonSegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalendarEventCopyWith<$Res> get event {
    return $CalendarEventCopyWith<$Res>(_self.event, (value) {
      return _then(_self.copyWith(event: value));
    });
  }
}

// dart format on
