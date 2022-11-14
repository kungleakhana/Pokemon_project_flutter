import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/models/pokemon_model.dart';

import 'pokemon_search_state.dart';
import 'pokemon_search_event.dart';

class PokemonSearchBloc extends Bloc<PokemonSearchEvent, PokemonSearchState> {
  final List<PokemonModel> pokemonList;
  PokemonSearchBloc({required this.pokemonList})
      : super(PokemonSearchLoadingState()) {
    on<SearchPokemonEvent>((event, emit) async {
      try {
        emit(PokemonSearchLoadingState());
        List<PokemonModel> pokemonList = this
            .pokemonList
            .where((e) =>
                e.name!.toLowerCase().contains(event.pokemonName.toLowerCase()))
            .toList();
        emit(PokemonSearchSucessState(pokemonList: pokemonList));
      } catch (e) {
        emit(PokemonSearchErrorState(messageError: e.toString()));
      }
    });
  }
}
