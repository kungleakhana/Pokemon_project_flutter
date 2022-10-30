import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/pokemon_event.dart';
import 'package:pokemon_project/bloc/pokemon_state.dart';
import 'package:pokemon_project/models/pokemon_model.dart';
import 'package:pokemon_project/repository/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository pokemonRepository;
  List<PokemonModel> _originatedPokemonList = [];
  List<PokemonModel> pokemonList = [];
  List<String> pokemonType = [];
  List<String> filterTypes = [];
  PokemonBloc({required this.pokemonRepository}) : super(PokemonInitial()) {
    on<GetPokemonEvent>((event, emit) async {
      try {
        emit(PokemonLoadingState());
        await Future.delayed(const Duration(seconds: 1));
        _originatedPokemonList = await pokemonRepository.getAllPokemon();
        pokemonList = _originatedPokemonList;
        for (var n in _originatedPokemonList) {
          for (var i in n.typeofpokemon!) {
            if (!pokemonType.contains(i)) {
              pokemonType.add(i);
            }
          }
        }

        emit(PokemonSucessState());
      } catch (e) {
        emit(PokemonErrorState(messageError: e.toString()));
      }
    });
    on<SearchPokemonEvent>((event, emit) async {
      try {
        emit(PokemonLoadingState());
        List<PokemonModel> pokemonList = this
            .pokemonList
            .where((e) =>
                e.name!.toLowerCase().contains(event.pokemonName.toLowerCase()))
            .toList();
        emit(PokemonSearchSucessState(pokemonList: pokemonList));
      } catch (e) {
        emit(PokemonErrorState(messageError: e.toString()));
      }
    });
    on<FilterTypeEvent>(
      (event, emit) async {
        try {
          filterTypes = event.typeList;
          emit(PokemonLoadingState());
          if (event.typeList.isNotEmpty) {
            List<PokemonModel> pokemonList = this.pokemonList.where((e) {
              bool isContained = false;
              e.typeofpokemon?.forEach((t) {
                if (event.typeList.contains(t)) {
                  isContained = true;
                }
              });
              return isContained;
            }).toList();
            this.pokemonList = pokemonList;
          } else {
          pokemonList = _originatedPokemonList;
          }

          emit(PokemonFilterSuccess(pokemonType: pokemonType));
        } catch (e) {
          emit(PokemonErrorState(messageError: e.toString()));
        }
      },
    );
  }
}
