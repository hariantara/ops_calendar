import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// Programmatic control surface for [OpsMonthCalendar].
///
/// Create one in your [State.initState], pass it to the calendar via the
/// `controller:` argument, and dispose it in [State.dispose] — same lifecycle
/// as [TextEditingController] or [PageController]. From your own widgets you
/// can call [nextMonth], [previousMonth], or [goToMonth], and you can listen
/// to [visibleMonth] changes via [ChangeNotifier.addListener] or
/// [AnimatedBuilder] to drive a custom calendar header.
///
/// ```dart
/// final controller = OpsCalendarController();
///
/// // In your header:
/// AnimatedBuilder(
///   animation: controller,
///   builder: (_, __) =>
///       Text(_formatMonth(controller.visibleMonth ?? DateTime.now())),
/// );
/// IconButton(
///   icon: const Icon(Icons.chevron_left),
///   onPressed: controller.previousMonth,
/// );
/// ```
class OpsCalendarController extends ChangeNotifier {
  /// Default duration for [nextMonth] / [previousMonth] / [goToMonth].
  static const Duration defaultDuration = Duration(milliseconds: 300);

  /// Default curve for animated transitions.
  static const Curve defaultCurve = Curves.easeInOut;

  PageController? _pageController;
  DateTime? _baseMonth;
  int? _initialPage;
  DateTime? _visibleMonth;

  /// The month currently centered in the calendar's [PageView], or `null`
  /// before the widget has built. Updated whenever the user swipes or one
  /// of the controller methods completes.
  DateTime? get visibleMonth => _visibleMonth;

  /// Whether this controller is currently bound to a live calendar widget.
  bool get isAttached => _pageController != null;

  /// Animates to the next month.
  Future<void> nextMonth({
    Duration duration = defaultDuration,
    Curve curve = defaultCurve,
  }) async {
    final pc = _pageController;
    if (pc == null) return;
    await pc.nextPage(duration: duration, curve: curve);
  }

  /// Animates to the previous month.
  Future<void> previousMonth({
    Duration duration = defaultDuration,
    Curve curve = defaultCurve,
  }) async {
    final pc = _pageController;
    if (pc == null) return;
    await pc.previousPage(duration: duration, curve: curve);
  }

  /// Animates to [target]'s year/month. The day component is ignored.
  ///
  /// Works for any date (past or future) — the underlying [PageView] is
  /// effectively unbounded.
  Future<void> goToMonth(
    DateTime target, {
    Duration duration = defaultDuration,
    Curve curve = defaultCurve,
  }) async {
    final pc = _pageController;
    final base = _baseMonth;
    final initial = _initialPage;
    if (pc == null || base == null || initial == null) return;
    final delta =
        (target.year - base.year) * 12 + (target.month - base.month);
    await pc.animateToPage(
      initial + delta,
      duration: duration,
      curve: curve,
    );
  }

  /// Jumps to [target]'s year/month with no animation.
  void jumpToMonth(DateTime target) {
    final pc = _pageController;
    final base = _baseMonth;
    final initial = _initialPage;
    if (pc == null || base == null || initial == null) return;
    final delta =
        (target.year - base.year) * 12 + (target.month - base.month);
    pc.jumpToPage(initial + delta);
  }

  /// Convenience: animates to the month containing [DateTime.now].
  Future<void> goToToday({
    Duration duration = defaultDuration,
    Curve curve = defaultCurve,
  }) =>
      goToMonth(DateTime.now(), duration: duration, curve: curve);

  // -------------------------------------------------------------------------
  // Internal API — called by [OpsMonthCalendar]; not for consumer use.
  // -------------------------------------------------------------------------

  /// Internal: binds this controller to the widget that owns it.
  ///
  /// Called by [OpsMonthCalendar] in [State.initState]. Throws if the
  /// controller is already attached to a live widget.
  @internal
  void attach({
    required PageController pageController,
    required DateTime baseMonth,
    required int initialPage,
  }) {
    assert(
      _pageController == null,
      'OpsCalendarController is already attached. Each controller may '
      'drive only one OpsMonthCalendar at a time.',
    );
    _pageController = pageController;
    _baseMonth = baseMonth;
    _initialPage = initialPage;
  }

  /// Internal: releases the controller from its widget.
  @internal
  void detach() {
    _pageController = null;
    _baseMonth = null;
    _initialPage = null;
  }

  /// Internal: updates the cached visible month and notifies listeners.
  @internal
  void updateVisibleMonth(DateTime month) {
    if (_visibleMonth?.year == month.year &&
        _visibleMonth?.month == month.month) {
      return;
    }
    _visibleMonth = DateTime(month.year, month.month);
    notifyListeners();
  }
}
