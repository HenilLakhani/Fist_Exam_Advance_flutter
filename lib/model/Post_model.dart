class Movie {
  int id;
  String release_date;
  String title;
  String overview;
  String poster_path;

  Movie({
    required this.id,
    required this.release_date,
    required this.overview,
    required this.title,
    required this.poster_path,
  });

  factory Movie.fromMap({required Map data}) {
    return Movie(
      id: data['id'],
      release_date: data['release_date'],
      overview: data['overview'],
      title: data['title'],
      poster_path: data['poster_path'],
    );
  }
}
