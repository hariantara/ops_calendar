import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_config.freezed.dart';
part 'calendar_config.g.dart';

/// Configuration for a calendar instance.
///
/// All fields are optional; defaults match the most common usage
/// (Monday as first day of week, max 3 visible event lanes).
@Freezed(toJson: true, fromJson: true)
class CalendarConfig with _$CalendarConfig {
  /// Creates a [CalendarConfig].
  const factory CalendarConfig({
    /// Day of week shown in the leftmost column.
    /// 1 = Monday, 7 = Sunday (ISO 8601).
    @Default(DateTime.monday) int firstDayOfWeek,

    /// Maximum number of event lanes shown per day cell before
    /// remaining events collapse into a "+N more" indicator.
    @Default(3) int maxVisibleLanes,

    /// Whether to show weekday labels in the header row.
    @Default(true) bool showWeekdayLabels,

    /// Locale identifier for weekday and month labels (e.g. `'en_US'`).
    /// When null, falls back to the ambient locale of the build context.
    String? locale,
  }) = _CalendarConfig;

  /// Creates a [CalendarConfig] from JSON.
  factory CalendarConfig.fromJson(Map<String, dynamic> json) =>
      _$CalendarConfigFromJson(json);
}
