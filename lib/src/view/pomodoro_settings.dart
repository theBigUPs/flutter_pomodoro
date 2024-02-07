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
  final Color dialogColor;

  const PomodoroSettings({Key? key, required this.dialogColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: dialogColor,
      backgroundColor: dialogColor,
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
