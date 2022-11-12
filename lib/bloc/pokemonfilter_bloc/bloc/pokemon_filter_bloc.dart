import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_project/bloc/pokemonlist_bloc/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_project/models/pokemon_model.dart';

part 'pokemon_filter_event.dart';
part 'pokemon_filter_state.dart';

class PokemonFilterBloc extends Bloc<FilterTypeEvent, PokemonFilterState> {
  PokemonFilterBloc() : super(PokemonFilterInitial()) {
    on<FilterTypeEvent>((event, emit) async {
      // var state = this.state;
      try {
        var filterType = event.typeList;
        var listOriginal = <PokemonModel>[];
        var retriveedList  = <String>[];

        emit(PokemonFilterLoading());
        if (event.typeList.isNotEmpty) {
          var pokemonList = event.listPokemon.where((element) {
            bool isContained = false;
            element.typeofpokemon?.forEach((t) {
              if (event.typeList.contains(t)) {
                isContained = true;
              }
            });
            return isContained;
          }).toList();
          var pokemonFilterList = pokemonList;
            emit(PokemonFilterLoaded(
              pokemonFilterList: pokemonList,
              filterType: filterType,
              listOriginal: listOriginal,
              retriveedList: retriveedList));
        }else{
          var pokemonFilterList = listOriginal;
           emit(PokemonFilterLoaded(
              pokemonFilterList: listOriginal,
              filterType: filterType,
              listOriginal: listOriginal,
              retriveedList: retriveedList));
        }
        

         
      } catch (e) {
        emit(PokemonFilterError(messageError: e.toString()));
      }
    });
  }
}
