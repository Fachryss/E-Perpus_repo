class Movie {
  int id;
  String title;
  double? voteAverage;
  String posterPath;
  String sinopsis;
  String author;
  String penerbit;
  int stock;
  Movie({
    required this.id,
    this.voteAverage,
    required this.posterPath,
    required this.title,
    required this.sinopsis,
    required this.author,
    required this.stock,
    required this.penerbit,
  });
}

class Author {
  final int id;
  final String name;
  final double rating;
  final String imagePath;

  Author({
    required this.id,
    required this.name,
    required this.rating,
    required this.imagePath,
  });
}
