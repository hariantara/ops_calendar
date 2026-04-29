## 0.2.0

- **New**: `OpsMonthCalendar.ribbonBuilder` — fully replace the default
  ribbon visual with your own widget. Mirrors Syncfusion's
  `appointmentBuilder` pattern, so consumers porting from
  `syncfusion_flutter_calendar` can drop in their existing custom
  appointment widgets with minimal change. The calendar still owns
  positioning and clipping; the builder owns paint contents and tap
  gestures.
- **New**: `OpsRibbonBuilder` typedef and `OpsRibbonBuilderContext`
  class exported from the public API. The context exposes the event,
  the continues-from/into-week flags (for matching the existing
  squared-corner-on-the-continued-side convention), the lane index,
  and the resolved tap callback.
- **Migration recipe** added to README under "Migrating from
  Syncfusion".
- Backwards compatible — `ribbonBuilder` is null by default and
  ribbons render unchanged when not provided.

Minor bump (0.1.x → 0.2.0) signals the new public API surface.

## 0.1.7

- Update the README's installation snippet to reference `^0.1.7`
  (was stuck at `^0.1.0`).

## 0.1.6

- Add animated demo GIF (`screenshots/demo.gif`, 320×711, 1.4 MB, 9.7s)
  showing month swipe, event tap, and the bottom-sheet detail flow. The
  GIF is now the first screenshot on the package page and embedded near
  the top of the README.
- Sharpen package description to lead with the differentiator
  ("Ribbon-based multi-day event calendar for Flutter") instead of
  generic feature lists.
- Add GitHub Actions workflow (`.github/workflows/deploy-demo.yml`) to
  build the example app as Flutter web and deploy to GitHub Pages on
  every `main` push. After enabling Pages in repo settings → Source:
  GitHub Actions, the live demo lives at
  https://hariantara.github.io/ops_calendar/.

## 0.1.5

- Default `CalendarConfig.maxVisibleLanes` raised from `3` to `4`.
  Typical mobile cell heights have plenty of room for a 4th ribbon, and
  the higher default matches Google Calendar's month view. Consumers
  who want the previous density can pass
  `CalendarConfig(maxVisibleLanes: 3)`.

## 0.1.4

- Add a screenshot of the month view (with multi-day ribbons and the
  `+N more` overflow indicator) so pub.dev's package page shows a
  preview at the top.

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
