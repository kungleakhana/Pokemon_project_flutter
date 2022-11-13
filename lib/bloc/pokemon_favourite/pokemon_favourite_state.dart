import 'package:equatable/equatable.dart';
import 'package:pokemon_project/models/pokemon_model.dart';

abstract class PokemonFavouriteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PokemonFavouriteLoadingState extends PokemonFavouriteState {}

class PokemonFavouriteSucessState extends PokemonFavouriteState {
  final List<PokemonModel> pokemonList;
  PokemonFavouriteSucessState({required this.pokemonList});
}

class PokemonFavouriteErrorState extends PokemonFavouriteState {
  final String messageError;

  PokemonFavouriteErrorState({required this.messageError});
}
