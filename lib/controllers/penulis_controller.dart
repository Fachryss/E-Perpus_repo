import '../models/movie.dart';

class AuthorController {
  final List<Author> authors = [
    Author(
      id: 1,
      name: "Tere Liye",
      rating: 4.8,
      imagePath: 'assets/images/tere_liye.jpg',
    ),
    Author(
      id: 2,
      name: "Andrea Hirata",
      rating: 4.5,
      imagePath: 'assets/images/andrea_hirata.jpg',
    ),
    Author(
      id: 3,
      name: "Pramoedya Ananta Toer",
      rating: 4.7,
      imagePath: 'assets/images/pramoedya.jpg',
    ),
    // Tambahkan penulis lainnya sesuai kebutuhan
  ];
}
