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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<PomodoroTimerViewModel>(
              builder: (BuildContext context, viewmodel, Widget? child) {
                return Text(
                  viewmodel.minute,
                  style: const TextStyle(
                      fontSize: 150, fontWeight: FontWeight.bold, height: 0.8),
                );
              },
            ),
            Consumer<PomodoroTimerViewModel>(
              builder: (BuildContext context, viewmodel, Widget? child) {
                return Text(
                  viewmodel.second,
                  style: const TextStyle(
                      fontSize: 150, fontWeight: FontWeight.bold, height: 0.8),
                );
              },
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                PomodoroTimerViewModel viewmodel =
                    Provider.of(context, listen: false);
                //viewmodel.cancelTimer();
                //viewmodel.startTimer(10);
                //viewmodel.flip.initialize(viewmodel.settings);
                viewmodel.cancelTimer();
                viewmodel.startTimer(3, context);
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
