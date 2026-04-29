import 'package:flutter/material.dart';

import '../models/ops_calendar_theme.dart';
import '../models/ribbon_segment.dart';

/// Visual rendering of one [RibbonSegment].
///
/// Squared-off corners on the side that continues into an adjacent week,
/// rounded on the side that doesn't — visually conveying that the event
/// extends beyond the current row.
class Ribbon extends StatelessWidget {
  /// Creates a [Ribbon].
  const Ribbon({
    required this.segment,
    required this.theme,
    this.onTap,
    super.key,
  });

  /// The laid-out segment to render.
  final RibbonSegment segment;

  /// Calendar styling.
  final OpsCalendarTheme theme;

  /// Tap handler — receives the underlying [RibbonSegment.event] from the
  /// caller.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = theme.ribbonRadius;
    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(
        segment.continuesFromPreviousWeek ? 0 : radius,
      ),
      bottomLeft: Radius.circular(
        segment.continuesFromPreviousWeek ? 0 : radius,
      ),
      topRight: Radius.circular(
        segment.continuesIntoNextWeek ? 0 : radius,
      ),
      bottomRight: Radius.circular(
        segment.continuesIntoNextWeek ? 0 : radius,
      ),
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Ink(
          decoration: BoxDecoration(
            color: segment.event.color,
            borderRadius: borderRadius,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: theme.ribbonHorizontalPadding,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                segment.event.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.ribbonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
