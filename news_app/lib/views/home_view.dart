import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/views/details_page.dart';

import '../controller/news_controller.dart';
import '../model/news_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Articles>? articles;

  late NewsController _newsController;
  void getArticles() async {
    articles = await _newsController.getListArticles();
    setState(() {});

    log("articles is : ${articles!.first.author}");
  }

  @override
  void initState() {
    _newsController = NewsController();
    getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News App"),),
      body: ListView.builder(itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage(articles![index] )));
          },
          child: NewsCard(article: articles![index]));
      }),
    );
  }
}

class NewsCard extends StatelessWidget {
  final Articles article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0, // Add elevation for a shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(8.0), // Clip content to rounded corners
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            article.urlToImage != null
                ? Image.network(
                    article.urlToImage!,
                    height: 200, // Set image height
                    fit: BoxFit.cover, // Cover the available space
                  )
                : const SizedBox(
                    height: 200,
                    child: Center(
                        child: Text('No Image'))), // Placeholder for no image
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title ?? '',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    article.description ?? '',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
