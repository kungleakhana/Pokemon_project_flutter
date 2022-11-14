// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_project/models/pokemon_model.dart';
part 'pokemon_filter_event.dart';
part 'pokemon_filter_state.dart';

class PokemonFilterBloc extends Bloc<FilterTypeEvent, PokemonFilterState> {
  PokemonFilterBloc() : super(PokemonFilterInitial()) {
    on<FilterTypeEvent>((event, emit) async {
      try {
        var filterType = event.typeList;
        var listOriginal = event.listPokemon;
        List<PokemonModel> filterList = [];

        emit(PokemonFilterLoading());
        if (filterType.isNotEmpty) {
          filterList = event.listPokemon.where(
            (pokemon) {
              bool isContained = false;
              if (pokemon.typeofpokemon != null) {
                if (pokemon.typeofpokemon!
                    .any((type) => event.typeList.contains(type))) {
                  isContained = true;
                }
              }
              return isContained;
            },
          ).toList();
          emit(PokemonFilterLoaded(
            pokemonFilterList: filterList,
            filterType: filterType,
            listOriginal: listOriginal,
          ));
        } else {
          var pokemonFilterList = listOriginal;
          emit(PokemonFilterLoaded(
            pokemonFilterList: listOriginal,
            filterType: filterType,
            listOriginal: listOriginal,
          ));
        }
      } catch (e) {
        emit(PokemonFilterError(messageError: e.toString()));
      }
    });
  }
}
