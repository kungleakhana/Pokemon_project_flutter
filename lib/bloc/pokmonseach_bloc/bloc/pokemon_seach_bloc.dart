import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_project/models/pokemon_model.dart';

part 'pokemon_seach_event.dart';
part 'pokemon_seach_state.dart';

class PokemonSeachBloc extends Bloc<SearchPokemonEvent, PokemonSeachState> {
  PokemonSeachBloc() : super(PokemonSeachInitial()) {
    on<SearchPokemonEvent>((event, emit) async{
     try{
      emit(PokemonSeachLoading());
      await Future.delayed(const Duration(seconds: 1));
      final pokemonSearchList = event.pokemonList.where((element) => element.name!.toLowerCase().contains(event.pokemonName.toLowerCase())).toList();
       emit(PokemonSeachLoaded(pokemonSearchList));
     }catch(e){
        emit(PokemonSeachError(messageError: e.toString()));
     }
    });
  }
}
