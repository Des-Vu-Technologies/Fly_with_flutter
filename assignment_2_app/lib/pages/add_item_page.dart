import 'dart:developer';

import 'package:flutter/material.dart';

import '../data/to_do_list.dart';

class AddItemsPage extends StatefulWidget {
  const AddItemsPage({Key? key}) : super(key: key);

  @override
  State<AddItemsPage> createState() => _AddItemsPageState();
}

class _AddItemsPageState extends State<AddItemsPage> {
  // ignore: prefer_final_fields
  TextEditingController? _taskController = TextEditingController();
  String selectedCategory = "finance"; // Initialize with a default category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(236, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.all(25.0),
            child: Icon(
              Icons.close,
              size: 35.0,
            ),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.fromLTRB(0.0, 38.0, 0, 0),
          child: Center(
            child: Text(
              "New Task",
              style: TextStyle(fontSize: 25.0),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16),
              child: TextFormField(
                controller: _taskController,
                //  onEditingComplete: ,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: '|What are you planning today?',
                ),
              ),
            ),
            RadioTextTil(
              categoryText: "work",
              selectedCategory: selectedCategory,
              updateSelectedCategory: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            RadioTextTil(
              categoryText: "finance",
              selectedCategory: selectedCategory,
              updateSelectedCategory: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            RadioTextTil(
              categoryText: "personal",
              selectedCategory: selectedCategory,
              updateSelectedCategory: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            RadioTextTil(
              categoryText: "study",
              updateSelectedCategory: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
              selectedCategory: selectedCategory,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 50.0,
                width: double.infinity,
                color: Colors.grey,
                child: ElevatedButton(
                  onPressed: () {
                    // ignore: unnecessary_null_comparison
                    if (_taskController!.text.isEmpty) {
                      log(_taskController!.text.toString());
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Text Field Cannot be empty and select a category too"),
                        ),
                      );
                    } else {
                      log(_taskController!.text.toString());

                      toDoTasks.add({
                        "task": _taskController!.text,
                        "isDone": false,
                        "category": selectedCategory
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("task added"),
                        ),
                      );
                    }

                    // ignore: unnecessary_null_comparison
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Add Task")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RadioTextTil extends StatefulWidget {
  final String categoryText;
  final String selectedCategory;
  final Function(String) updateSelectedCategory;

  const RadioTextTil({
    Key? key,
    required this.categoryText,
    required this.selectedCategory,
    required this.updateSelectedCategory,
  }) : super(key: key);

  @override
  State<RadioTextTil> createState() => _RadioTextTilState();
}

class _RadioTextTilState extends State<RadioTextTil> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: Container(
        height: 30.0,
        width: double.infinity,
        color: Colors.transparent,
        child: Row(
          children: [
            Transform.scale(
              scale: 1.5,
              child: Radio<String>(
                value: widget.categoryText,
                groupValue: widget.selectedCategory,
                activeColor: Colors.blue, // Color for the selected radio button
                onChanged: (value) {
                  setState(() {
                    widget.updateSelectedCategory(value!);
                  });
                },
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              widget.categoryText.toUpperCase(),
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
