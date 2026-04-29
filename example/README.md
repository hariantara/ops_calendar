# ops_calendar example

A minimal Flutter app showing how to drive `ops_calendar` from a `Bloc`.

## First-time setup

This directory contains the Dart source only. Generate the platform scaffolding (`ios/`, `android/`, `web/`, etc.) once:

```bash
cd example
flutter create .
flutter pub get
```

`flutter create .` is non-destructive — it adds platform folders without overwriting `lib/` or `pubspec.yaml`.

## Run

```bash
flutter run
```

## What it shows

- **State management lives in the consumer**, not the package — `CalendarBloc` owns events, the visible month, and the selected date.
- The widget is fed plain data (`events`, `initialMonth`, `selectedDate`) and dispatches BLoC events through its callbacks (`onMonthChanged`, `onDateTap`, `onEventTap`).
- Tapping a multi-day ribbon shows a SnackBar via a `BlocConsumer.listener`.
