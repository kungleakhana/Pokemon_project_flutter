abstract class PokemonEvent {}

class GetPokemonEvent extends PokemonEvent {}

class SearchPokemonEvent extends PokemonEvent {
  final String pokemonName;
  SearchPokemonEvent({required this.pokemonName});
}

class FilterTypeEvent extends PokemonEvent {
  final List<String> typeList;
  FilterTypeEvent({required this.typeList});
}
