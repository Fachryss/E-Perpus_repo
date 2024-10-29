import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Mengubah warna latar belakang menjadi putih
      appBar: AppBar(
        backgroundColor: Colors.white, // Warna latar belakang AppBar
        elevation: 0, // Menghilangkan bayangan
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.black), // Ikon panah ke belakang
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Selamat Datang di Halaman Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Mengubah warna teks menjadi hitam
                ),
              ),
              SizedBox(height: 50), // Jarak antara teks dan tombol pertama
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/penulis');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  backgroundColor: Colors.black, // Warna latar belakang tombol
                  foregroundColor:
                      Colors.white, // Mengubah warna teks tombol menjadi putih
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text("Penulis"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/movie');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  backgroundColor: Colors.black, // Warna latar belakang tombol
                  foregroundColor:
                      Colors.white, // Mengubah warna teks tombol menjadi putih
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text("E-Book"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
