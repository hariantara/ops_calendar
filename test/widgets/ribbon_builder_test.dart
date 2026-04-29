import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ops_calendar/ops_calendar.dart';

Widget _wrap(Widget child) => MaterialApp(
      home: Scaffold(
        body: SizedBox(width: 400, height: 600, child: child),
      ),
    );

void main() {
  group('ribbonBuilder', () {
    testWidgets('replaces the default ribbon when provided', (tester) async {
      final event = CalendarEvent(
        id: 'e1',
        title: 'Conference',
        start: DateTime(2026, 4, 15),
        end: DateTime(2026, 4, 17),
      );

      await tester.pumpWidget(
        _wrap(
          OpsMonthCalendar(
            initialMonth: DateTime(2026, 4),
            events: [event],
            ribbonBuilder: (context, details) {
              return ColoredBox(
                key: const ValueKey('custom-ribbon'),
                color: Colors.purple,
                child: Text('CUSTOM:${details.event.title}'),
              );
            },
          ),
        ),
      );

      // Custom widget rendered, default Ribbon's "Conference" text gone.
      expect(find.byKey(const ValueKey('custom-ribbon')), findsOneWidget);
      expect(find.text('CUSTOM:Conference'), findsOneWidget);
      expect(find.text('Conference'), findsNothing);
    });

    testWidgets('passes onTap through to the builder', (tester) async {
      CalendarEvent? tapped;
      final event = CalendarEvent(
        id: 'e1',
        title: 'Conference',
        start: DateTime(2026, 4, 15),
        end: DateTime(2026, 4, 17),
      );

      await tester.pumpWidget(
        _wrap(
          OpsMonthCalendar(
            initialMonth: DateTime(2026, 4),
            events: [event],
            onEventTap: (e) => tapped = e,
            ribbonBuilder: (context, details) {
              return GestureDetector(
                onTap: details.onTap,
                child: const ColoredBox(
                  color: Colors.purple,
                  child: Text('CUSTOM'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('CUSTOM').first);
      await tester.pumpAndSettle();

      expect(tapped, isNotNull);
      expect(tapped!.id, 'e1');
    });

    testWidgets('reports continues-from/into-week flags accurately',
        (tester) async {
      final flags = <(bool, bool)>[];
      // Event spanning weeks: starts Sun Apr 12, ends Sat Apr 18 — entirely
      // within one week (Mon-first grid). Use an event that genuinely
      // crosses week boundaries: Apr 11 (Sat) -> Apr 14 (Tue).
      final event = CalendarEvent(
        id: 'e1',
        title: 'X',
        start: DateTime(2026, 4, 11), // Saturday in week 2
        end: DateTime(2026, 4, 14),   // Tuesday in week 3
      );

      await tester.pumpWidget(
        _wrap(
          OpsMonthCalendar(
            initialMonth: DateTime(2026, 4),
            events: [event],
            ribbonBuilder: (context, details) {
              flags.add(
                (
                  details.continuesFromPreviousWeek,
                  details.continuesIntoNextWeek,
                ),
              );
              return const ColoredBox(color: Colors.green);
            },
          ),
        ),
      );

      // Two segments: first has continuesIntoNextWeek=true,
      // second has continuesFromPreviousWeek=true.
      expect(flags, hasLength(2));
      final hasIntoNext = flags.any((f) => f.$2 && !f.$1);
      final hasFromPrev = flags.any((f) => f.$1 && !f.$2);
      expect(hasIntoNext, isTrue);
      expect(hasFromPrev, isTrue);
    });

    testWidgets('default rendering is unchanged when builder is null',
        (tester) async {
      final event = CalendarEvent(
        id: 'e1',
        title: 'Conference',
        start: DateTime(2026, 4, 15),
        end: DateTime(2026, 4, 17),
      );

      await tester.pumpWidget(
        _wrap(
          OpsMonthCalendar(
            initialMonth: DateTime(2026, 4),
            events: [event],
            // no ribbonBuilder
          ),
        ),
      );

      expect(find.text('Conference'), findsOneWidget);
    });
  });
}
