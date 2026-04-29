import 'package:flutter/widgets.dart';

import 'package:ops_calendar/src/models/calendar_event.dart';

/// Builder signature for replacing the default ribbon visual.
///
/// Pass an [OpsRibbonBuilder] to `OpsMonthCalendar.ribbonBuilder` and the
/// calendar will call it for every visible ribbon segment instead of
/// rendering its built-in ribbon. Return any widget you want — the
/// calendar handles positioning and clipping; you control the visuals
/// and tap behavior.
///
/// Example: render a status icon inside the ribbon plus a custom card.
/// ```dart
/// OpsMonthCalendar(
///   ribbonBuilder: (context, details) {
///     final task = details.event.metadata!['task'] as TaskModel;
///     return GestureDetector(
///       onTap: details.onTap,
///       child: Container(
///         decoration: BoxDecoration(
///           color: task.statusColor,
///           borderRadius: BorderRadius.circular(2.5),
///         ),
///         child: Row(children: [
///           if (task.isRunning) const Icon(Icons.timer, size: 14),
///           Expanded(
///             child: Text(
///               details.event.title,
///               overflow: TextOverflow.ellipsis,
///             ),
///           ),
///         ]),
///       ),
///     );
///   },
/// );
/// ```
typedef OpsRibbonBuilder = Widget Function(
  BuildContext context,
  OpsRibbonBuilderContext details,
);

/// Context handed to an [OpsRibbonBuilder] for one visible ribbon segment.
///
/// The calendar still owns the ribbon's pixel rectangle (left/top/width/
/// height); the builder controls everything painted inside it.
@immutable
class OpsRibbonBuilderContext {
  /// Creates an [OpsRibbonBuilderContext].
  const OpsRibbonBuilderContext({
    required this.event,
    required this.continuesFromPreviousWeek,
    required this.continuesIntoNextWeek,
    required this.lane,
    required this.onTap,
  });

  /// The event this ribbon represents.
  final CalendarEvent event;

  /// `true` if the event started before this week — useful for clipping
  /// the left edge (e.g. squared-off corners on the start side).
  final bool continuesFromPreviousWeek;

  /// `true` if the event continues into the next week — useful for
  /// clipping the right edge.
  final bool continuesIntoNextWeek;

  /// Vertical lane this segment occupies (0 = top). Useful if the
  /// builder's visual depends on lane index (e.g. stripe pattern).
  final int lane;

  /// Tap handler. `null` if the calendar wasn't passed an `onEventTap`
  /// callback. Wire it into your own `GestureDetector`/`InkWell`.
  final VoidCallback? onTap;
}
