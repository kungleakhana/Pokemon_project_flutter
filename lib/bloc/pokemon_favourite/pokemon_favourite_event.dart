import 'package:pokemon_project/models/pokemon_model.dart';

abstract class PokemonFavouriteEvent {}

class FavouriteClicked extends PokemonFavouriteEvent {
  final PokemonModel pokemonModel;
  FavouriteClicked({required this.pokemonModel});
}

class GetFavouriteList extends PokemonFavouriteEvent {}
