import 'package:flutter/material.dart';

import '../constants/constants.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  CustomListTile({
    Key? key,
    this.toDoTask,
    required this.isDone,
  }) : super(key: key);
  final String? toDoTask;
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: 100,
        child: Center(
          child: ListTile(
            leading: Icon(
              Icons.circle_outlined,
              color: isDone ? isDoneColor : Colors.blue,
              size: 30.0,
            ),
            title: Text(toDoTask!),
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
