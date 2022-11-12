part of 'pokemon_filter_bloc.dart';

abstract class PokemonFilterState extends Equatable {
  const PokemonFilterState();

  @override
  List<Object> get props => [];
}

class PokemonFilterInitial extends PokemonFilterState {}

class PokemonFilterLoading extends PokemonFilterState {}

class PokemonFilterLoaded extends PokemonFilterState {
  final List<PokemonModel> pokemonFilterList;
  final List<PokemonModel> listOriginal;
  final List<String> retriveedList;
  final List<String> filterType;
  const PokemonFilterLoaded( 
      {required this.pokemonFilterList,
      required this.filterType,
      required this.listOriginal,
      required this.retriveedList});
}

class PokemonFilterError extends PokemonFilterState {
  final String messageError;
  PokemonFilterError({required this.messageError});
}
