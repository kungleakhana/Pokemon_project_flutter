import 'package:equatable/equatable.dart';
import 'package:pokemon_project/models/pokemon_model.dart';

abstract class PokemonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoadingState extends PokemonState {}

class PokemonSucessState extends PokemonState {}

class PokemonSearchSucessState extends PokemonState {
  final List<PokemonModel> pokemonList;
  PokemonSearchSucessState({required this.pokemonList});
}

class PokemonErrorState extends PokemonState {
  final String messageError;

  PokemonErrorState({required this.messageError});
}
