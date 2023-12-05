import 'package:dartz/dartz.dart';

import 'failure_model.dart';
import 'news_model.dart';

class Responsee {
  late Either<Failure, NewsModel> news;
  Responsee(dynamic response) {
    if (response is Failure) {
      news = Left(response);
    } else {
      news = Right(response);
    }
  }
}
