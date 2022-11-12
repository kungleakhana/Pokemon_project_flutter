part of 'pokemon_seach_bloc.dart';

abstract class PokemonSeachEvent extends Equatable {
  const PokemonSeachEvent();

  @override
  List<Object> get props => [];
}

class SearchPokemonEvent extends PokemonSeachEvent {
  final String pokemonName;
  final List<PokemonModel> pokemonList;
  SearchPokemonEvent({required this.pokemonList,required this.pokemonName});
}
