import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/filter/filter_event.dart';
import 'package:pokemon_project/bloc/filter/fliter_state.dart';

import '../../models/pokemon_type_model.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  List<PokemonTypeModel> _pokemonTypeList = [];
  FilterBloc() : super(FilterLoadingState()) {
    on<InitFilterResource>(((event, emit) {
      _pokemonTypeList = event.pokemonTypeList;
    }));
    on<GetFilterItems>(((event, emit) {
      emit(FilterLoadingState());
      emit(FilterSucessState(pokemonTypeList: _pokemonTypeList));
    }));
    on<FilterItemClicked>(((event, emit) {
      emit(FilterLoadingState());
      _pokemonTypeList
          .firstWhere((e) => e.name == event.pokemonTypeModel.name)
          .isSelected = !(event.pokemonTypeModel.isSelected);
      emit(FilterSucessState(pokemonTypeList: _pokemonTypeList));
    }));
  }
}
