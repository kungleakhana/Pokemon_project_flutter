part of 'pokemon_filter_bloc.dart';

abstract class PokemonFilterEvent extends Equatable {
  const PokemonFilterEvent();

  @override
  List<Object> get props => [];
}

class FilterTypeEvent extends PokemonFilterEvent {
  final List<String> typeList;
  final List<PokemonModel> listPokemon;
  const FilterTypeEvent({required this.typeList, required this.listPokemon});
}
