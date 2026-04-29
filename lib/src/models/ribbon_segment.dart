import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ops_calendar/src/models/calendar_event.dart';

part 'ribbon_segment.freezed.dart';

/// A single laid-out ribbon segment within one week row.
///
/// Multi-day events that cross week boundaries produce one [RibbonSegment]
/// per week they appear in. Internal layout type — not part of the public
/// consumer API.
@freezed
class RibbonSegment with _$RibbonSegment {
  /// Creates a [RibbonSegment].
  const factory RibbonSegment({
    /// The source event this segment renders.
    required CalendarEvent event,

    /// Zero-based column index where the segment starts (0 = leftmost).
    required int startColumn,

    /// Zero-based column index where the segment ends, inclusive.
    required int endColumn,

    /// Vertical lane assignment within the week row (0-based).
    required int lane,

    /// Whether the event continues from the previous week (clipped left).
    required bool continuesFromPreviousWeek,

    /// Whether the event continues into the next week (clipped right).
    required bool continuesIntoNextWeek,
  }) = _RibbonSegment;
}
