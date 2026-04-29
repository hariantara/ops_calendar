import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ops_calendar/ops_calendar.dart';

sealed class CalendarBlocEvent {
  const CalendarBlocEvent();
}

class CalendarStarted extends CalendarBlocEvent {
  const CalendarStarted();
}

class CalendarMonthChanged extends CalendarBlocEvent {
  const CalendarMonthChanged(this.month);
  final DateTime month;
}

class CalendarDateSelected extends CalendarBlocEvent {
  const CalendarDateSelected(this.date);
  final DateTime date;
}

class CalendarEventOpened extends CalendarBlocEvent {
  const CalendarEventOpened(this.event);
  final CalendarEvent event;
}

class CalendarState {
  const CalendarState({
    required this.visibleMonth,
    required this.events,
    this.selectedDate,
    this.lastOpenedEvent,
  });

  final DateTime visibleMonth;
  final List<CalendarEvent> events;
  final DateTime? selectedDate;
  final CalendarEvent? lastOpenedEvent;

  CalendarState copyWith({
    DateTime? visibleMonth,
    List<CalendarEvent>? events,
    DateTime? selectedDate,
    CalendarEvent? lastOpenedEvent,
  }) =>
      CalendarState(
        visibleMonth: visibleMonth ?? this.visibleMonth,
        events: events ?? this.events,
        selectedDate: selectedDate ?? this.selectedDate,
        lastOpenedEvent: lastOpenedEvent ?? this.lastOpenedEvent,
      );
}

class CalendarBloc extends Bloc<CalendarBlocEvent, CalendarState> {
  CalendarBloc()
      : super(
          CalendarState(
            visibleMonth: DateTime(DateTime.now().year, DateTime.now().month),
            events: const [],
          ),
        ) {
    on<CalendarStarted>((event, emit) {
      emit(state.copyWith(events: _seedEvents()));
    });
    on<CalendarMonthChanged>((event, emit) {
      emit(state.copyWith(visibleMonth: event.month));
    });
    on<CalendarDateSelected>((event, emit) {
      emit(state.copyWith(selectedDate: event.date));
    });
    on<CalendarEventOpened>((event, emit) {
      emit(state.copyWith(lastOpenedEvent: event.event));
    });
  }

  static List<CalendarEvent> _seedEvents() {
    final now = DateTime.now();
    final monthStart = DateTime(now.year, now.month);
    DateTime d(int offset) => monthStart.add(Duration(days: offset));

    return [
      CalendarEvent(
        id: '1',
        title: 'Sprint planning',
        start: d(2),
        end: d(2),
        color: const Color(0xFF3B82F6),
      ),
      CalendarEvent(
        id: '2',
        title: 'Design review',
        start: d(4),
        end: d(6),
        color: const Color(0xFF10B981),
      ),
      CalendarEvent(
        id: '3',
        title: 'Conference',
        start: d(9),
        end: d(13),
        color: const Color(0xFFF59E0B),
      ),
      CalendarEvent(
        id: '4',
        title: 'Standup',
        start: d(10),
        end: d(10),
        color: const Color(0xFF8B5CF6),
      ),
      CalendarEvent(
        id: '5',
        title: 'Release window',
        start: d(18),
        end: d(22),
        color: const Color(0xFFEF4444),
      ),
      // "Busy day" cluster — 7 events landing on day 10 to demonstrate the
      // "+N more" overflow indicator. With default maxVisibleLanes: 3, four
      // of these will collapse into a "+4 more" badge on day 10's cell.
      CalendarEvent(
        id: '6',
        title: 'Client call',
        start: d(10),
        end: d(10),
        color: const Color(0xFF06B6D4),
      ),
      CalendarEvent(
        id: '7',
        title: '1:1 with Alice',
        start: d(10),
        end: d(10),
        color: const Color(0xFFEC4899),
      ),
      CalendarEvent(
        id: '8',
        title: 'Code review',
        start: d(10),
        end: d(10),
        color: const Color(0xFF14B8A6),
      ),
      CalendarEvent(
        id: '9',
        title: 'Lunch',
        start: d(10),
        end: d(10),
        color: const Color(0xFF84CC16),
      ),
      CalendarEvent(
        id: '10',
        title: 'Roadmap sync',
        start: d(10),
        end: d(10),
        color: const Color(0xFF6366F1),
      ),
    ];
  }
}
