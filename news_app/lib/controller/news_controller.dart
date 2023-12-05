import 'dart:developer';

import 'package:dio/dio.dart';

import '../model/news_model.dart';
import 'services/network_service_controller.dart';

class NewsController {
  late HttpService http;
  List<Articles>? articles;
  NewsController() {
    http = HttpService();
    getListArticles();
  }
  List<Articles>? get getArticles {
    return articles;
  }

  Future<List<Articles>?> getListArticles() async {
    Response response;
    try {
      response = await http.getRequest("");
      log("getrequest ma rokeyo kii nai");
      NewsModel newsModel = NewsModel.fromJson(response.data);
      // Responsee myResponse = Responsee(newsModel);

      articles = newsModel.articles;

      // myResponse.person.fold(
      //   (failure) => print('Failed : ${failure.message}'),
      //   (person) => print('Response : ${person.name}'),
      // );

      if (response.statusCode == 200) {
        log("response code :${articles!.length}");
      } else {
        log("There is some problem status code not 200");
      }
      return articles;
    } on Exception catch (e) {
      log(e.toString());
      return articles;
    }
  }
}
