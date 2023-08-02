import 'dart:convert';

import 'package:fist_exam_advance_flutter/model/Post_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  Map MoviePost = {};

  static final ApiHelper apiHelper = ApiHelper._();

  String api = "http://jsonplaceholder.typicode.com/posts";

  Future<List?> getMovieInformation() async {
    String MovieinformtionApi =
        "https://api.themoviedb.org/3/movie/now_playing?api_key=e61f291f0cf3dfb1dbf5b4d009990256";
    http.Response response = await http.get(Uri.parse(MovieinformtionApi));
    if (response.statusCode == 200) {
      MoviePost = jsonDecode(response.body);

      List allData = MoviePost['results'];

      print(allData);

      return allData;
    }
    return null;
  }

  Future<Movie?> getSingleResponse() async {
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      Movie post = Movie.fromMap(data: data);

      return post;
    }
    return null;
  }

  Future<List<Movie>?> getMultipleResponce() async {
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      List allData = jsonDecode(response.body);

      List<Movie> allMovie =
          allData.map((e) => Movie.fromMap(data: e)).toList();

      return allMovie;
    }
    return null;
  }
}
