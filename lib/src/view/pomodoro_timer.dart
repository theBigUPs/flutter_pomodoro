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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              newMethod(context),
              const SizedBox(
                height: 25,
              ),
              Consumer<PomodoroTimerViewModel>(
                builder: (BuildContext context, viewmodel, Widget? child) {
                  return Text(
                    viewmodel.minute,
                    style: const TextStyle(
                        fontSize: 150,
                        fontWeight: FontWeight.bold,
                        height: 0.8),
                  );
                },
              ),
              Consumer<PomodoroTimerViewModel>(
                builder: (BuildContext context, viewmodel, Widget? child) {
                  return Text(
                    viewmodel.second,
                    style: const TextStyle(
                        fontSize: 150,
                        fontWeight: FontWeight.bold,
                        height: 0.8),
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
                height: 10,
              ),
              SizedBox(
                  height: 25,
                  width: 100,
                  child: pomodoroProgressIndicator(context)),
            ],
          ),
        ),
      )),
    );
  }

  Widget newMethod(BuildContext context) {
    PomodoroTimerViewModel viewmodel = Provider.of(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: viewmodel.mainColor),
        borderRadius: BorderRadius.circular(25),
        color: viewmodel.secondaryColor,
      ),
      height: 40,
      width: 135,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(viewmodel.stateIcon),
          //Icon(Icons.coffee),
          Text(viewmodel.stateText),
        ],
      ),
    );
  }

  Widget playPauseButton(BuildContext context) {
    PomodoroTimerViewModel viewmodel = Provider.of(context, listen: false);
    return ElevatedButton(
        onPressed: () {
          viewmodel.startStopTimer(context);
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(viewmodel.mainColor),
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
        child: Center(child: Consumer<PomodoroTimerViewModel>(
          builder: (BuildContext context, viewmodel, Widget? child) {
            return Icon(
              viewmodel.startPauseIcon,
              size: 100,
              color: Colors.white,
            );
          },
        )));
  }

  Widget nextButton(BuildContext context) {
    PomodoroTimerViewModel viewmodel = Provider.of(context, listen: true);
    return ElevatedButton(
      onPressed: () {
        viewmodel.ispaused = true;
        viewmodel.pomodoroProgress(context);
        viewmodel.progress++;
      },
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(viewmodel.secondaryColor),
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
      ),
    );
  }

  Widget settingsButton(BuildContext context) {
    PomodoroTimerViewModel viewmodel = Provider.of(context, listen: false);
    return ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ChangeNotifierProvider(
                create: (BuildContext context) {
                  return PomodoroSettingsViewModel();
                },
                child:
                    PomodoroSettings(backgroundcolor: viewmodel.secondaryColor),
              );
            },
          );
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(viewmodel.secondaryColor),
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

  Widget pomodoroProgressIndicator(BuildContext context) {
    return Consumer<PomodoroTimerViewModel>(
      builder: (context, viewmodel, child) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: viewmodel.progressIcons.length,
          itemBuilder: (BuildContext context, int index) {
            return Icon(viewmodel.progressIcons[index]);
          },
        );
      },
    );
  }
}
