// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalendarConfig {
  /// Day of week shown in the leftmost column.
  /// 1 = Monday, 7 = Sunday (ISO 8601).
  int get firstDayOfWeek;

  /// Maximum number of event lanes shown per day cell before
  /// remaining events collapse into a "+N more" indicator.
  ///
  /// Default `4` fits comfortably in typical mobile cell heights and
  /// matches Google Calendar's mobile month view.
  int get maxVisibleLanes;

  /// Whether to show weekday labels in the header row.
  bool get showWeekdayLabels;

  /// Locale identifier for weekday and month labels (e.g. `'en_US'`).
  /// When null, falls back to the ambient locale of the build context.
  String? get locale;

  /// Create a copy of CalendarConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CalendarConfigCopyWith<CalendarConfig> get copyWith =>
      _$CalendarConfigCopyWithImpl<CalendarConfig>(
          this as CalendarConfig, _$identity);

  /// Serializes this CalendarConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalendarConfig &&
            (identical(other.firstDayOfWeek, firstDayOfWeek) ||
                other.firstDayOfWeek == firstDayOfWeek) &&
            (identical(other.maxVisibleLanes, maxVisibleLanes) ||
                other.maxVisibleLanes == maxVisibleLanes) &&
            (identical(other.showWeekdayLabels, showWeekdayLabels) ||
                other.showWeekdayLabels == showWeekdayLabels) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, firstDayOfWeek, maxVisibleLanes, showWeekdayLabels, locale);

  @override
  String toString() {
    return 'CalendarConfig(firstDayOfWeek: $firstDayOfWeek, maxVisibleLanes: $maxVisibleLanes, showWeekdayLabels: $showWeekdayLabels, locale: $locale)';
  }
}

/// @nodoc
abstract mixin class $CalendarConfigCopyWith<$Res> {
  factory $CalendarConfigCopyWith(
          CalendarConfig value, $Res Function(CalendarConfig) _then) =
      _$CalendarConfigCopyWithImpl;
  @useResult
  $Res call(
      {int firstDayOfWeek,
      int maxVisibleLanes,
      bool showWeekdayLabels,
      String? locale});
}

/// @nodoc
class _$CalendarConfigCopyWithImpl<$Res>
    implements $CalendarConfigCopyWith<$Res> {
  _$CalendarConfigCopyWithImpl(this._self, this._then);

  final CalendarConfig _self;
  final $Res Function(CalendarConfig) _then;

  /// Create a copy of CalendarConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstDayOfWeek = null,
    Object? maxVisibleLanes = null,
    Object? showWeekdayLabels = null,
    Object? locale = freezed,
  }) {
    return _then(_self.copyWith(
      firstDayOfWeek: null == firstDayOfWeek
          ? _self.firstDayOfWeek
          : firstDayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      maxVisibleLanes: null == maxVisibleLanes
          ? _self.maxVisibleLanes
          : maxVisibleLanes // ignore: cast_nullable_to_non_nullable
              as int,
      showWeekdayLabels: null == showWeekdayLabels
          ? _self.showWeekdayLabels
          : showWeekdayLabels // ignore: cast_nullable_to_non_nullable
              as bool,
      locale: freezed == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CalendarConfig].
extension CalendarConfigPatterns on CalendarConfig {
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
    TResult Function(_CalendarConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CalendarConfig() when $default != null:
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
    TResult Function(_CalendarConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarConfig():
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
    TResult? Function(_CalendarConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarConfig() when $default != null:
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
    TResult Function(int firstDayOfWeek, int maxVisibleLanes,
            bool showWeekdayLabels, String? locale)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CalendarConfig() when $default != null:
        return $default(_that.firstDayOfWeek, _that.maxVisibleLanes,
            _that.showWeekdayLabels, _that.locale);
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
    TResult Function(int firstDayOfWeek, int maxVisibleLanes,
            bool showWeekdayLabels, String? locale)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarConfig():
        return $default(_that.firstDayOfWeek, _that.maxVisibleLanes,
            _that.showWeekdayLabels, _that.locale);
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
    TResult? Function(int firstDayOfWeek, int maxVisibleLanes,
            bool showWeekdayLabels, String? locale)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CalendarConfig() when $default != null:
        return $default(_that.firstDayOfWeek, _that.maxVisibleLanes,
            _that.showWeekdayLabels, _that.locale);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CalendarConfig implements CalendarConfig {
  const _CalendarConfig(
      {this.firstDayOfWeek = DateTime.monday,
      this.maxVisibleLanes = 4,
      this.showWeekdayLabels = true,
      this.locale});
  factory _CalendarConfig.fromJson(Map<String, dynamic> json) =>
      _$CalendarConfigFromJson(json);

  /// Day of week shown in the leftmost column.
  /// 1 = Monday, 7 = Sunday (ISO 8601).
  @override
  @JsonKey()
  final int firstDayOfWeek;

  /// Maximum number of event lanes shown per day cell before
  /// remaining events collapse into a "+N more" indicator.
  ///
  /// Default `4` fits comfortably in typical mobile cell heights and
  /// matches Google Calendar's mobile month view.
  @override
  @JsonKey()
  final int maxVisibleLanes;

  /// Whether to show weekday labels in the header row.
  @override
  @JsonKey()
  final bool showWeekdayLabels;

  /// Locale identifier for weekday and month labels (e.g. `'en_US'`).
  /// When null, falls back to the ambient locale of the build context.
  @override
  final String? locale;

  /// Create a copy of CalendarConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CalendarConfigCopyWith<_CalendarConfig> get copyWith =>
      __$CalendarConfigCopyWithImpl<_CalendarConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CalendarConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalendarConfig &&
            (identical(other.firstDayOfWeek, firstDayOfWeek) ||
                other.firstDayOfWeek == firstDayOfWeek) &&
            (identical(other.maxVisibleLanes, maxVisibleLanes) ||
                other.maxVisibleLanes == maxVisibleLanes) &&
            (identical(other.showWeekdayLabels, showWeekdayLabels) ||
                other.showWeekdayLabels == showWeekdayLabels) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, firstDayOfWeek, maxVisibleLanes, showWeekdayLabels, locale);

  @override
  String toString() {
    return 'CalendarConfig(firstDayOfWeek: $firstDayOfWeek, maxVisibleLanes: $maxVisibleLanes, showWeekdayLabels: $showWeekdayLabels, locale: $locale)';
  }
}

/// @nodoc
abstract mixin class _$CalendarConfigCopyWith<$Res>
    implements $CalendarConfigCopyWith<$Res> {
  factory _$CalendarConfigCopyWith(
          _CalendarConfig value, $Res Function(_CalendarConfig) _then) =
      __$CalendarConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int firstDayOfWeek,
      int maxVisibleLanes,
      bool showWeekdayLabels,
      String? locale});
}

/// @nodoc
class __$CalendarConfigCopyWithImpl<$Res>
    implements _$CalendarConfigCopyWith<$Res> {
  __$CalendarConfigCopyWithImpl(this._self, this._then);

  final _CalendarConfig _self;
  final $Res Function(_CalendarConfig) _then;

  /// Create a copy of CalendarConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? firstDayOfWeek = null,
    Object? maxVisibleLanes = null,
    Object? showWeekdayLabels = null,
    Object? locale = freezed,
  }) {
    return _then(_CalendarConfig(
      firstDayOfWeek: null == firstDayOfWeek
          ? _self.firstDayOfWeek
          : firstDayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      maxVisibleLanes: null == maxVisibleLanes
          ? _self.maxVisibleLanes
          : maxVisibleLanes // ignore: cast_nullable_to_non_nullable
              as int,
      showWeekdayLabels: null == showWeekdayLabels
          ? _self.showWeekdayLabels
          : showWeekdayLabels // ignore: cast_nullable_to_non_nullable
              as bool,
      locale: freezed == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
