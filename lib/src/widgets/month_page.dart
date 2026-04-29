import 'package:flutter/material.dart';

import '../core/calendar_date_utils.dart';
import '../core/ribbon_layout.dart';
import '../models/calendar_config.dart';
import '../models/calendar_event.dart';
import '../models/ops_calendar_theme.dart';
import '../models/ribbon_segment.dart';
import 'week_row.dart';

/// One 6×7 month grid, ready to live inside a [PageView] page.
///
/// Wraps its grid in a [RepaintBoundary] so adjacent pages don't repaint
/// during a swipe — the page being scrolled in is composited as a layer
/// rather than re-rasterized each frame. Also pre-computes ribbon segments
/// for all six weeks here (instead of inside each [WeekRow]) so the work
/// happens once per page build.
class MonthPage extends StatelessWidget {
  /// Creates a [MonthPage].
  const MonthPage({
    required this.month,
    required this.events,
    required this.config,
    required this.theme,
    this.selectedDate,
    this.onEventTap,
    this.onDateTap,
    this.onDateLongPress,
    super.key,
  });

  /// The month to display (the day component is ignored).
  final DateTime month;

  /// All events. Pre-filtered to ones overlapping this page's 6-week grid
  /// before being handed to the layout algorithm.
  final List<CalendarEvent> events;

  /// Calendar config (first day of week, max lanes, locale, ...).
  final CalendarConfig config;

  /// Calendar styling.
  final OpsCalendarTheme theme;

  /// Externally-selected date, if any.
  final DateTime? selectedDate;

  /// Tap handler for a ribbon.
  final void Function(CalendarEvent event)? onEventTap;

  /// Tap handler for a day cell.
  final void Function(DateTime date)? onDateTap;

  /// Long-press handler for a day cell.
  final void Function(DateTime date)? onDateLongPress;

  @override
  Widget build(BuildContext context) {
    final gridStart =
        CalendarDateUtils.monthGridStart(month, config.firstDayOfWeek);
    final gridEnd = CalendarDateUtils.addDays(gridStart, 42); // exclusive
    final displayedMonth = CalendarDateUtils.firstDayOfMonth(month);
    final today = DateTime.now();

    // Cheap pre-filter: drop events that don't touch this page's 6-week
    // window before the per-week layout runs. Saves work when the consumer
    // passes a large global event list.
    final visibleEvents = <CalendarEvent>[];
    for (final e in events) {
      final eStart = CalendarDateUtils.dateOnly(e.start);
      final eEnd = CalendarDateUtils.dateOnly(e.end);
      if (eEnd.isBefore(gridStart) || !eStart.isBefore(gridEnd)) continue;
      visibleEvents.add(e);
    }

    // Pre-compute ribbon segments for all six weeks once per page build.
    final segmentsByWeek = List<List<RibbonSegment>>.generate(6, (w) {
      final weekStart = CalendarDateUtils.addDays(gridStart, w * 7);
      return packRibbonsForWeek(
        weekStart: weekStart,
        events: visibleEvents,
      );
    }, growable: false);

    return RepaintBoundary(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cellWidth = constraints.maxWidth / 7;
          final rowHeight = constraints.maxHeight / 6;

          return Column(
            children: [
              for (var w = 0; w < 6; w++)
                SizedBox(
                  height: rowHeight,
                  child: RepaintBoundary(
                    child: WeekRow(
                      weekStart: CalendarDateUtils.addDays(gridStart, w * 7),
                      cellWidth: cellWidth,
                      displayedMonth: displayedMonth,
                      today: today,
                      segments: segmentsByWeek[w],
                      theme: theme,
                      maxVisibleLanes: config.maxVisibleLanes,
                      selectedDate: selectedDate,
                      onEventTap: onEventTap,
                      onDateTap: onDateTap,
                      onDateLongPress: onDateLongPress,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
