class MovieModel {
  final String originalTitle;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final int id;

  MovieModel.fromJson(Map<String, dynamic> json)
      : originalTitle = json["original_title"],
        title = json["title"],
        id = json["id"],
        overview = json["overview"],
        posterPath = json["poster_path"],
        releaseDate = json["release_date"];
}
