import 'package:flutter/material.dart';

import '../model/news_model.dart';

class DetailsPage extends StatelessWidget {
  final Articles articles;
  const DetailsPage(this.articles, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("News App", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        ],
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      ),

      body: Card(
        child: 
        margin: EdgeInsets.all(8.0),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          
        ),
      ),

    );
  }
}