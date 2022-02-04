import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_bloc/models/pokemon.dart';
import 'package:pokemon_bloc/services/pokemon_service.dart';

/// Notifies bloc to fetch pokemon list.
class FetchPokemonEvent {}

abstract class PokemonState {}

/// Initial State class
class PokemonInitialState extends PokemonState {}

/// Class indicates that pokemon list is being fetched.
class PokemonLoadingState extends PokemonState {}

/// Class indicates that pokemon list is fetched successfully.
class PokemonSuccessState extends PokemonState {
  final List<Pokemon> pokemonList;

  PokemonSuccessState({required this.pokemonList});
}

/// Class indicates that pokemon list is fetched with error.
class PokemonErrorState extends PokemonState {
  final String errorMessage;

  PokemonErrorState({required this.errorMessage});
}

/// A simple [Bloc] that fetches an pokemon response.
class PokemonBloc extends Bloc<FetchPokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitialState()) {
    on<FetchPokemonEvent>((event, emit) async {
      emit(PokemonLoadingState());

      try {
        final pokeList = await PokemonService.fetchPokemonList();
        emit(PokemonSuccessState(pokemonList: pokeList));
      } catch (e) {
        emit(PokemonErrorState(errorMessage: e.toString()));
      }
    });
  }
}
