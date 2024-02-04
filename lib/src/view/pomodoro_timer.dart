import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/src/viewmodel/pomodoro_timer_viewmodel.dart';
import 'package:provider/provider.dart';

class PomodoroTimer extends StatelessWidget {
  const PomodoroTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueGrey,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<PomodoroTimerViewModel>(
              builder: (BuildContext context, viewmodel, Widget? child) {
                return Text(viewmodel.minute);
              },
            ),
            Consumer<PomodoroTimerViewModel>(
              builder: (BuildContext context, viewmodel, Widget? child) {
                return Text(viewmodel.second);
              },
            ),
            ElevatedButton(
              onPressed: () {
                PomodoroTimerViewModel viewmodel =
                    Provider.of(context, listen: false);
                viewmodel.startTimer(10);
              },
              child: const Text("timer"),
            ),
            const SizedBox(
              height: 100,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ),
      )),
    );
  }
}
