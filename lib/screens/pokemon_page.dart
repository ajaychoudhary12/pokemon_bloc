import 'package:flutter/material.dart';

class PokemonPage extends StatefulWidget {
  PokemonPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemExtent: 66,
        itemBuilder: (context, index) {
          return ListTile(
            style: ListTileStyle.list,
            contentPadding: EdgeInsets.only(left: 16),
            tileColor: Colors.white,
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage('https://rb.gy/3o9ykm'),
            ),
            title: Text('Pokemon Name'),
            subtitle: Text('Type'),
          );
        },
      ),
    );
  }
}
