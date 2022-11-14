import 'package:equatable/equatable.dart';
import 'package:pokemon_project/models/pokemon_model.dart';

abstract class PokemonSearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PokemonSearchLoadingState extends PokemonSearchState {}

class PokemonSearchSucessState extends PokemonSearchState {
  final List<PokemonModel> pokemonList;
  PokemonSearchSucessState({required this.pokemonList});
}

class PokemonSearchErrorState extends PokemonSearchState {
  final String messageError;

  PokemonSearchErrorState({required this.messageError});
}
