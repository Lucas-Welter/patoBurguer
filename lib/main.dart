import 'package:flutter/material.dart';
import 'package:pato_burguer/pages/products_overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
        primary: Colors.purple,
        secondary: Colors.deepOrange,
      )),
      home: ProductsOverviewPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
