import 'package:flutter/material.dart';

import '../data/to_do_list.dart';
import '../reusableWidgets/category_tab_view.dart';
import 'add_item_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        backgroundColor: const Color.fromARGB(236, 255, 255, 255),
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.fromLTRB(5, 20, 0, 0),
            child: Icon(
              Icons.menu,
              color: Colors.grey,
              size: 25.0,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: CircleAvatar(
                radius: 45, // Adjust the radius as needed
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage('assets/images/pic1.jpeg'),
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize:
                const Size.fromHeight(100.0), // Adjust the height as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "To Do List",
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                TabBar(
                  labelColor: Colors.black,
                  tabs: [
                    Tab(text: "Today"),
                    Tab(text: "Week"),
                    Tab(text: "Month"),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddItemsPage(selectedCategory: "finance",)),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: const HomepageBody(),
      ),
    );
  }
}

class HomepageBody extends StatelessWidget {
  const HomepageBody({Key? key}) : super(key: key);

  double getTaskCountByCategory(String category) {
    List<Map<String, dynamic>> tasksInCategory =
        toDoTasks.where((task) => task["category"] == category).toList();

    return tasksInCategory.length.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
      child: TabBarView(
        children: [
          // Today Tab
          CategoryTabView(catogaryDuration: "today"),

          // Week Tab (you can add your category cards here)
          CategoryTabView(catogaryDuration: "week"),

          // Month Tab (you can add your category cards here)
          CategoryTabView(catogaryDuration: "month"),
        ],
      ),
    );
  }
}
