import 'package:pokemon_project/models/pokemon_type_model.dart';

abstract class FilterState {}

class FilterLoadingState extends FilterState {}

class FilterSucessState extends FilterState {
  List<PokemonTypeModel> pokemonTypeList;
  FilterSucessState({required this.pokemonTypeList});
}
