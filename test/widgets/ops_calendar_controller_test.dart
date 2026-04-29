import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ops_calendar/ops_calendar.dart';

Widget _wrap(Widget child) => MaterialApp(
      home: Scaffold(
        body: SizedBox(width: 400, height: 600, child: child),
      ),
    );

void main() {
  group('OpsCalendarController', () {
    testWidgets('reports visible month after attach', (tester) async {
      final controller = OpsCalendarController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        _wrap(
          OpsMonthCalendar(
            initialMonth: DateTime(2026, 4),
            controller: controller,
          ),
        ),
      );

      expect(controller.isAttached, isTrue);
      expect(controller.visibleMonth, DateTime(2026, 4));
    });

    testWidgets('nextMonth advances visibleMonth', (tester) async {
      final controller = OpsCalendarController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        _wrap(
          OpsMonthCalendar(
            initialMonth: DateTime(2026, 4),
            controller: controller,
          ),
        ),
      );

      // Don't await — the PageController animation only progresses while
      // `tester.pumpAndSettle` drives frames. Awaiting here would deadlock.
      unawaited(controller.nextMonth());
      await tester.pumpAndSettle();

      expect(controller.visibleMonth, DateTime(2026, 5));
    });

    testWidgets('previousMonth rolls back across year boundary',
        (tester) async {
      final controller = OpsCalendarController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        _wrap(
          OpsMonthCalendar(
            initialMonth: DateTime(2026, 1),
            controller: controller,
          ),
        ),
      );

      unawaited(controller.previousMonth());
      await tester.pumpAndSettle();

      expect(controller.visibleMonth, DateTime(2025, 12));
    });

    testWidgets('goToMonth animates to an arbitrary target', (tester) async {
      final controller = OpsCalendarController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        _wrap(
          OpsMonthCalendar(
            initialMonth: DateTime(2026, 4),
            controller: controller,
          ),
        ),
      );

      unawaited(controller.goToMonth(DateTime(2027, 8)));
      await tester.pumpAndSettle();

      expect(controller.visibleMonth, DateTime(2027, 8));
    });

    testWidgets('jumpToMonth changes month with no animation',
        (tester) async {
      final controller = OpsCalendarController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        _wrap(
          OpsMonthCalendar(
            initialMonth: DateTime(2026, 4),
            controller: controller,
          ),
        ),
      );

      controller.jumpToMonth(DateTime(2025, 1));
      await tester.pump();

      expect(controller.visibleMonth, DateTime(2025, 1));
    });

    testWidgets('detaches on dispose', (tester) async {
      final controller = OpsCalendarController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        _wrap(
          OpsMonthCalendar(
            initialMonth: DateTime(2026, 4),
            controller: controller,
          ),
        ),
      );

      await tester.pumpWidget(_wrap(const SizedBox()));

      expect(controller.isAttached, isFalse);
    });

    test('methods are no-ops when unattached', () async {
      final controller = OpsCalendarController();
      addTearDown(controller.dispose);

      // Should not throw.
      await controller.nextMonth();
      await controller.previousMonth();
      await controller.goToMonth(DateTime(2030, 1));
      controller.jumpToMonth(DateTime(2030, 1));
      expect(controller.visibleMonth, isNull);
    });
  });
}
