part of 'pokemon_list_bloc.dart';

abstract class PokemonListState extends Equatable {
  const PokemonListState();

  @override
  List<Object> get props => [];
}

class PokemonListInitial extends PokemonListState {}

class PokemonListLoading extends PokemonListState {}

class PokemonLoaded extends PokemonListState {
  final List<PokemonModel> pokemonModel;
  const PokemonLoaded(this.pokemonModel);
}

class PokemonListError extends PokemonListState {
  final String messageError;
  const PokemonListError({required this.messageError});
}
