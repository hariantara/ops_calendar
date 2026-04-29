import 'package:flutter/material.dart';

import 'package:ops_calendar/src/controllers/ops_calendar_controller.dart';
import 'package:ops_calendar/src/core/calendar_date_utils.dart';
import 'package:ops_calendar/src/models/calendar_config.dart';
import 'package:ops_calendar/src/models/calendar_event.dart';
import 'package:ops_calendar/src/models/ops_calendar_theme.dart';
import 'package:ops_calendar/src/widgets/month_page.dart';
import 'package:ops_calendar/src/widgets/ribbon_builder.dart';
import 'package:ops_calendar/src/widgets/weekday_header.dart';

/// A swipeable month calendar with multi-day event ribbons.
///
/// Stateless from the consumer's perspective: it owns only the page
/// controller for swipe navigation. Selected date, displayed month label,
/// and event data all live in the consumer's state management of choice.
///
/// For programmatic month navigation (e.g. custom chevron buttons in your
/// header), pass an [OpsCalendarController] via [controller].
class OpsMonthCalendar extends StatefulWidget {
  /// Creates an [OpsMonthCalendar].
  const OpsMonthCalendar({
    super.key,
    this.initialMonth,
    this.events = const <CalendarEvent>[],
    this.config = const CalendarConfig(),
    this.theme,
    this.selectedDate,
    this.controller,
    this.onMonthChanged,
    this.onEventTap,
    this.onDateTap,
    this.onDateLongPress,
    this.ribbonBuilder,
  });

  /// Month rendered first. Defaults to the current month at construction.
  /// Read once in [State.initState] — later changes do not move the
  /// calendar; use a [controller] for programmatic navigation instead.
  final DateTime? initialMonth;

  /// Events to render. Each [MonthPage] internally clips to the dates it
  /// touches, so passing the full list is fine for typical sizes.
  final List<CalendarEvent> events;

  /// Configuration (first day of week, max lanes, ...).
  final CalendarConfig config;

  /// Optional theme override. Falls back to the
  /// [Theme.of] extension and finally to [OpsCalendarTheme]'s defaults.
  final OpsCalendarTheme? theme;

  /// Externally-selected date highlighted with the theme's
  /// [OpsCalendarTheme.selectedDayColor].
  final DateTime? selectedDate;

  /// Optional controller for programmatic navigation (next/previous month,
  /// jump to a specific month) and for observing the visible month from
  /// outside the widget tree (e.g. to drive a custom header label).
  final OpsCalendarController? controller;

  /// Fires when the user swipes to a different month, or when the
  /// [controller]'s navigation methods complete. Argument is the first day
  /// (00:00 local) of the newly visible month.
  final ValueChanged<DateTime>? onMonthChanged;

  /// Fires when an event ribbon is tapped.
  final void Function(CalendarEvent event)? onEventTap;

  /// Fires when an empty area of a day cell is tapped.
  final void Function(DateTime date)? onDateTap;

  /// Fires when a day cell is long-pressed.
  final void Function(DateTime date)? onDateLongPress;

  /// Optional builder for fully replacing the default ribbon visual.
  ///
  /// When `null`, ribbons render with the package's default look (label
  /// over [CalendarEvent.color]). When set, every visible ribbon is
  /// rendered by your widget instead — useful for matching an existing
  /// design system or porting from another calendar package's
  /// `appointmentBuilder` pattern.
  ///
  /// The calendar still positions, sizes, and clips each ribbon; the
  /// builder controls the painted contents and the tap behavior.
  final OpsRibbonBuilder? ribbonBuilder;

  @override
  State<OpsMonthCalendar> createState() => _OpsMonthCalendarState();
}

class _OpsMonthCalendarState extends State<OpsMonthCalendar> {
  /// High initial page index lets the user swipe both directions for
  /// effectively unlimited months (~833 years on either side).
  static const int _initialPage = 5000;

  late final DateTime _baseMonth;
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    final init = widget.initialMonth ?? DateTime.now();
    _baseMonth = DateTime(init.year, init.month);
    _controller = PageController(initialPage: _initialPage);
    final c = widget.controller;
    if (c != null) {
      c
        ..attach(
          pageController: _controller,
          baseMonth: _baseMonth,
          initialPage: _initialPage,
        )
        ..updateVisibleMonth(_baseMonth);
    }
  }

  @override
  void didUpdateWidget(covariant OpsMonthCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?.detach();
      final c = widget.controller;
      if (c != null) {
        c
          ..attach(
            pageController: _controller,
            baseMonth: _baseMonth,
            initialPage: _initialPage,
          )
          ..updateVisibleMonth(
            _monthForPage(_controller.page?.round() ?? _initialPage),
          );
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.detach();
    _controller.dispose();
    super.dispose();
  }

  DateTime _monthForPage(int index) =>
      CalendarDateUtils.addMonths(_baseMonth, index - _initialPage);

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme ??
        Theme.of(context).extension<OpsCalendarTheme>() ??
        const OpsCalendarTheme();

    return Column(
      children: [
        WeekdayHeader(
          firstDayOfWeek: widget.config.firstDayOfWeek,
          theme: theme,
          locale: widget.config.locale,
        ),
        Expanded(
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (i) {
              final month = _monthForPage(i);
              widget.controller?.updateVisibleMonth(month);
              widget.onMonthChanged?.call(month);
            },
            itemBuilder: (context, index) {
              final month = _monthForPage(index);
              return MonthPage(
                month: month,
                events: widget.events,
                config: widget.config,
                theme: theme,
                selectedDate: widget.selectedDate,
                onEventTap: widget.onEventTap,
                onDateTap: widget.onDateTap,
                onDateLongPress: widget.onDateLongPress,
                ribbonBuilder: widget.ribbonBuilder,
              );
            },
          ),
        ),
      ],
    );
  }
}
