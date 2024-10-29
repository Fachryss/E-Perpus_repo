import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.end, // Menyusun widget di bagian bawah
        children: [
          Expanded(child: Container()), // Mendorong konten ke bawah
          Column(
            children: [
              Text(
                "E-Perpus",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Bingung cari e-book terlengkap dimana?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(
                      0.8), // Gunakan hitam atau warna sesuai background
                ),
              ),
              Text(
                "E-Perpus Solusinya, Ayo masuk sekarang",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(
                      0.8), // Gunakan hitam atau warna sesuai background
                ),
              ),
              SizedBox(height: 20), // Jarak antara teks dan tombol
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text("Login"),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text("Sign up"),
                ),
              ),
              SizedBox(
                  height: 100), // Jarak tambahan dari tombol ke bawah layar
            ],
          ),
        ],
      ),
    );
  }
}
