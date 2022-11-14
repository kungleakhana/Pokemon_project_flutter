abstract class PokemonSearchEvent {}

class SearchPokemonEvent extends PokemonSearchEvent {
  final String pokemonName;
  SearchPokemonEvent({required this.pokemonName});
}
