import 'package:flutter/material.dart';
import '../reusableWidgets/customListTile.dart';
import 'add_item_page.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  CustomListTile(
                    toDoTask: "Money deposit",
                    isDone: true,
                  ),
                  CustomListTile(
                    toDoTask: "Pay tax",
                    isDone: false,
                  ),
                  CustomListTile(
                    toDoTask: "Repair the car",
                    isDone: false,
                  ),
                  CustomListTile(
                    toDoTask: "Go to bank",
                    isDone: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddItemsPage()),
          );
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
