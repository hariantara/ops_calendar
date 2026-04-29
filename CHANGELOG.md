## 0.1.0

- Initial release.
- Month view with swipeable months.
- Multi-day event ribbons with greedy lane packing.
- Single-day event chips.
- `OpsCalendarController` for programmatic next/previous/jump-to-month and
  observing the visible month from outside the widget tree.
- Tap callbacks for events and dates.
- "+N more" overflow indicator.
- Customizable theme via `OpsCalendarTheme` (`ThemeExtension`).
- State-management agnostic public API.
- `RepaintBoundary` per page and pre-computed ribbon layout for smooth
  swipe performance.
