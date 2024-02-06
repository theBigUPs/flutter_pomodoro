import 'package:flutter/material.dart';
//dark mode
//pomo len
//pomos until long break
//short break len
//long break len
//auto resume timer
//sound
//notifications

class PomodoroSettings extends StatelessWidget {
  const PomodoroSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.blue,
      backgroundColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Settings'),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close))
        ],
      ),
      content: const Text('This is a custom alert dialog.'),
      actions: const <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Placeholder for flexible space to push close button to the right
            SizedBox(),
          ],
        ),
      ],
    );
  }
}
