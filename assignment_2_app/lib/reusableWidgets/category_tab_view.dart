import 'package:flutter/material.dart';

import '../data/to_do_list.dart';
import 'category_card.dart';

class CategoryTabView extends StatefulWidget {
  const CategoryTabView({
    Key? key,
    this.catogaryDuration,
  }) : super(key: key);
  final String? catogaryDuration;
  @override
  State<CategoryTabView> createState() => _CategoryTabViewState();
}

class _CategoryTabViewState extends State<CategoryTabView> {
  double? noOfTasksInCatagory;
  double getTaskCountByCategory(String category) {
    List<Map<String, dynamic>> tasksInCategory =
        toDoTasks.where((task) => task["category"] == category).toList();

    setState(() {
      double noOfTasks = tasksInCategory.length.toDouble();
      noOfTasksInCatagory = noOfTasks;
    });

    return noOfTasksInCatagory!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoryCard(
              category: "Work",
              getTasks: getTaskCountByCategory("work"),
              noOfTasks: noOfTasksInCatagory,
            ),
            CategoryCard(
              category: "Finance",
              getTasks: getTaskCountByCategory("finance"),
              noOfTasks: noOfTasksInCatagory,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoryCard(
              category: "Personal",
              getTasks: getTaskCountByCategory("personal"),
              noOfTasks: noOfTasksInCatagory,
            ),
            CategoryCard(
              category: "Study",
              getTasks: getTaskCountByCategory("study"),
              noOfTasks: noOfTasksInCatagory,
            ),
          ],
        ),
      ],
    );
  }
}
