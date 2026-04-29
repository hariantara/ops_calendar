import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ops_calendar/ops_calendar.dart';

import 'calendar_bloc.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late final OpsCalendarController _calendar;

  @override
  void initState() {
    super.initState();
    _calendar = OpsCalendarController();
  }

  @override
  void dispose() {
    _calendar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalendarBloc, CalendarState>(
      // Drive the popup off BLoC state changes — the Pattern 6 idiom from
      // the README. The callback only dispatches; the listener decides UI.
      listenWhen: (a, b) => a.lastOpenedEvent != b.lastOpenedEvent,
      listener: (context, state) {
        final e = state.lastOpenedEvent;
        if (e == null) return;
        _showEventSheet(context, e);
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: _MonthHeader(controller: _calendar),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              tooltip: 'Previous month',
              onPressed: _calendar.previousMonth,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.today),
                tooltip: 'Today',
                onPressed: _calendar.goToToday,
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                tooltip: 'Next month',
                onPressed: _calendar.nextMonth,
              ),
            ],
          ),
          body: OpsMonthCalendar(
            controller: _calendar,
            initialMonth: state.visibleMonth,
            events: state.events,
            selectedDate: state.selectedDate,
            onMonthChanged: (m) =>
                context.read<CalendarBloc>().add(CalendarMonthChanged(m)),
            onDateTap: (d) =>
                context.read<CalendarBloc>().add(CalendarDateSelected(d)),
            onEventTap: (e) =>
                context.read<CalendarBloc>().add(CalendarEventOpened(e)),
          ),
        );
      },
    );
  }

  void _showEventSheet(BuildContext context, CalendarEvent event) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: event.color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    event.title,
                    style: Theme.of(ctx).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              _formatRange(event.start, event.end),
              style: Theme.of(ctx).textTheme.bodyMedium,
            ),
            if (event.subtitle != null) ...[
              const SizedBox(height: 8),
              Text(event.subtitle!),
            ],
            const SizedBox(height: 20),
            Row(
              children: [
                FilledButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Close'),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () => Navigator.pop(ctx),
                  icon: const Icon(Icons.edit_outlined),
                  label: const Text('Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatRange(DateTime start, DateTime end) {
    final s = '${start.year}-${_p(start.month)}-${_p(start.day)}';
    final e = '${end.year}-${_p(end.month)}-${_p(end.day)}';
    return s == e ? s : '$s → $e';
  }

  String _p(int v) => v < 10 ? '0$v' : '$v';
}

/// Header text driven by the controller — rebuilds only when the visible
/// month changes, not on every BLoC emission.
class _MonthHeader extends StatelessWidget {
  const _MonthHeader({required this.controller});

  final OpsCalendarController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final m = controller.visibleMonth ?? DateTime.now();
        return Text(_formatMonth(m));
      },
    );
  }

  String _formatMonth(DateTime m) {
    const names = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${names[m.month - 1]} ${m.year}';
  }
}
