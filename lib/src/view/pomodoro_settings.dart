import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/src/viewmodel/pomodoro_settings_viewmodel.dart';
import "dart:math";

import 'package:provider/provider.dart';
//dark mode
//pomo len
//pomos until long break
//short break len
//long break len
//auto resume timer
//sound
//notifications

class PomodoroSettings extends StatefulWidget {
  final Color dialogColor;

  const PomodoroSettings({Key? key, required this.dialogColor})
      : super(key: key);

  @override
  PomodoroSettingsState createState() => PomodoroSettingsState();
}

class PomodoroSettingsState extends State<PomodoroSettings> {
  TextEditingController? _controller1;
  TextEditingController? _controller2;
  TextEditingController? _controller3;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
  }

  @override
  void dispose() {
    _controller1?.dispose();
    _controller2?.dispose();
    _controller3?.dispose();
    //print("qwer"); this gets called when the dialog is popped regardless of the button being pressed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: widget.dialogColor,
      backgroundColor: widget.dialogColor,
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
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            settingTextFieldTile("Pomodoro length", "25", _controller1),
            settingTextFieldTile("Short break length", "5", _controller2),
            settingTextFieldTile("Long break length", "15", _controller3),
            settingSwitchTile("Auto resume timer", "autoresumekey"),
            settingSwitchTile("Notification", "notification"),
          ],
        ),
      ),
    );
  }

  Widget settingTextFieldTile(
      String text, String inputText, TextEditingController? controller) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
      dense: true,
      trailing: SizedBox(
        height: 40,
        width: 50,
        child: TextField(
          controller: controller?..text = inputText,
          onChanged: (text) => {},

          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.center, // Align text in the center
          cursorWidth: 1.0, // Adjust cursor width if needed
          cursorColor: const Color(0xffffffff),

          style: const TextStyle(fontSize: 18), // Add your desired text style
          decoration: InputDecoration(
            hintText: inputText,
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: max(max(widget.dialogColor.blue, widget.dialogColor.red),
                            widget.dialogColor.green) ==
                        widget.dialogColor.green
                    ? const Color(0xff00ff00)
                    : max(max(widget.dialogColor.blue, widget.dialogColor.red),
                                widget.dialogColor.green) ==
                            widget.dialogColor.red
                        ? const Color(0xffff0000)
                        : const Color(0xff0000ff),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Color(0xffd8d6de))),
            contentPadding: const EdgeInsets.all(0),
          ),
        ),
      ),
    );
  }

  Widget settingSwitchTile(String text, String key) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
      dense: true,
      trailing: SizedBox(
        height: 40,
        width: 50,
        child: Consumer<PomodoroSettingsViewModel>(
          builder: (context, viewmodel, child) {
            return Switch(
              value: viewmodel.assignSwitch(key),
              activeColor: Colors.white,
              activeTrackColor: max(
                          max(widget.dialogColor.blue, widget.dialogColor.red),
                          widget.dialogColor.green) ==
                      widget.dialogColor.green
                  ? const Color(0xff00ff00)
                  : max(max(widget.dialogColor.blue, widget.dialogColor.red),
                              widget.dialogColor.green) ==
                          widget.dialogColor.red
                      ? const Color(0xffff0000)
                      : const Color(0xff0000ff),
              onChanged: (bool value) {
                viewmodel.updateSwitch(key);
              },
            );
          },
        ),
      ),
    );
  }
}
