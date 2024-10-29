import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import '../models/movie.dart';
import '../controllers/penulis_controller.dart';

class TransaksiView extends StatelessWidget {
  const TransaksiView({super.key});

  // List<Widget> _buildStarRating(double rating) {
  //   int fullStars = rating.floor();
  //   bool hasHalfStar = (rating - fullStars) >= 0.5;

  //   List<Widget> stars = List.generate(
  //     fullStars,
  //     (index) => Icon(Icons.star, color: Colors.amber, size: 16),
  //   );

  //   if (hasHalfStar) {
  //     stars.add(Icon(Icons.star_half, color: Colors.amber, size: 16));
  //   }

  //   while (stars.length < 5) {
  //     stars.add(Icon(Icons.star_border, color: Colors.amber, size: 16));
  //   }

  //   return stars;
  // }

  @override
  Widget build(BuildContext context) {
    AuthorController authorController = AuthorController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Penulis"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: authorController.authors.length,
          itemBuilder: (context, index) {
            final author = authorController.authors[index];

            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              elevation: 3,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(author.name),
                        content: Text("Detail Penulis: ${author.name}"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Tutup"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          author.imagePath,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              author.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            // Row(
                            //   children: _buildStarRating(author.rating),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNav(0),
    );
  }
}
