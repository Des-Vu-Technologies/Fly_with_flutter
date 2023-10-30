import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/counter/counter_bloc.dart';

Future<void> printHydratedStorageLocation() async {
  if (Platform.isIOS || Platform.isAndroid) {
    final directory = await getApplicationDocumentsDirectory();
    final storagePath = directory.path;
    log('Hydrated Bloc storage location: $storagePath');
  } else if (kIsWeb) {
    log('Hydrated Bloc uses Web storage.');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory());
  printHydratedStorageLocation();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App with BLoC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            BlocConsumer<CounterBloc, int>(
              listener: (context, state) {
                // This callback will be called whenever the state of CounterBloc changes
                // You can perform actions here based on the new state
                if (state == 0) {
                  // Show a snackbar, display a message, or perform any other action
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Counter is now zero!"),
                    ),
                  );
                }
              },
              builder: (context, count) {
                return Text(
                  '$count',
                  style: const TextStyle(fontSize: 40),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterEvent.increment);
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterEvent.decrement);
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
