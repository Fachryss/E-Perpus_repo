import 'package:flutter/material.dart';
import 'package:materi/views/movie_view.dart';
import './views/home_view.dart';
import './views/login_view.dart';
import './views/profile_view.dart';
import 'views/penulis_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeView(),
          '/login': (context) => LoginView(),
          '/penulis': (context) => TransaksiView(),
          '/profile': (context) => ProfileView(),
          '/movie': (context) => BookView(),
        });
  }
}
