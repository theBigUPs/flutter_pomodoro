import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/src/view/pomodoro_settings.dart';
import 'package:flutter_pomodoro/src/viewmodel/pomodoro_settings_viewmodel.dart';
import 'package:flutter_pomodoro/src/viewmodel/pomodoro_timer_viewmodel.dart';
import 'package:provider/provider.dart';

class PomodoroTimer extends StatelessWidget {
  const PomodoroTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xff0b1a26),
              ),
              height: 40,
              width: 135,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.work_history),
                  //Icon(Icons.coffee),
                  Text("   Focus"),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                settingsButton(context),
                const SizedBox(
                  width: 15,
                ),
                playPauseButton(context),
                const SizedBox(
                  width: 15,
                ),
                nextButton(context),
              ],
            ),

            const SizedBox(
              height: 100,
            ),
            //IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ),
      )),
    );
  }

  Widget playPauseButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          PomodoroTimerViewModel viewmodel =
              Provider.of(context, listen: false);
          //viewmodel.cancelTimer();
          //viewmodel.startTimer(10);
          //viewmodel.flip.initialize(viewmodel.settings);
          viewmodel.cancelTimer();
          viewmodel.startTimer(3, context);
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xff367ab5)),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(100.0, 100.0), // Adjust the width and height as needed
            ),
            maximumSize: MaterialStateProperty.all<Size>(
              const Size(100.0, 100.0), // Adjust the width and height as needed
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            )),
        child: const Center(
          child: Icon(
            Icons.arrow_right,
            size: 100,
            color: Colors.white,
          ),
        ));
  }

  Widget nextButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          PomodoroTimerViewModel viewmodel =
              Provider.of(context, listen: false);
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xff0b1a26)),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(75.0, 75.0), // Adjust the width and height as needed
            ),
            maximumSize: MaterialStateProperty.all<Size>(
              const Size(75.0, 75.0), // Adjust the width and height as needed
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            )),
        child: const Center(
          child: Icon(
            Icons.fast_forward_sharp,
            size: 40,
            color: Colors.white,
          ),
        ));
  }

  Widget settingsButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ChangeNotifierProvider(
                create: (BuildContext context) {
                  return PomodoroSettingsViewModel();
                },
                child: const PomodoroSettings(),
              );
            },
          );
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xff0b1a26)),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(75.0, 75.0), // Adjust the width and height as needed
            ),
            maximumSize: MaterialStateProperty.all<Size>(
              const Size(75.0, 75.0), // Adjust the width and height as needed
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            )),
        child: const Center(
          child: Icon(
            Icons.more_horiz_sharp,
            size: 40,
            color: Colors.white,
          ),
        ));
  }
}
