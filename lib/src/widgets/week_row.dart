import 'package:flutter/material.dart';

import '../core/calendar_date_utils.dart';
import '../models/calendar_event.dart';
import '../models/ops_calendar_theme.dart';
import '../models/ribbon_segment.dart';
import 'day_cell.dart';
import 'ribbon.dart';

/// One 7-cell week row in the month grid.
///
/// Pure rendering — receives pre-laid-out [segments] from its parent
/// [MonthPage] so layout work doesn't repeat per row rebuild. Receives
/// [cellWidth] and [today] from above for the same reason.
class WeekRow extends StatelessWidget {
  /// Creates a [WeekRow].
  const WeekRow({
    required this.weekStart,
    required this.cellWidth,
    required this.displayedMonth,
    required this.today,
    required this.segments,
    required this.theme,
    required this.maxVisibleLanes,
    this.selectedDate,
    this.onEventTap,
    this.onDateTap,
    this.onDateLongPress,
    super.key,
  });

  /// The first day rendered in this row (00:00 local).
  final DateTime weekStart;

  /// Pixel width of a single day cell, fed down from a parent
  /// [LayoutBuilder] in [MonthPage].
  final double cellWidth;

  /// The month currently being displayed; days outside it grey out.
  final DateTime displayedMonth;

  /// Today (local). Hoisted from [MonthPage] so we don't call
  /// [DateTime.now] per row build.
  final DateTime today;

  /// Pre-computed ribbon segments for this week.
  final List<RibbonSegment> segments;

  /// Calendar styling.
  final OpsCalendarTheme theme;

  /// Max ribbon lanes shown; remaining events collapse to "+N more".
  final int maxVisibleLanes;

  /// Externally selected date, if any.
  final DateTime? selectedDate;

  /// Tap handler for a ribbon.
  final void Function(CalendarEvent event)? onEventTap;

  /// Tap handler for a day cell.
  final void Function(DateTime date)? onDateTap;

  /// Long-press handler for a day cell.
  final void Function(DateTime date)? onDateLongPress;

  @override
  Widget build(BuildContext context) {
    final hiddenByColumn = _countHiddenPerColumn(segments, maxVisibleLanes);
    final dayNumberAreaHeight = theme.cellPadding.top + 22 + 4;
    final ribbonTopOffset = dayNumberAreaHeight;

    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Row(
          children: List<Widget>.generate(7, (col) {
            final date = CalendarDateUtils.addDays(weekStart, col);
            final inMonth = date.month == displayedMonth.month &&
                date.year == displayedMonth.year;
            return Expanded(
              child: DayCell(
                date: date,
                isInDisplayedMonth: inMonth,
                isToday: CalendarDateUtils.isSameDay(date, today),
                isSelected: selectedDate != null &&
                    CalendarDateUtils.isSameDay(date, selectedDate!),
                theme: theme,
                onTap: onDateTap == null ? null : () => onDateTap!(date),
                onLongPress: onDateLongPress == null
                    ? null
                    : () => onDateLongPress!(date),
              ),
            );
          }),
        ),
        for (final seg in segments)
          if (seg.lane < maxVisibleLanes)
            _PositionedRibbon(
              segment: seg,
              cellWidth: cellWidth,
              top: ribbonTopOffset +
                  seg.lane * (theme.ribbonHeight + theme.ribbonGap),
              theme: theme,
              onTap: onEventTap == null ? null : () => onEventTap!(seg.event),
            ),
        for (var col = 0; col < 7; col++)
          if (hiddenByColumn[col] > 0)
            Positioned(
              left: col * cellWidth,
              top: ribbonTopOffset +
                  maxVisibleLanes * (theme.ribbonHeight + theme.ribbonGap),
              width: cellWidth,
              height: theme.ribbonHeight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: theme.ribbonHorizontalPadding,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '+${hiddenByColumn[col]} more',
                    style: theme.moreIndicatorStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
      ],
    );
  }

  List<int> _countHiddenPerColumn(
    List<RibbonSegment> segments,
    int maxLanes,
  ) {
    final counts = List<int>.filled(7, 0);
    for (final s in segments) {
      if (s.lane < maxLanes) continue;
      for (var c = s.startColumn; c <= s.endColumn; c++) {
        counts[c]++;
      }
    }
    return counts;
  }
}

class _PositionedRibbon extends StatelessWidget {
  const _PositionedRibbon({
    required this.segment,
    required this.cellWidth,
    required this.top,
    required this.theme,
    this.onTap,
  });

  final RibbonSegment segment;
  final double cellWidth;
  final double top;
  final OpsCalendarTheme theme;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const horizontalInset = 2.0;
    final left = segment.startColumn * cellWidth +
        (segment.continuesFromPreviousWeek ? 0 : horizontalInset);
    final right = (7 - segment.endColumn - 1) * cellWidth +
        (segment.continuesIntoNextWeek ? 0 : horizontalInset);

    return Positioned(
      left: left,
      right: right,
      top: top,
      height: theme.ribbonHeight,
      child: Ribbon(segment: segment, theme: theme, onTap: onTap),
    );
  }
}
