import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Supported Platforms
enum PlatformTarget { android, iOS }

/// Main class
/// [buildContext] Parent widget context
/// [initialDate]  Selected date by default
/// [firstDate]    Oldest date
/// [lastDate]     Last date
class ShowPlatformDatePicker {
  final BuildContext buildContext;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  ShowPlatformDatePicker(
      {required this.buildContext,
      this.initialDate,
      this.firstDate,
      this.lastDate});

  ///
  Future<DateTime?> showPlatformDatePicker(
    BuildContext context,
    DateTime initialDate,
    DateTime firstDate,
    DateTime lastDate,
  ) async {
    DateTime? selectedDate;

    if (Theme.of(context).platform == TargetPlatform.iOS) {
      await showCupertinoModalPopup<DateTime>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: initialDate,
              minimumDate: firstDate,
              maximumDate: lastDate,
              onDateTimeChanged: (DateTime newDate) {
                selectedDate = newDate;
              },
            ),
          );
        },
      );
    } else {
      selectedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(
                buildContext), // ajustar según el tema de tu aplicación
            child: child!,
          );
        },
      );
    }

    return selectedDate;
  }
}
