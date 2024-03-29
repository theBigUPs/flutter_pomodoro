import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/src/service/service_provider.dart';
import 'package:flutter_pomodoro/src/view/pomodoro_timer.dart';
import 'package:flutter_pomodoro/src/viewmodel/pomodoro_timer_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ServiceProvider>(
          create: (_) => ServiceProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pomodoro',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (BuildContext context) {
          return PomodoroTimerViewModel();
        },
        child: const PomodoroTimer(),
      ),
    );
  }
}
