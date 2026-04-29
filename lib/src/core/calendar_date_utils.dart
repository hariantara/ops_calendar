/// Pure-Dart date math used by the calendar layout. No Flutter imports.
///
/// All functions assume local-time [DateTime] inputs. Day arithmetic uses
/// the `DateTime(year, month, day + n)` constructor to avoid DST transition
/// bugs that would arise from `Duration(days: n)` in some time zones.
class CalendarDateUtils {
  const CalendarDateUtils._();

  /// Returns a [DateTime] at midnight local time for the same calendar day.
  static DateTime dateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  /// Returns whether [a] and [b] fall on the same calendar day.
  static bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  /// Adds [days] to [date] safely across DST boundaries.
  static DateTime addDays(DateTime date, int days) =>
      DateTime(date.year, date.month, date.day + days);

  /// Number of whole calendar days from [from] to [to] (can be negative).
  ///
  /// Both inputs are normalized to midnight before subtraction so DST shifts
  /// don't alter the count.
  static int daysBetween(DateTime from, DateTime to) {
    final a = dateOnly(from);
    final b = dateOnly(to);
    return b.difference(a).inDays;
  }

  /// First day (00:00 local) of the month containing [date].
  static DateTime firstDayOfMonth(DateTime date) =>
      DateTime(date.year, date.month);

  /// Last day (00:00 local) of the month containing [date].
  static DateTime lastDayOfMonth(DateTime date) =>
      DateTime(date.year, date.month + 1, 0);

  /// Number of days in the given calendar month.
  static int daysInMonth(int year, int month) =>
      DateTime(year, month + 1, 0).day;

  /// Adds [months] to [date], clamping the day to a valid value.
  ///
  /// Example: adding 1 month to Jan 31 yields Feb 28 (or Feb 29 in leap years).
  /// Negative [months] are supported and roll the year backward correctly.
  static DateTime addMonths(DateTime date, int months) {
    // Work with a 0-indexed month value so floor division gives the correct
    // year offset for both positive and negative deltas. Dart's `~/` truncates
    // toward zero, so we use `(x / 12).floor()` instead.
    final zeroIndexed = date.month - 1 + months;
    final yearOffset = (zeroIndexed / 12).floor();
    // Dart's `%` is non-negative for positive divisors, so this is safe.
    final newMonth = (zeroIndexed % 12) + 1;
    final newYear = date.year + yearOffset;
    final clampedDay = date.day.clamp(1, daysInMonth(newYear, newMonth));
    return DateTime(newYear, newMonth, clampedDay);
  }

  /// Returns the start (00:00) of the week containing [date], using
  /// [firstDayOfWeek] (ISO 8601: 1 = Monday, 7 = Sunday).
  static DateTime startOfWeek(DateTime date, int firstDayOfWeek) {
    assert(
      firstDayOfWeek >= 1 && firstDayOfWeek <= 7,
      'firstDayOfWeek must be 1..7',
    );
    final d = dateOnly(date);
    var diff = (d.weekday - firstDayOfWeek) % 7;
    if (diff < 0) diff += 7;
    return addDays(d, -diff);
  }

  /// First cell of the 6x7 month grid containing [month].
  ///
  /// May fall in the previous month if the 1st of [month] isn't on
  /// [firstDayOfWeek].
  static DateTime monthGridStart(DateTime month, int firstDayOfWeek) =>
      startOfWeek(firstDayOfMonth(month), firstDayOfWeek);

  /// 42 consecutive days (6 weeks × 7) covering [month] for the grid.
  static List<DateTime> monthGridDays(DateTime month, int firstDayOfWeek) {
    final start = monthGridStart(month, firstDayOfWeek);
    return List<DateTime>.generate(
      42,
      (i) => addDays(start, i),
      growable: false,
    );
  }
}
