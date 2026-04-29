import 'package:flutter/material.dart';

import 'package:ops_calendar/src/models/ops_calendar_theme.dart';

/// One row of weekday abbreviations (Mon, Tue, ...) sized to match the
/// 7-column month grid below it. Pulls labels from
/// [MaterialLocalizations.narrowWeekdays] so they follow the app's locale.
class WeekdayHeader extends StatelessWidget {
  /// Creates a [WeekdayHeader].
  const WeekdayHeader({
    required this.firstDayOfWeek,
    required this.theme,
    this.locale,
    super.key,
  });

  /// ISO 8601 day shown in the leftmost column (1 = Monday).
  final int firstDayOfWeek;

  /// Calendar styling.
  final OpsCalendarTheme theme;

  /// Optional override locale tag. Currently unused; reserved for future
  /// custom-locale support without going through [MaterialLocalizations].
  final String? locale;

  @override
  Widget build(BuildContext context) {
    final narrow = MaterialLocalizations.of(context).narrowWeekdays;
    // narrow[0]=Sun, narrow[1]=Mon, ..., narrow[6]=Sat
    // ISO weekday W maps to narrow index W % 7
    final labels = List<String>.generate(
      7,
      (i) {
        final iso = ((firstDayOfWeek - 1 + i) % 7) + 1;
        return narrow[iso % 7];
      },
      growable: false,
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.cellBorderColor),
        ),
      ),
      child: Row(
        children: [
          for (final label in labels)
            Expanded(
              child: Center(
                child: Text(label, style: theme.weekdayLabelStyle),
              ),
            ),
        ],
      ),
    );
  }
}
