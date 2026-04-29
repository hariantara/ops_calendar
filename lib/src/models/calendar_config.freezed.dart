// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalendarConfig _$CalendarConfigFromJson(Map<String, dynamic> json) {
  return _CalendarConfig.fromJson(json);
}

/// @nodoc
mixin _$CalendarConfig {
  /// Day of week shown in the leftmost column.
  /// 1 = Monday, 7 = Sunday (ISO 8601).
  int get firstDayOfWeek => throw _privateConstructorUsedError;

  /// Maximum number of event lanes shown per day cell before
  /// remaining events collapse into a "+N more" indicator.
  int get maxVisibleLanes => throw _privateConstructorUsedError;

  /// Whether to show weekday labels in the header row.
  bool get showWeekdayLabels => throw _privateConstructorUsedError;

  /// Locale identifier for weekday and month labels (e.g. `'en_US'`).
  /// When null, falls back to the ambient locale of the build context.
  String? get locale => throw _privateConstructorUsedError;

  /// Serializes this CalendarConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalendarConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalendarConfigCopyWith<CalendarConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarConfigCopyWith<$Res> {
  factory $CalendarConfigCopyWith(
          CalendarConfig value, $Res Function(CalendarConfig) then) =
      _$CalendarConfigCopyWithImpl<$Res, CalendarConfig>;
  @useResult
  $Res call(
      {int firstDayOfWeek,
      int maxVisibleLanes,
      bool showWeekdayLabels,
      String? locale});
}

/// @nodoc
class _$CalendarConfigCopyWithImpl<$Res, $Val extends CalendarConfig>
    implements $CalendarConfigCopyWith<$Res> {
  _$CalendarConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      firstDayOfWeek: null == firstDayOfWeek
          ? _value.firstDayOfWeek
          : firstDayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      maxVisibleLanes: null == maxVisibleLanes
          ? _value.maxVisibleLanes
          : maxVisibleLanes // ignore: cast_nullable_to_non_nullable
              as int,
      showWeekdayLabels: null == showWeekdayLabels
          ? _value.showWeekdayLabels
          : showWeekdayLabels // ignore: cast_nullable_to_non_nullable
              as bool,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarConfigImplCopyWith<$Res>
    implements $CalendarConfigCopyWith<$Res> {
  factory _$$CalendarConfigImplCopyWith(_$CalendarConfigImpl value,
          $Res Function(_$CalendarConfigImpl) then) =
      __$$CalendarConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int firstDayOfWeek,
      int maxVisibleLanes,
      bool showWeekdayLabels,
      String? locale});
}

/// @nodoc
class __$$CalendarConfigImplCopyWithImpl<$Res>
    extends _$CalendarConfigCopyWithImpl<$Res, _$CalendarConfigImpl>
    implements _$$CalendarConfigImplCopyWith<$Res> {
  __$$CalendarConfigImplCopyWithImpl(
      _$CalendarConfigImpl _value, $Res Function(_$CalendarConfigImpl) _then)
      : super(_value, _then);

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
    return _then(_$CalendarConfigImpl(
      firstDayOfWeek: null == firstDayOfWeek
          ? _value.firstDayOfWeek
          : firstDayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      maxVisibleLanes: null == maxVisibleLanes
          ? _value.maxVisibleLanes
          : maxVisibleLanes // ignore: cast_nullable_to_non_nullable
              as int,
      showWeekdayLabels: null == showWeekdayLabels
          ? _value.showWeekdayLabels
          : showWeekdayLabels // ignore: cast_nullable_to_non_nullable
              as bool,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalendarConfigImpl implements _CalendarConfig {
  const _$CalendarConfigImpl(
      {this.firstDayOfWeek = DateTime.monday,
      this.maxVisibleLanes = 3,
      this.showWeekdayLabels = true,
      this.locale});

  factory _$CalendarConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarConfigImplFromJson(json);

  /// Day of week shown in the leftmost column.
  /// 1 = Monday, 7 = Sunday (ISO 8601).
  @override
  @JsonKey()
  final int firstDayOfWeek;

  /// Maximum number of event lanes shown per day cell before
  /// remaining events collapse into a "+N more" indicator.
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

  @override
  String toString() {
    return 'CalendarConfig(firstDayOfWeek: $firstDayOfWeek, maxVisibleLanes: $maxVisibleLanes, showWeekdayLabels: $showWeekdayLabels, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarConfigImpl &&
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

  /// Create a copy of CalendarConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarConfigImplCopyWith<_$CalendarConfigImpl> get copyWith =>
      __$$CalendarConfigImplCopyWithImpl<_$CalendarConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarConfigImplToJson(
      this,
    );
  }
}

abstract class _CalendarConfig implements CalendarConfig {
  const factory _CalendarConfig(
      {final int firstDayOfWeek,
      final int maxVisibleLanes,
      final bool showWeekdayLabels,
      final String? locale}) = _$CalendarConfigImpl;

  factory _CalendarConfig.fromJson(Map<String, dynamic> json) =
      _$CalendarConfigImpl.fromJson;

  /// Day of week shown in the leftmost column.
  /// 1 = Monday, 7 = Sunday (ISO 8601).
  @override
  int get firstDayOfWeek;

  /// Maximum number of event lanes shown per day cell before
  /// remaining events collapse into a "+N more" indicator.
  @override
  int get maxVisibleLanes;

  /// Whether to show weekday labels in the header row.
  @override
  bool get showWeekdayLabels;

  /// Locale identifier for weekday and month labels (e.g. `'en_US'`).
  /// When null, falls back to the ambient locale of the build context.
  @override
  String? get locale;

  /// Create a copy of CalendarConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalendarConfigImplCopyWith<_$CalendarConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
