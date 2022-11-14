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
        var listOriginal = <PokemonModel>[];
        var retriveedList = <String>[];
        List<PokemonModel> filterList = [];

        emit(PokemonFilterLoading());
        if (filterType.isNotEmpty) {
          for (var pokemonItem in event.listPokemon) {
            // final first

            bool isContained =
                filterType.any((i) => pokemonItem.typeofpokemon!.contains(i));
            if (isContained) {
              filterList.add(pokemonItem);
            }

            print(filterList.length);

            // pokemonItem.typeofpokemon?.forEach((type) {
            //   final listPokemons = event.listPokemon
            //       .where((p) => p.typeofpokemon.toString().contains(type));

            //   if (filterType.contains(type)) {
            //     filterList.add(pokemonItem);
            //   } else {
            //     filterList;
            //   }
            // });
          }

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
