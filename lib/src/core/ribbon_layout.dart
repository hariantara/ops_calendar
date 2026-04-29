import '../models/calendar_event.dart';
import '../models/ribbon_segment.dart';
import 'calendar_date_utils.dart';

/// Lays out events as ribbon segments within a single 7-day week row.
///
/// Algorithm: greedy interval-graph coloring.
///
///   1. Filter events that overlap `[weekStart, weekStart + 7d)`.
///   2. For each, compute the column span clipped to this week and flag
///      whether the event extends into adjacent weeks.
///   3. Sort by (earlier start column, earlier datetime, id).
///      Earlier-start-first preserves left-to-right reading order. Datetime
///      and id are stable tiebreakers — independent of event duration so a
///      multi-day event can't displace a single-day event that would
///      otherwise share a lane with another non-overlapping single-day event.
///   4. Walk lanes from 0 up; place the event in the first lane whose
///      already-placed segments don't overlap its column span.
///
/// Runs in O(n × k) where n = events overlapping the week, k = lanes used.
/// Both are small in practice (typically n < 30, k <= 5), so this is
/// effectively linear per week.
List<RibbonSegment> packRibbonsForWeek({
  required DateTime weekStart,
  required List<CalendarEvent> events,
}) {
  final wsDate = CalendarDateUtils.dateOnly(weekStart);
  final weDate = CalendarDateUtils.addDays(wsDate, 7); // exclusive

  final candidates = <_Candidate>[];
  for (final event in events) {
    final eStart = CalendarDateUtils.dateOnly(event.start);
    final eEnd = CalendarDateUtils.dateOnly(event.end);

    if (eEnd.isBefore(wsDate) || !eStart.isBefore(weDate)) continue;

    final rawStartCol = CalendarDateUtils.daysBetween(wsDate, eStart);
    final rawEndCol = CalendarDateUtils.daysBetween(wsDate, eEnd);
    final startColumn = rawStartCol < 0 ? 0 : rawStartCol;
    final endColumn = rawEndCol > 6 ? 6 : rawEndCol;

    candidates.add(
      _Candidate(
        event: event,
        startColumn: startColumn,
        endColumn: endColumn,
        continuesFromPreviousWeek: eStart.isBefore(wsDate),
        continuesIntoNextWeek: !eEnd.isBefore(weDate),
      ),
    );
  }

  candidates.sort(_byLayoutPriority);

  final lanes = <List<_Placed>>[];
  final result = <RibbonSegment>[];

  for (final c in candidates) {
    var lane = 0;
    while (lane < lanes.length && _laneConflicts(lanes[lane], c)) {
      lane++;
    }
    if (lane == lanes.length) {
      lanes.add(<_Placed>[]);
    }
    lanes[lane].add(_Placed(c.startColumn, c.endColumn));
    result.add(
      RibbonSegment(
        event: c.event,
        startColumn: c.startColumn,
        endColumn: c.endColumn,
        lane: lane,
        continuesFromPreviousWeek: c.continuesFromPreviousWeek,
        continuesIntoNextWeek: c.continuesIntoNextWeek,
      ),
    );
  }

  return result;
}

int _byLayoutPriority(_Candidate a, _Candidate b) {
  final byStart = a.startColumn.compareTo(b.startColumn);
  if (byStart != 0) return byStart;
  final byTime = a.event.start.compareTo(b.event.start);
  if (byTime != 0) return byTime;
  return a.event.id.compareTo(b.event.id);
}

bool _laneConflicts(List<_Placed> placed, _Candidate c) {
  for (final p in placed) {
    if (!(c.endColumn < p.startColumn || c.startColumn > p.endColumn)) {
      return true;
    }
  }
  return false;
}

class _Candidate {
  const _Candidate({
    required this.event,
    required this.startColumn,
    required this.endColumn,
    required this.continuesFromPreviousWeek,
    required this.continuesIntoNextWeek,
  });

  final CalendarEvent event;
  final int startColumn;
  final int endColumn;
  final bool continuesFromPreviousWeek;
  final bool continuesIntoNextWeek;
}

class _Placed {
  const _Placed(this.startColumn, this.endColumn);
  final int startColumn;
  final int endColumn;
}
