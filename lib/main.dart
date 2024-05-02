import 'package:flutter/material.dart';
import 'package:hava_durumu_app/home_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hava Durumu',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
