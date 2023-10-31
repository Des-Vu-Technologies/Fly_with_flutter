import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../data/to_do_list.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  CustomListTile({
    Key? key,
    this.toDoTask,
    required this.isDone,
    required this.onTaskPressed,
    required this.index,
  }) : super(key: key);
  final String? toDoTask;
  bool isDone = false;
  final VoidCallback onTaskPressed;
  final int index;
  

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: 100,
        child: Center(
          child: ListTile(
            onTap: onTaskPressed,
            leading: Icon(
              Icons.circle_outlined,
              color: isDone ? isDoneColor : Colors.blue,
              size: 30.0,
            ),
            title: Text(
              toDoTask!,
              style: TextStyle(
                decoration: toDoTasks[index]['isDone'] == true
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            trailing: Icon(
              Icons.check,
              color: isDone ? isDoneColor : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
