import 'package:flutter/material.dart';

import '../reusableWidgets/category_button.dart';
import '../reusableWidgets/category_card.dart';
import 'add_item_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String imageUrl =
      "https://as2.ftcdn.net/v2/jpg/03/64/21/11/1000_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.fromLTRB(0, 18, 20, 2),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 20.0,
              child: Image(
                height: 100,
                width: 100,
                image: AssetImage('assets/images/pic1.jpeg'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddItemsPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const HomepageBody(),
    );
  }
}

class HomepageBody extends StatelessWidget {
  const HomepageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "To Do List",
            style: TextStyle(
                fontSize: 23, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CategoryButton(text: "Today"),
              CategoryButton(text: "Week"),
              CategoryButton(text: "Month"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CategoryCard(
                    category: "Home",
                    noOfTasks: 3,
                  ),
                  CategoryCard(
                    category: "Finance",
                    noOfTasks: 3,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CategoryCard(
                    category: "Personal",
                    noOfTasks: 3.0,
                  ),
                  CategoryCard(
                    category: "Study",
                    noOfTasks: 3.0,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
