import 'package:flutter/material.dart';
import '/controllers/movie_controller.dart';
import '/models/movie.dart';
import '/widgets/bottom_nav.dart';
import 'package:materi/widgets/modal.dart';

class BookView extends StatefulWidget {
  BookView({super.key});

  @override
  State<BookView> createState() => _MovieViewState();
}

class _MovieViewState extends State<BookView> {
  MovieController movie = MovieController();
  TextEditingController titleInput = TextEditingController();
  TextEditingController gambarInput = TextEditingController();
  TextEditingController voteAverage = TextEditingController();
  TextEditingController sinopsisInput = TextEditingController();
  TextEditingController authorInput = TextEditingController();
  TextEditingController penerbitInput = TextEditingController();
  TextEditingController stockInput =
      TextEditingController(); // Controller untuk stok

  final formKey = GlobalKey<FormState>();
  ModalWidget modal = ModalWidget();

  List<String> listAct = ["Ubah", "Hapus"];
  List<Movie>? film;
  int? film_id;

  getFilm() {
    setState(() {
      film = movie.movie;
    });
  }

  addFilm(data) {
    film!.add(data);
    getFilm();
  }

  @override
  void initState() {
    super.initState();
    getFilm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Book"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  film_id = null;
                  stockInput.clear();
                });
                titleInput.clear();
                gambarInput.clear();
                voteAverage.clear();
                sinopsisInput.clear();
                authorInput.clear();
                penerbitInput.clear();
                modal.showFullModal(context, fromTambah(null));
              },
              icon: Icon(Icons.add_sharp))
        ],
      ),
      body: film != null
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.6,
                ),
                itemCount: film!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(film![index].title),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Author: ${film![index].author}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Penerbit: ${film![index].penerbit}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  Text(film![index].sinopsis),
                                ],
                              ),
                            ),
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
                    child: Card(
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(film![index].posterPath),
                                ),
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(8)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  film![index].title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    ..._buildStarRating(
                                        film![index].voteAverage),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Stock: ${film![index].stock}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: PopupMenuButton<String>(
                                    icon: Icon(Icons.more_vert, size: 24),
                                    itemBuilder: (BuildContext context) {
                                      return listAct.map((String choice) {
                                        return PopupMenuItem<String>(
                                          value: choice,
                                          child: Text(choice),
                                          onTap: () {
                                            if (choice == "Ubah") {
                                              setState(() {
                                                film_id = film![index].id;
                                              });
                                              titleInput.text =
                                                  film![index].title;
                                              gambarInput.text =
                                                  film![index].posterPath;
                                              voteAverage.text = film![index]
                                                  .voteAverage
                                                  .toString();
                                              sinopsisInput.text =
                                                  film![index].sinopsis;
                                              authorInput.text =
                                                  film![index].author;
                                              penerbitInput.text =
                                                  film![index].penerbit;
                                              stockInput.text =
                                                  film![index].stock.toString();
                                              modal.showFullModal(
                                                  context, fromTambah(index));
                                            } else if (choice == "Hapus") {
                                              film!.removeWhere((item) =>
                                                  item.id == film![index].id);
                                              getFilm();
                                            }
                                          },
                                        );
                                      }).toList();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          : Center(child: Text("Data Kosong")),
      bottomNavigationBar: BottomNav(1),
    );
  }

  Widget fromTambah(index) {
    return SingleChildScrollView(
      // Bungkus dengan SingleChildScrollView
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text("Tambah Data"),
              TextFormField(
                controller: titleInput,
                decoration: InputDecoration(labelText: "Title"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus diisi';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: gambarInput,
                decoration: InputDecoration(labelText: "Gambar"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus diisi';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: voteAverage,
                decoration: InputDecoration(labelText: "VoteAverage"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus diisi';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: sinopsisInput,
                decoration: InputDecoration(labelText: "Sinopsis"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus diisi';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: authorInput,
                decoration: InputDecoration(labelText: "Author"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus diisi';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: penerbitInput,
                decoration: InputDecoration(labelText: "Penerbit"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus diisi';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: stockInput,
                decoration: InputDecoration(labelText: "Stock"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus diisi';
                  } else if (int.tryParse(value) == null) {
                    return 'Harus berupa angka';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                  height:
                      16), // Tambahkan jarak agar tombol tidak terlalu menempel
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (index != null) {
                      film![index].id = film_id!;
                      film![index].title = titleInput.text;
                      film![index].posterPath = gambarInput.text;
                      film![index].voteAverage = double.parse(voteAverage.text);
                      film![index].sinopsis = sinopsisInput.text;
                      film![index].author = authorInput.text;
                      film![index].penerbit = penerbitInput.text;
                      film![index].stock = int.parse(stockInput.text);
                    } else {
                      film_id = film!.length + 1;
                      Movie data = Movie(
                        id: film_id!,
                        title: titleInput.text,
                        posterPath: gambarInput.text,
                        voteAverage: double.parse(voteAverage.text),
                        penerbit: penerbitInput.text,
                        stock: int.parse(stockInput.text),
                        sinopsis: sinopsisInput.text,
                        author: authorInput.text,
                      );
                      addFilm(data);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildStarRating(double? rating) {
    double avg = rating ?? 0;
    int fullStars = avg.floor();
    bool hasHalfStar = (avg - fullStars) >= 0.5;

    List<Widget> stars = List.generate(
      fullStars,
      (index) => Icon(Icons.star, color: Colors.amber, size: 18),
    );

    if (hasHalfStar) {
      stars.add(Icon(Icons.star_half, color: Colors.amber, size: 18));
    }

    while (stars.length < 5) {
      stars.add(Icon(Icons.star_border, color: Colors.amber, size: 18));
    }

    return stars;
  }
}
