import 'package:pokemon_project/models/pokemon_type_model.dart';

abstract class PokemonEvent {}

class GetPokemonEvent extends PokemonEvent {
  Function(List<PokemonTypeModel>) onGottenPokemonType;
  GetPokemonEvent({required this.onGottenPokemonType});
}

class GetPokemonByTypeEvent extends PokemonEvent {
  final List<String> typeList;
  GetPokemonByTypeEvent({required this.typeList});
}
