import 'package:flutter/material.dart';
import '../reusableWidgets/customListTile.dart';
import 'add_item_page.dart';
import '../data/to_do_list.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

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
                const Text(
                  "Finance",
                  style: TextStyle(
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
              itemCount: toDoTasks.length,
              itemBuilder: (context, index) {
                return CustomListTile(
                  toDoTask: toDoTasks[index]['task'],
                  isDone: toDoTasks[index]['isDone'],
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
              MaterialPageRoute(builder: (context) => const AddItemsPage()),
            );
          }),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}


