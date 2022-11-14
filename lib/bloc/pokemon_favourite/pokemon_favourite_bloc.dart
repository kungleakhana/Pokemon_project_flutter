import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/models/pokemon_model.dart';

import 'pokemon_favourite_state.dart';
import 'pokemon_favourite_event.dart';

class PokemonFavouriteBloc
    extends Bloc<PokemonFavouriteEvent, PokemonFavouriteState> {
  final List<PokemonModel> _favouritePokemonList = [];
  PokemonFavouriteBloc() : super(PokemonFavouriteLoadingState()) {
    on<GetFavouriteList>((event, emit) async {
      try {
        emit(PokemonFavouriteLoadingState());

        emit(PokemonFavouriteSucessState(pokemonList: _favouritePokemonList));
      } catch (e) {
        emit(PokemonFavouriteErrorState(messageError: e.toString()));
      }
    });
    on<FavouriteClicked>((event, emit) async {
      try {
        emit(PokemonFavouriteLoadingState());
        if (_favouritePokemonList.contains(event.pokemonModel)) {
          _favouritePokemonList.remove(event.pokemonModel);
        } else {
          _favouritePokemonList.add(event.pokemonModel);
        }
        emit(PokemonFavouriteSucessState(pokemonList: _favouritePokemonList));
      } catch (e) {
        emit(PokemonFavouriteErrorState(messageError: e.toString()));
      }
    });
  }
}
