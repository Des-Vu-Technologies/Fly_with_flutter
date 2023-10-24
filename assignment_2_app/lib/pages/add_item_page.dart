import 'package:flutter/material.dart';

class AddItemsPage extends StatefulWidget {
  const AddItemsPage({Key? key}) : super(key: key);

  @override
  State<AddItemsPage> createState() => _AddItemsPageState();
}

class _AddItemsPageState extends State<AddItemsPage> {
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
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: '|What are you planning today?',
                ),
              ),
            ),
            const RadioTextTil(
              categoryText: "work",
            ),
            const RadioTextTil(
              categoryText: "finance",
            ),
            const RadioTextTil(
              categoryText: "personal",
            ),
            const RadioTextTil(
              categoryText: "study",
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
                  onPressed: () {},
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

class RadioTextTil extends StatelessWidget {
  final String? categoryText;

  const RadioTextTil({Key? key, this.categoryText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedOption = 0;
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
              child: Radio(
                  value: 1,
                  groupValue: selectedOption,
                  activeColor: Colors.red,
                  fillColor: MaterialStateProperty.all(
                      Colors.blue), // You can set the desired color
                  onChanged: (value) {}),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              categoryText!.toUpperCase(),
              style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
