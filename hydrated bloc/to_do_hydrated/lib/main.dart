import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'cubit/todo_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      home: BlocProvider<TodoCubit>(
        create: (context) => TodoCubit(),
        child: const TodoListScreen(),
      ),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _taskController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do App'),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(state.tasks[index]["category"]),
                      title: Text(state.tasks[index]["task"]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<TodoCubit>().removeTask(index);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: [
                          TextField(
                            controller: _taskController,
                            decoration:
                                const InputDecoration(labelText: 'Add a task'),
                          ),
                          TextField(
                            controller: _taskController2,
                            decoration: const InputDecoration(
                                labelText: 'Add a category'),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        final task = _taskController.text;
                        final category = _taskController2.text;
                        if (task.isNotEmpty) {
                          final task1 = {
                            "task": task,
                            "isDone": false,
                            "category": category,
                          };
                          context.read<TodoCubit>().addTask(task1);

                          _taskController.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
