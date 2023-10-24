import 'package:flutter/material.dart';

import '../pages/details_page.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    this.category,
    this.noOfTasks,
  }) : super(key: key);
  final String? category;
  final double? noOfTasks;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailsPage()),
        );
      },
      child: Material(
        elevation: 3,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: 150,
          width: 160,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
            child: Row(
              children: [
                Container(
                  height: 130,
                  width: 4,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Icon(
                      Icons.receipt_long_outlined,
                      color: Color.fromARGB(255, 0, 52, 94),
                      size: 40.0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "$noOfTasks Tasks",
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      category!,
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
