import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'calendar_bloc.dart';
import 'calendar_screen.dart';

void main() {
  runApp(const OpsCalendarExampleApp());
}

class OpsCalendarExampleApp extends StatelessWidget {
  const OpsCalendarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ops_calendar example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF3B82F6),
      ),
      home: BlocProvider(
        create: (_) => CalendarBloc()..add(const CalendarStarted()),
        child: const CalendarScreen(),
      ),
    );
  }
}
