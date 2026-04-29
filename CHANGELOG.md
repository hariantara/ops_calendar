## 0.1.3

- Add pub.dev `topics:` (`calendar`, `widget`, `event`, `appointment`,
  `month-view`) for better discoverability via pub.dev topic pages and
  search.
- Sharpen package description to surface the most-searched keywords
  (Flutter, month calendar, widget, BLoC, Riverpod, Provider) within
  pub.dev's 60–180 character limit.

## 0.1.2

- Migrate to `freezed` 3.x and `freezed_annotation` 3.x.
- Bump `meta` to ^1.18.0.
- Model classes are now `abstract` per freezed 3 conventions.
- No public API changes — all consumers continue to work unchanged.

## 0.1.1

- Switched all internal imports to `package:` form (lint cleanup, no
  behavior change).
- Tightened cascade usage in `OpsMonthCalendar` controller attachment.
- Removed redundant default arguments and one stray comment reference.
- Added `.pubignore` to exclude `example/` platform scaffolds (`android/`,
  `ios/`, `linux/`, `macos/`, `web/`, `windows/`) from the published
  archive — drops the upload from ~295 KB to ~50 KB.

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
