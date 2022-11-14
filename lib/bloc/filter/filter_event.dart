import 'package:pokemon_project/models/pokemon_type_model.dart';

abstract class FilterEvent {}

class InitFilterResource extends FilterEvent {
  final List<PokemonTypeModel> pokemonTypeList;
  InitFilterResource({required this.pokemonTypeList});
}

class GetFilterItems extends FilterEvent {}

class FilterItemClicked extends FilterEvent {
  final PokemonTypeModel pokemonTypeModel;
  FilterItemClicked({required this.pokemonTypeModel});
}
