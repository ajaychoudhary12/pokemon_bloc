import 'package:flutter/material.dart';
import 'package:pokemon_bloc/screens/pokemon_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pokemon App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokemonPage(title: 'Pokemon'),
    );
  }
}
