import 'package:flutter/material.dart';

import 'package:ops_calendar/src/core/calendar_date_utils.dart';
import 'package:ops_calendar/src/models/ops_calendar_theme.dart';

/// Background, border, and day number for a single day in the month grid.
///
/// Tap targets for the cell live here. Ribbons are painted above this in the
/// containing [Stack] and intercept their own taps.
class DayCell extends StatelessWidget {
  /// Creates a [DayCell].
  const DayCell({
    required this.date,
    required this.isInDisplayedMonth,
    required this.isToday,
    required this.isSelected,
    required this.theme,
    this.onTap,
    this.onLongPress,
    super.key,
  });

  /// The calendar date this cell represents.
  final DateTime date;

  /// Whether [date] falls inside the currently displayed month.
  final bool isInDisplayedMonth;

  /// Whether [date] is today (local time).
  final bool isToday;

  /// Whether [date] is the externally-selected date.
  final bool isSelected;

  /// Calendar styling.
  final OpsCalendarTheme theme;

  /// Tap handler. Disabled visually if null.
  final VoidCallback? onTap;

  /// Long-press handler.
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final bg = isInDisplayedMonth
        ? theme.cellBackgroundColor
        : theme.outsideMonthCellColor;
    final dayNumberStyle = isInDisplayedMonth
        ? theme.dayNumberStyle
        : theme.outsideMonthDayNumberStyle;

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        decoration: BoxDecoration(
          color: bg,
          border: Border(
            top: BorderSide(color: theme.cellBorderColor),
            right: BorderSide(color: theme.cellBorderColor),
          ),
        ),
        padding: theme.cellPadding,
        child: Align(
          alignment: Alignment.topCenter,
          child: _DayNumberBadge(
            day: date.day,
            isToday: isToday,
            isSelected: isSelected,
            todayColor: theme.todayHighlightColor,
            selectedColor: theme.selectedDayColor,
            textStyle: dayNumberStyle,
          ),
        ),
      ),
    );
  }

  /// Convenience: whether [date] is today right now.
  static bool dateIsToday(DateTime date) =>
      CalendarDateUtils.isSameDay(date, DateTime.now());
}

class _DayNumberBadge extends StatelessWidget {
  const _DayNumberBadge({
    required this.day,
    required this.isToday,
    required this.isSelected,
    required this.todayColor,
    required this.selectedColor,
    required this.textStyle,
  });

  final int day;
  final bool isToday;
  final bool isSelected;
  final Color todayColor;
  final Color selectedColor;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    Color? bg;
    var effective = textStyle;
    if (isSelected) {
      bg = selectedColor;
      effective = textStyle.copyWith(color: Colors.white);
    } else if (isToday) {
      bg = todayColor;
    }
    return Container(
      width: 22,
      height: 22,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
      ),
      child: Text('$day', style: effective),
    );
  }
}
