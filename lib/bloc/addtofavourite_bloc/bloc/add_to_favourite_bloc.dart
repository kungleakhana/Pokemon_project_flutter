import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_project/models/pokemon_model.dart';
import 'package:pokemon_project/repository/pokemon_repository.dart';

part 'add_to_favourite_event.dart';
part 'add_to_favourite_state.dart';

class AddToFavouriteBloc
    extends Bloc<AddToWishListEvent, AddToFavouriteState> {
  final PokemonRepository _apiRepository = PokemonRepository();

  AddToFavouriteBloc() : super(AddToFavouriteInitial()) {
    
    on<AddToWishListEvent>((event, emit) async {
      try{
      emit(AddToFavouriteLoading());
      await Future.delayed(const Duration(seconds: 1));
      final  getPokemon = await _apiRepository.getAllPokemon();
      if(getPokemon.contains(event.pokemon) ){
       emit(AddToFavouriteLoaded(pokemonModel: List.from(getPokemon)..remove(event.pokemon)));
      }else{
        emit(AddToFavouriteLoaded(
              pokemonModel: List.from(getPokemon)..add(event.pokemon)));
      }
      
      } catch (e) {
        emit(AddToFavouriterError(messageError: e.toString()));
      }
    });
      
    }
  }
