import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ops_calendar/src/core/ribbon_layout.dart';
import 'package:ops_calendar/src/models/calendar_event.dart';

CalendarEvent _event({
  required String id,
  required DateTime start,
  required DateTime end,
}) =>
    CalendarEvent(
      id: id,
      title: id,
      start: start,
      end: end,
      color: const Color(0xFF000000),
    );

void main() {
  // Pick a known Monday for week starts.
  final monday = DateTime(2026, 4, 27);

  group('packRibbonsForWeek — basics', () {
    test('empty events -> empty result', () {
      final segments = packRibbonsForWeek(weekStart: monday, events: const []);
      expect(segments, isEmpty);
    });

    test('event entirely before week is excluded', () {
      final e = _event(
        id: 'a',
        start: DateTime(2026, 4, 20),
        end: DateTime(2026, 4, 24),
      );
      final segments = packRibbonsForWeek(weekStart: monday, events: [e]);
      expect(segments, isEmpty);
    });

    test('event entirely after week is excluded', () {
      final e = _event(
        id: 'a',
        start: DateTime(2026, 5, 4),
        end: DateTime(2026, 5, 6),
      );
      final segments = packRibbonsForWeek(weekStart: monday, events: [e]);
      expect(segments, isEmpty);
    });
  });

  group('packRibbonsForWeek — column mapping', () {
    test('single-day event in week maps to one column', () {
      final e = _event(
        id: 'a',
        start: DateTime(2026, 4, 29), // Wed
        end: DateTime(2026, 4, 29),
      );
      final segments = packRibbonsForWeek(weekStart: monday, events: [e]);
      expect(segments, hasLength(1));
      expect(segments.first.startColumn, 2);
      expect(segments.first.endColumn, 2);
      expect(segments.first.continuesFromPreviousWeek, isFalse);
      expect(segments.first.continuesIntoNextWeek, isFalse);
    });

    test('multi-day event entirely in week', () {
      final e = _event(
        id: 'a',
        start: DateTime(2026, 4, 28), // Tue
        end: DateTime(2026, 4, 30), // Thu
      );
      final segments = packRibbonsForWeek(weekStart: monday, events: [e]);
      expect(segments.first.startColumn, 1);
      expect(segments.first.endColumn, 3);
      expect(segments.first.continuesFromPreviousWeek, isFalse);
      expect(segments.first.continuesIntoNextWeek, isFalse);
    });

    test('event spilling in from previous week is clipped & flagged', () {
      final e = _event(
        id: 'a',
        start: DateTime(2026, 4, 24), // previous Friday
        end: DateTime(2026, 4, 29), // Wednesday this week
      );
      final segments = packRibbonsForWeek(weekStart: monday, events: [e]);
      expect(segments.first.startColumn, 0);
      expect(segments.first.endColumn, 2);
      expect(segments.first.continuesFromPreviousWeek, isTrue);
      expect(segments.first.continuesIntoNextWeek, isFalse);
    });

    test('event spilling into next week is clipped & flagged', () {
      final e = _event(
        id: 'a',
        start: DateTime(2026, 4, 30),
        end: DateTime(2026, 5, 5),
      );
      final segments = packRibbonsForWeek(weekStart: monday, events: [e]);
      expect(segments.first.startColumn, 3);
      expect(segments.first.endColumn, 6);
      expect(segments.first.continuesFromPreviousWeek, isFalse);
      expect(segments.first.continuesIntoNextWeek, isTrue);
    });

    test('event spanning entire week and beyond on both sides', () {
      final e = _event(
        id: 'a',
        start: DateTime(2026, 4, 20),
        end: DateTime(2026, 5, 10),
      );
      final segments = packRibbonsForWeek(weekStart: monday, events: [e]);
      expect(segments.first.startColumn, 0);
      expect(segments.first.endColumn, 6);
      expect(segments.first.continuesFromPreviousWeek, isTrue);
      expect(segments.first.continuesIntoNextWeek, isTrue);
    });
  });

  group('packRibbonsForWeek — lane packing', () {
    test('two non-overlapping events stack on lane 0', () {
      final a = _event(
        id: 'a',
        start: DateTime(2026, 4, 27),
        end: DateTime(2026, 4, 28),
      );
      final b = _event(
        id: 'b',
        start: DateTime(2026, 4, 30),
        end: DateTime(2026, 5),
      );
      final segments = packRibbonsForWeek(weekStart: monday, events: [a, b]);
      final byId = {for (final s in segments) s.event.id: s};
      expect(byId['a']!.lane, 0);
      expect(byId['b']!.lane, 0);
    });

    test('two overlapping events occupy lanes 0 and 1', () {
      final a = _event(
        id: 'a',
        start: DateTime(2026, 4, 27),
        end: DateTime(2026, 4, 30),
      );
      final b = _event(
        id: 'b',
        start: DateTime(2026, 4, 29),
        end: DateTime(2026, 5),
      );
      final segments = packRibbonsForWeek(weekStart: monday, events: [a, b]);
      final byId = {for (final s in segments) s.event.id: s};
      expect(byId['a']!.lane, 0);
      expect(byId['b']!.lane, 1);
    });

    test('three overlapping events occupy lanes 0, 1, 2', () {
      final a = _event(
        id: 'a',
        start: DateTime(2026, 4, 27),
        end: DateTime(2026, 5),
      );
      final b = _event(
        id: 'b',
        start: DateTime(2026, 4, 27),
        end: DateTime(2026, 5),
      );
      final c = _event(
        id: 'c',
        start: DateTime(2026, 4, 27),
        end: DateTime(2026, 5),
      );
      final segments =
          packRibbonsForWeek(weekStart: monday, events: [a, b, c]);
      final lanes = segments.map((s) => s.lane).toSet();
      expect(lanes, {0, 1, 2});
    });

    test('earlier-starting event takes lower lane', () {
      // 'b' starts earlier than 'a' — should land on lane 0.
      final a = _event(
        id: 'a',
        start: DateTime(2026, 4, 29),
        end: DateTime(2026, 4, 30),
      );
      final b = _event(
        id: 'b',
        start: DateTime(2026, 4, 28),
        end: DateTime(2026, 4, 30),
      );
      final segments = packRibbonsForWeek(weekStart: monday, events: [a, b]);
      final byId = {for (final s in segments) s.event.id: s};
      expect(byId['b']!.lane, 0);
      expect(byId['a']!.lane, 1);
    });

    test('lane reused after non-overlap', () {
      // a: Mon-Tue (lane 0). b: Wed-Thu doesn't overlap → also lane 0.
      // c: Mon-Sun overlaps both → lane 1.
      final a = _event(
        id: 'a',
        start: DateTime(2026, 4, 27),
        end: DateTime(2026, 4, 28),
      );
      final b = _event(
        id: 'b',
        start: DateTime(2026, 4, 29),
        end: DateTime(2026, 4, 30),
      );
      final c = _event(
        id: 'c',
        start: DateTime(2026, 4, 27),
        end: DateTime(2026, 5, 3),
      );
      final segments =
          packRibbonsForWeek(weekStart: monday, events: [a, b, c]);
      final byId = {for (final s in segments) s.event.id: s};
      expect(byId['a']!.lane, 0);
      expect(byId['b']!.lane, 0);
      expect(byId['c']!.lane, 1);
    });
  });
}
