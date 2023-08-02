import 'package:flutter/cupertino.dart';

import '../model/Post_model.dart';
import '../utils/api_helper.dart';

class ApiController extends ChangeNotifier {
  List<Movie>? post;
  Map? MoviePost;
  List movie = [];

  Future<void> getData() async {
    movie = await ApiHelper.apiHelper.getMovieInformation() ?? [];

    print(movie);

    post = movie.map((e) => Movie.fromMap(data: e)).toList();
    notifyListeners();
  }
}
