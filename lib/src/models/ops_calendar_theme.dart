import 'package:flutter/material.dart';

/// Visual styling for `OpsMonthCalendar`.
///
/// Implemented as a [ThemeExtension] so it integrates with [ThemeData]
/// and [Theme.of] lookups. Pass directly to the widget for one-off
/// customization, or register on `ThemeData.extensions` to apply globally.
@immutable
class OpsCalendarTheme extends ThemeExtension<OpsCalendarTheme> {
  /// Creates an [OpsCalendarTheme].
  const OpsCalendarTheme({
    this.cellBorderColor = const Color(0xFFE5E7EB),
    this.cellBackgroundColor = const Color(0xFFFFFFFF),
    this.outsideMonthCellColor = const Color(0xFFF9FAFB),
    this.todayHighlightColor = const Color(0xFFDBEAFE),
    this.selectedDayColor = const Color(0xFF3B82F6),
    this.weekdayLabelStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Color(0xFF6B7280),
    ),
    this.dayNumberStyle = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: Color(0xFF111827),
    ),
    this.outsideMonthDayNumberStyle = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Color(0xFF9CA3AF),
    ),
    this.ribbonTextStyle = const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    this.moreIndicatorStyle = const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: Color(0xFF6B7280),
    ),
    this.ribbonHeight = 18,
    this.ribbonGap = 2,
    this.ribbonHorizontalPadding = 4,
    this.ribbonRadius = 4,
    this.cellPadding = const EdgeInsets.all(4),
  });

  /// Border color drawn between day cells.
  final Color cellBorderColor;

  /// Background fill for cells inside the displayed month.
  final Color cellBackgroundColor;

  /// Background fill for "leading"/"trailing" cells from adjacent months.
  final Color outsideMonthCellColor;

  /// Background fill behind today's day number.
  final Color todayHighlightColor;

  /// Accent color used for the selected day indicator.
  final Color selectedDayColor;

  /// Text style for the weekday labels in the header row.
  final TextStyle weekdayLabelStyle;

  /// Text style for the day-of-month number inside in-month cells.
  final TextStyle dayNumberStyle;

  /// Text style for the day number inside outside-month cells.
  final TextStyle outsideMonthDayNumberStyle;

  /// Text style for ribbon labels.
  final TextStyle ribbonTextStyle;

  /// Text style for the "+N more" overflow indicator.
  final TextStyle moreIndicatorStyle;

  /// Vertical height of one ribbon lane.
  final double ribbonHeight;

  /// Vertical gap between ribbon lanes.
  final double ribbonGap;

  /// Horizontal padding inside a ribbon (before its label).
  final double ribbonHorizontalPadding;

  /// Corner radius applied to ribbon backgrounds.
  final double ribbonRadius;

  /// Padding inside each day cell, around its day number.
  final EdgeInsets cellPadding;

  @override
  OpsCalendarTheme copyWith({
    Color? cellBorderColor,
    Color? cellBackgroundColor,
    Color? outsideMonthCellColor,
    Color? todayHighlightColor,
    Color? selectedDayColor,
    TextStyle? weekdayLabelStyle,
    TextStyle? dayNumberStyle,
    TextStyle? outsideMonthDayNumberStyle,
    TextStyle? ribbonTextStyle,
    TextStyle? moreIndicatorStyle,
    double? ribbonHeight,
    double? ribbonGap,
    double? ribbonHorizontalPadding,
    double? ribbonRadius,
    EdgeInsets? cellPadding,
  }) {
    return OpsCalendarTheme(
      cellBorderColor: cellBorderColor ?? this.cellBorderColor,
      cellBackgroundColor: cellBackgroundColor ?? this.cellBackgroundColor,
      outsideMonthCellColor:
          outsideMonthCellColor ?? this.outsideMonthCellColor,
      todayHighlightColor: todayHighlightColor ?? this.todayHighlightColor,
      selectedDayColor: selectedDayColor ?? this.selectedDayColor,
      weekdayLabelStyle: weekdayLabelStyle ?? this.weekdayLabelStyle,
      dayNumberStyle: dayNumberStyle ?? this.dayNumberStyle,
      outsideMonthDayNumberStyle:
          outsideMonthDayNumberStyle ?? this.outsideMonthDayNumberStyle,
      ribbonTextStyle: ribbonTextStyle ?? this.ribbonTextStyle,
      moreIndicatorStyle: moreIndicatorStyle ?? this.moreIndicatorStyle,
      ribbonHeight: ribbonHeight ?? this.ribbonHeight,
      ribbonGap: ribbonGap ?? this.ribbonGap,
      ribbonHorizontalPadding:
          ribbonHorizontalPadding ?? this.ribbonHorizontalPadding,
      ribbonRadius: ribbonRadius ?? this.ribbonRadius,
      cellPadding: cellPadding ?? this.cellPadding,
    );
  }

  @override
  OpsCalendarTheme lerp(ThemeExtension<OpsCalendarTheme>? other, double t) {
    if (other is! OpsCalendarTheme) return this;
    return OpsCalendarTheme(
      cellBorderColor:
          Color.lerp(cellBorderColor, other.cellBorderColor, t) ??
              cellBorderColor,
      cellBackgroundColor:
          Color.lerp(cellBackgroundColor, other.cellBackgroundColor, t) ??
              cellBackgroundColor,
      outsideMonthCellColor:
          Color.lerp(outsideMonthCellColor, other.outsideMonthCellColor, t) ??
              outsideMonthCellColor,
      todayHighlightColor:
          Color.lerp(todayHighlightColor, other.todayHighlightColor, t) ??
              todayHighlightColor,
      selectedDayColor:
          Color.lerp(selectedDayColor, other.selectedDayColor, t) ??
              selectedDayColor,
      weekdayLabelStyle:
          TextStyle.lerp(weekdayLabelStyle, other.weekdayLabelStyle, t) ??
              weekdayLabelStyle,
      dayNumberStyle:
          TextStyle.lerp(dayNumberStyle, other.dayNumberStyle, t) ??
              dayNumberStyle,
      outsideMonthDayNumberStyle: TextStyle.lerp(
            outsideMonthDayNumberStyle,
            other.outsideMonthDayNumberStyle,
            t,
          ) ??
          outsideMonthDayNumberStyle,
      ribbonTextStyle:
          TextStyle.lerp(ribbonTextStyle, other.ribbonTextStyle, t) ??
              ribbonTextStyle,
      moreIndicatorStyle:
          TextStyle.lerp(moreIndicatorStyle, other.moreIndicatorStyle, t) ??
              moreIndicatorStyle,
      ribbonHeight: _lerpDouble(ribbonHeight, other.ribbonHeight, t),
      ribbonGap: _lerpDouble(ribbonGap, other.ribbonGap, t),
      ribbonHorizontalPadding: _lerpDouble(
        ribbonHorizontalPadding,
        other.ribbonHorizontalPadding,
        t,
      ),
      ribbonRadius: _lerpDouble(ribbonRadius, other.ribbonRadius, t),
      cellPadding:
          EdgeInsets.lerp(cellPadding, other.cellPadding, t) ?? cellPadding,
    );
  }

  static double _lerpDouble(double a, double b, double t) => a + (b - a) * t;
}
