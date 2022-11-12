part of 'pokemon_seach_bloc.dart';

abstract class PokemonSeachState extends Equatable {
  const PokemonSeachState();

  @override
  List<Object> get props => [];
}

class PokemonSeachInitial extends PokemonSeachState {}

class PokemonSeachLoading extends PokemonSeachState {}

class PokemonSeachLoaded extends PokemonSeachState {
  final List<PokemonModel> pokemonSearchList;
  PokemonSeachLoaded(this.pokemonSearchList);
}

class PokemonSeachError extends PokemonSeachState {
  final String messageError;
    PokemonSeachError({required this.messageError});
}
