abstract class PokemonEvent {}

class GetPokemonEvent extends PokemonEvent {}

class SearchPokemonEvent extends PokemonEvent {
  final String pokemonName;
  SearchPokemonEvent({required this.pokemonName});
}
