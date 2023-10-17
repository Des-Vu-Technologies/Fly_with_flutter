```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
   const MyHomePage({Key? key, this.title}) : super(key: key);

   final String? title;
   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(title: Text(title!), ),
         body: const Center(child: Text( 'Hello World',)),
      );
   }
}

```

1. Import Flutter packages:

   ```dart
   import 'package:flutter/material.dart';
   ```

   This line imports the necessary Flutter packages, including `material.dart`, which provides widgets for building material design applications.

2. Define the main function and runApp:

   ```dart
   void main() {
     runApp(const MyApp());
   }
   ```

   The `main` function is the entry point of the application. It calls `runApp` to start the Flutter application and render the `MyApp` widget.

3. `MyApp` Class:

   ```dart
   class MyApp extends StatelessWidget {
     const MyApp({Key? key}) : super(key: key);
   ```

   This class represents the top-level widget of your application. It is a stateless widget, so it doesn't have mutable state. It defines the overall structure of the app.

   - `title`: The title of the app is set to "Flutter Demo."
   - `theme`: The theme is set to use the primary color swatch of blue.
   - `home`: The `MyHomePage` widget is set as the home screen of the app with the title "Flutter Demo Home Page."

4. `MyHomePage` Class:

   ```dart
   class MyHomePage extends StatelessWidget {
     const MyHomePage({Key? key, this.title}) : super(key: key);
   ```

   This class represents the main content of the app, which is a simple page with an app bar and a "Hello World" message in the center. It also inherits from `StatelessWidget`.

   - `title`: The title for the app bar is passed as a parameter and displayed in the app bar.
   - The `build` method creates a `Scaffold` widget, which provides the basic material design structure for the screen.
   - The `appBar` property sets an `AppBar` with the title set to the provided `title`.
   - The `body` property sets the main content to be a centered `Text` widget with the text "Hello World."

     UML


     Widget Tree

     

```diff

Copy code
+-----------------------------------+
|             StatelessWidget         |
|           MyApp                   |
+-----------------------------------+
| - title: String                   |
+-----------------------------------+
| + build(BuildContext): Widget       |
+-----------------------------------+
          |
          |
          V
+-----------------------------------+
|             StatelessWidget         |
|           MyHomePage              |
+-----------------------------------+
| - title: String                   |
+-----------------------------------+
| + build(BuildContext): Widget       |
+-----------------------------------+
```
