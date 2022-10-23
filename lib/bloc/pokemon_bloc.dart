import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/pokemon_event.dart';
import 'package:pokemon_project/bloc/pokemon_state.dart';
import 'package:pokemon_project/models/pokemon_model.dart';
import 'package:pokemon_project/repository/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository pokemonRepository;
  List<PokemonModel> pokemonList = [];
  PokemonBloc({required this.pokemonRepository}) : super(PokemonInitial()) {
    on<GetPokemonEvent>((event, emit) async {
      try {
        emit(PokemonLoadingState());
        await Future.delayed(const Duration(seconds: 1));
        pokemonList = await pokemonRepository.getAllPokemon();
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
  }

  // Stream<PokemonState> mapEventToState(
  //   PokemonEvent event,
  // ) async* {
  //   if (event is GetPokemonEvent) {
  //     yield PokemonLoadingState();
  //     try {
  //       List<PokemonModel> listPokemon =
  //           await pokemonRepository.getAllPokemon();
  //       yield PokemonSucessState(data: listPokemon);
  //     } catch (ex) {
  //       print(ex);
  //       yield PokemonErrorState(messageError: ex.toString());
  //     }
  //   }
  // }
}
