import 'dart:developer';

import 'package:flutter/material.dart';
import '../reusableWidgets/custom_list_tile.dart';
import 'add_item_page.dart';
import '../data/to_do_list.dart';

class DetailsPage extends StatefulWidget {
  final String? category;
  const DetailsPage({Key? key, this.category}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Map<String, dynamic>? _lastRemovedTask;
  int? _lastRemovedTaskIndex;

  void _removeTask(int index) {
    _lastRemovedTask = toDoTasks[index];
    _lastRemovedTaskIndex = index;

    setState(() {
      toDoTasks.removeAt(index);
    });

    final snackBar = SnackBar(
      duration: const Duration(seconds: 10),
      content: const Text("Task removed"),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          if (_lastRemovedTask != null && _lastRemovedTaskIndex != null) {
            setState(() {
              toDoTasks.insert(_lastRemovedTaskIndex!, _lastRemovedTask!);
            });
          }
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(236, 255, 255, 255),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30.0,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 15.0, 0.0, 0.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue[900],
                  ),
                  height: 30,
                  width: 5,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  widget.category!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: toDoTasks.length, //4
              itemBuilder: (context, index) {
                return toDoTasks[index]['category']
                        .contains(widget.category!.toLowerCase())
                    ? Dismissible(
                        key: Key(toDoTasks[index]["task"]),
                        onDismissed: (direction) {
                          // Handle task removal here
                          _removeTask(index);
                        },
                        direction: DismissDirection
                            .endToStart, // Swipe from right to left
                        background: Container(
                          color: Colors.red,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        child: CustomListTile(
                          index: index,
                          onTaskPressed: () => {
                            setState(() {
                              toDoTasks[index]['isDone'] == true
                                  ? toDoTasks[index]['isDone'] = false
                                  : toDoTasks[index]['isDone'] = true;
                              log(toDoTasks.toString());
                            })
                          },
                          toDoTask: toDoTasks[index]['task'],
                          isDone: toDoTasks[index]['isDone'],
                        ),
                      )
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      );
              },
            ),
          )
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: (() {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddItemsPage(
                        selectedCategory: widget.category,
                      )),
            );
          }),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
