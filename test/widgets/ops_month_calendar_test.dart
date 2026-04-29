import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ops_calendar/ops_calendar.dart';

Widget _wrap(Widget child) => MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: 400,
          height: 600,
          child: child,
        ),
      ),
    );

void main() {
  testWidgets('renders without crashing', (tester) async {
    await tester.pumpWidget(
      _wrap(
        OpsMonthCalendar(initialMonth: DateTime(2026, 4)),
      ),
    );
    // April 2026 has 30 days; one of them must render.
    expect(find.text('15'), findsOneWidget);
  });

  testWidgets('onDateTap fires with the tapped date', (tester) async {
    DateTime? tapped;
    await tester.pumpWidget(
      _wrap(
        OpsMonthCalendar(
          initialMonth: DateTime(2026, 4),
          onDateTap: (d) => tapped = d,
        ),
      ),
    );

    await tester.tap(find.text('15').first);
    await tester.pumpAndSettle();

    expect(tapped, isNotNull);
    expect(tapped!.year, 2026);
    expect(tapped!.month, 4);
    expect(tapped!.day, 15);
  });

  testWidgets('onEventTap fires when a ribbon is tapped', (tester) async {
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
        ),
      ),
    );

    expect(find.text('Conference'), findsOneWidget);
    await tester.tap(find.text('Conference'));
    await tester.pumpAndSettle();

    expect(tapped, isNotNull);
    expect(tapped!.id, 'e1');
  });

  testWidgets('onMonthChanged fires when swiping pages', (tester) async {
    DateTime? changed;
    await tester.pumpWidget(
      _wrap(
        OpsMonthCalendar(
          initialMonth: DateTime(2026, 4),
          onMonthChanged: (m) => changed = m,
        ),
      ),
    );

    // Lower velocity than 1000 to avoid PageView's ballistic simulation
    // carrying past a single page snap. Even so, exact page-snap landing can
    // be platform-sensitive — assert forward motion rather than a specific
    // landing month.
    await tester.fling(find.byType(PageView), const Offset(-400, 0), 300);
    await tester.pumpAndSettle();

    expect(changed, isNotNull);
    expect(changed!.year, 2026);
    expect(changed!.month, greaterThanOrEqualTo(5));
  });

  testWidgets('overflow shows "+N more" when events exceed maxVisibleLanes',
      (tester) async {
    final events = [
      for (var i = 0; i < 7; i++)
        CalendarEvent(
          id: 'e$i',
          title: 'Event $i',
          start: DateTime(2026, 4, 15),
          end: DateTime(2026, 4, 15),
        ),
    ];

    await tester.pumpWidget(
      _wrap(
        OpsMonthCalendar(
          initialMonth: DateTime(2026, 4),
          events: events,
          // Default maxVisibleLanes = 4. With 7 single-day overlapping events,
          // 3 overflow.
        ),
      ),
    );

    expect(find.text('+3 more'), findsOneWidget);
  });
}
