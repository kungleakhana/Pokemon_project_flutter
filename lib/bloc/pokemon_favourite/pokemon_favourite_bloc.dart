import 'package:flutter_bloc/flutter_bloc.dart';

import 'pokemon_favourite_state.dart';
import 'pokemon_favourite_event.dart';

class PokemonFavouriteBloc
    extends Bloc<PokemonFavouriteEvent, PokemonFavouriteState> {
  PokemonFavouriteBloc() : super(PokemonFavouriteLoadingState()) {
    on<GetFavouriteList>((event, emit) async {
      try {
        emit(PokemonFavouriteLoadingState());

        emit(PokemonFavouriteSucessState(
            pokemonList: state.favouritePokemonList));
      } catch (e) {
        emit(PokemonFavouriteErrorState(messageError: e.toString()));
      }
    });
    on<FavouriteClicked>((event, emit) async {
      try {
        emit(PokemonFavouriteLoadingState());
        if (state.favouritePokemonList.contains(event.pokemonModel)) {
          state.favouritePokemonList.remove(event.pokemonModel);
        } else {
          state.favouritePokemonList.add(event.pokemonModel);
        }
        emit(PokemonFavouriteSucessState(
            pokemonList: state.favouritePokemonList));
      } catch (e) {
        emit(PokemonFavouriteErrorState(messageError: e.toString()));
      }
    });
  }
}
