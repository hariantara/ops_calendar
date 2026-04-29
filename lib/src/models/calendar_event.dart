import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ops_calendar/src/models/color_converter.dart';

part 'calendar_event.freezed.dart';
part 'calendar_event.g.dart';

/// An event displayed on the calendar.
///
/// An event spans an inclusive date range from [start] to [end]. A single-day
/// event has `end` on the same date as `start`. Time components are preserved
/// for consumer use but the month view renders by date only.
@Freezed(toJson: true, fromJson: true)
class CalendarEvent with _$CalendarEvent {
  /// Creates a [CalendarEvent].
  const factory CalendarEvent({
    /// Stable identifier. Used as the widget key when rendering.
    required String id,

    /// Display title shown in the ribbon/chip.
    required String title,

    /// Start of the event (inclusive).
    required DateTime start,

    /// End of the event (inclusive). Must be `>= start`.
    required DateTime end,

    /// Ribbon/chip background color.
    @ColorConverter() @Default(Color(0xFF3B82F6)) Color color,

    /// Optional secondary line shown beneath the title (where space allows).
    String? subtitle,

    /// Arbitrary consumer-attached metadata. Round-trips through JSON
    /// only if its values are JSON-encodable.
    Map<String, dynamic>? metadata,
  }) = _CalendarEvent;

  /// Creates a [CalendarEvent] from JSON.
  factory CalendarEvent.fromJson(Map<String, dynamic> json) =>
      _$CalendarEventFromJson(json);
}
