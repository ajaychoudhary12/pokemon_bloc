import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_bloc/bloc/pokemon_bloc.dart';

class PokemonPage extends StatefulWidget {
  PokemonPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonBloc()..add(FetchPokemonEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is PokemonLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is PokemonErrorState) {
              return Center(
                child: Text(
                  state.errorMessage,
                ),
              );
            }

            if (state is PokemonSuccessState) {
              return ListView.builder(
                itemCount: state.pokemonList.length,
                itemExtent: 66,
                itemBuilder: (context, index) {
                  final pokemon = state.pokemonList[index];
                  return ListTile(
                    contentPadding: EdgeInsets.only(left: 16),
                    tileColor: Colors.white,
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.network(
                        pokemon.img,
                      ),
                    ),
                    title: Text(pokemon.name),
                    subtitle: Text(pokemon.type),
                  );
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
