import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/pokemon/pokemon_event.dart';
import 'package:pokemon_project/models/pokemon_model.dart';
import 'package:pokemon_project/models/pokemon_type_model.dart';
import 'package:pokemon_project/repository/pokemon_repository.dart';

import 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository pokemonRepository;
  var originatedPokemonList = <PokemonModel>[];
  PokemonBloc({required this.pokemonRepository}) : super(PokemonInitial()) {
    on<GetPokemonEvent>((event, emit) async {
      try {
        emit(PokemonLoadingState());
        await Future.delayed(const Duration(seconds: 1));
        //get list of pokemon
        originatedPokemonList = await pokemonRepository.getAllPokemon();
        var pokemonList = originatedPokemonList;

        //get list of pokemon type
        List<PokemonTypeModel> pokemonType = [];
        for (var n in originatedPokemonList) {
          for (var typeName in n.typeofpokemon!) {
            if (pokemonType
                .where((element) => element.name == typeName)
                .isEmpty) {
              pokemonType.add(PokemonTypeModel(name: typeName));
            }
          }
        }
        //callback after getting list of pokemon type
        event.onGottenPokemonType(pokemonType);

        emit(PokemonSucessState(pokemonList: pokemonList));
      } catch (e) {
        emit(PokemonErrorState(messageError: e.toString()));
      }
    });
    on<GetPokemonByTypeEvent>(
      (event, emit) async {
        try {
          List<PokemonModel> pokemonList = [];
          emit(PokemonLoadingState());
          if (event.typeList.isNotEmpty) {
            pokemonList = originatedPokemonList.where((e) {
              bool isContained = false;
              e.typeofpokemon?.forEach((t) {
                if (event.typeList.contains(t)) {
                  isContained = true;
                }
              });
              return isContained;
            }).toList();
          } else {
            pokemonList = originatedPokemonList;
          }

          emit(PokemonSucessState(pokemonList: pokemonList));
        } catch (e) {
          emit(PokemonErrorState(messageError: e.toString()));
        }
      },
    );
  }
}
