# ShowPlatformDatePicker

  

**ShowPlatformDatePicker** is a minimalist wrapper around the showDatePicker and CupertinoDatePicker methods, which allows the developer to display a date picker that is appropriate for the current platform (either Android or iOS).

`ShowPlatformDatePicker` class takes in some arguments, such as the `BuildContext`, `initialDate`, `firstDate`, and `lastDate`, and provides a single method `showPlatformDatePicker` that handles the logic for showing the appropriate date picker based on the platform. The `showPlatformDatePicker` method returns a `Future<DateTime?>` that represents the date selected by the user.

By using a wrapper like `PlatformDatePicker`, developers can simplify the process of displaying platform-specific widgets, which can improve the user experience and make their code more maintainable.

  

## Features

  
 - [x] Show date Cupertino (iOS) style picker
 - [x] Show date Material Design(Android) style picker

  
## Usage  

```dart

final  ShowPlatformDatePicker  platformDatePicker = ShowPlatformDatePicker(buildContext: context);


final  newSelectedDateTime = await  platformDatePicker
	.showPlatformDatePicker(
		context,
		selectedDate,
		DateTime(1900),
		DateTime.now().add(Duration(days: 3650)),
	);

```
