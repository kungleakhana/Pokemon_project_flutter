import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_project/models/pokemon_model.dart';
import 'package:pokemon_project/repository/pokemon_repository.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonRepository _apiRepository = PokemonRepository();
  PokemonListBloc() : super(PokemonListInitial()) {
    on<PokemonListEvent>((event, emit) async {
      try {
        emit(PokemonListLoading());
        await Future.delayed(const Duration(seconds: 1));
        final List<PokemonModel> getPokemon =
            await _apiRepository.getAllPokemon();
        final List<String> modelType = [];
        for (var poekmonItem in getPokemon) {
          poekmonItem.typeofpokemon?.forEach((typeOfPoekmon) {
            if (!modelType.contains(typeOfPoekmon)) {
              modelType.add(typeOfPoekmon);
            }
          });
        }

        emit(PokemonLoaded(getPokemon, modelType));
      } catch (e) {
        emit(PokemonListError(messageError: e.toString()));
      }
    });
  }
}
