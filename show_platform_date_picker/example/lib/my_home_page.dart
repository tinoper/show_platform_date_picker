import 'package:flutter/material.dart';
import 'package:show_platform_date_picker/show_platform_date_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final ShowPlatformDatePicker platformDatePicker = ShowPlatformDatePicker(
      buildContext: context,
    );
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () async {
                final newSelectedDateTime = await platformDatePicker
                    .showPlatformDatePicker(
                      context,
                      selectedDate,
                      DateTime(1900),
                      DateTime.now().add(Duration(days: 3650)),
                    );
                setState(() {
                  selectedDate = newSelectedDateTime ?? DateTime.now();
                });
              },
              child: Text('Date: $selectedDate'),
            ),
          ],
        ),
      ),
    );
  }
}
