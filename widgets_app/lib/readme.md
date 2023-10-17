Creating a custom widget in Flutter often involves organizing your code into multiple files. Here's an example of how to create a custom button widget spread across multiple files: `main.dart`, `custom_button.dart`, and `my_home_page.dart`. This demonstrates a basic Flutter application that uses a custom button widget:

**main.dart**

```dart
import 'package:flutter/material.dart';
import 'my_home_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyHomePage(),
    ),
  );
}
```

**my_home_page.dart**

```dart
import 'package:flutter/material.dart';
import 'custom_button.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Widget Example'),
        ),
        body: Center(
          child: CustomButton(
            text: 'Click Me',
            onPressed: () {
              // Your button's action here
            },
          ),
        ),
      ),
    );
  }
}
```

**custom_button.dart**

```dart
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(text),
    );
  }
}
```

This code demonstrates how you can create a custom button widget in the `custom_button.dart` file, use it in the `my_home_page.dart` file, and start the app in the `main.dart` file. Make sure to import the necessary files in each Dart file as shown above.

To run this Flutter app, create these files in your project, and then execute `main.dart` to start the app. The custom button widget (`CustomButton`) can be easily reused throughout your application.
