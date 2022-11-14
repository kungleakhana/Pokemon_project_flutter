import 'package:equatable/equatable.dart';
import 'package:pokemon_project/models/pokemon_model.dart';

abstract class PokemonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoadingState extends PokemonState {}

class PokemonSucessState extends PokemonState {
  final List<PokemonModel> pokemonList;
  PokemonSucessState({required this.pokemonList});
}

class PokemonFilterSuccess extends PokemonState {
  final List<String> pokemonType;
  final List<PokemonModel> originatedPokemonList;
  PokemonFilterSuccess(
      {required this.pokemonType, required this.originatedPokemonList});
}

class PokemonErrorState extends PokemonState {
  final String messageError;

  PokemonErrorState({required this.messageError});
}
