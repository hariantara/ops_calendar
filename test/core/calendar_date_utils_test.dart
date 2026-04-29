import 'package:flutter_test/flutter_test.dart';
import 'package:ops_calendar/src/core/calendar_date_utils.dart';

void main() {
  group('CalendarDateUtils.isSameDay', () {
    test('same date, different times', () {
      expect(
        CalendarDateUtils.isSameDay(
          DateTime(2026, 4, 29, 8),
          DateTime(2026, 4, 29, 23, 59),
        ),
        isTrue,
      );
    });

    test('different days', () {
      expect(
        CalendarDateUtils.isSameDay(
          DateTime(2026, 4, 29),
          DateTime(2026, 4, 30),
        ),
        isFalse,
      );
    });
  });

  group('CalendarDateUtils.addDays', () {
    test('positive', () {
      expect(
        CalendarDateUtils.addDays(DateTime(2026, 4, 29), 3),
        DateTime(2026, 5, 2),
      );
    });

    test('negative', () {
      expect(
        CalendarDateUtils.addDays(DateTime(2026, 5, 1), -2),
        DateTime(2026, 4, 29),
      );
    });

    test('crosses month boundary', () {
      expect(
        CalendarDateUtils.addDays(DateTime(2026, 1, 30), 5),
        DateTime(2026, 2, 4),
      );
    });
  });

  group('CalendarDateUtils.daysBetween', () {
    test('forward', () {
      expect(
        CalendarDateUtils.daysBetween(
          DateTime(2026, 4, 1),
          DateTime(2026, 4, 8),
        ),
        7,
      );
    });

    test('zero', () {
      expect(
        CalendarDateUtils.daysBetween(
          DateTime(2026, 4, 1, 23),
          DateTime(2026, 4, 1, 1),
        ),
        0,
      );
    });

    test('negative', () {
      expect(
        CalendarDateUtils.daysBetween(
          DateTime(2026, 4, 5),
          DateTime(2026, 4, 1),
        ),
        -4,
      );
    });
  });

  group('CalendarDateUtils.addMonths', () {
    test('clamps day for shorter month', () {
      expect(
        CalendarDateUtils.addMonths(DateTime(2026, 1, 31), 1),
        DateTime(2026, 2, 28),
      );
    });

    test('preserves day in longer month', () {
      expect(
        CalendarDateUtils.addMonths(DateTime(2026, 1, 15), 2),
        DateTime(2026, 3, 15),
      );
    });

    test('crosses year boundary forward', () {
      expect(
        CalendarDateUtils.addMonths(DateTime(2026, 11, 1), 3),
        DateTime(2027, 2, 1),
      );
    });

    test('crosses year boundary backward', () {
      expect(
        CalendarDateUtils.addMonths(DateTime(2026, 2, 1), -3),
        DateTime(2025, 11, 1),
      );
    });
  });

  group('CalendarDateUtils.startOfWeek', () {
    test('Monday-first, Wednesday returns previous Monday', () {
      // 2026-04-29 is a Wednesday
      expect(
        CalendarDateUtils.startOfWeek(DateTime(2026, 4, 29), DateTime.monday),
        DateTime(2026, 4, 27),
      );
    });

    test('Sunday-first, Wednesday returns previous Sunday', () {
      expect(
        CalendarDateUtils.startOfWeek(DateTime(2026, 4, 29), DateTime.sunday),
        DateTime(2026, 4, 26),
      );
    });

    test('Monday-first, Monday returns same day', () {
      // 2026-04-27 is a Monday
      expect(
        CalendarDateUtils.startOfWeek(DateTime(2026, 4, 27), DateTime.monday),
        DateTime(2026, 4, 27),
      );
    });
  });

  group('CalendarDateUtils.monthGridDays', () {
    test('returns 42 consecutive days', () {
      final days =
          CalendarDateUtils.monthGridDays(DateTime(2026, 4), DateTime.monday);
      expect(days.length, 42);
      for (var i = 1; i < days.length; i++) {
        expect(
          CalendarDateUtils.daysBetween(days[i - 1], days[i]),
          1,
          reason: 'days should be consecutive',
        );
      }
    });

    test('first day matches firstDayOfWeek', () {
      // April 2026: 1st falls on Wednesday. Monday-first → grid starts Mar 30.
      final days =
          CalendarDateUtils.monthGridDays(DateTime(2026, 4), DateTime.monday);
      expect(days.first, DateTime(2026, 3, 30));
      expect(days.first.weekday, DateTime.monday);
    });

    test('Sunday-first grid starts on Sunday', () {
      final days =
          CalendarDateUtils.monthGridDays(DateTime(2026, 4), DateTime.sunday);
      expect(days.first.weekday, DateTime.sunday);
    });
  });

  group('CalendarDateUtils.daysInMonth', () {
    test('February non-leap', () {
      expect(CalendarDateUtils.daysInMonth(2026, 2), 28);
    });

    test('February leap', () {
      expect(CalendarDateUtils.daysInMonth(2024, 2), 29);
    });

    test('April', () {
      expect(CalendarDateUtils.daysInMonth(2026, 4), 30);
    });

    test('January', () {
      expect(CalendarDateUtils.daysInMonth(2026, 1), 31);
    });
  });
}
