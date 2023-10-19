import 'package:flutter/material.dart';

import 'reusable widgets/buy_button.dart';
import 'reusable widgets/item_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Shopping App"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Column(
                      children: const [
                        // ignore: sized_box_for_whitespace
                        ItemCard(),
                        BuyButton(),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: const [
                        ItemCard(),
                        BuyButton(),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: const [
                        ItemCard(),
                        BuyButton(),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: const [
                        ItemCard(),
                        BuyButton(),
                      ],
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
