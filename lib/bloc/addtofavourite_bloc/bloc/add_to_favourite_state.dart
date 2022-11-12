part of 'add_to_favourite_bloc.dart';

abstract class AddToFavouriteState extends Equatable {
  const AddToFavouriteState();

  @override
  List<Object> get props => [];
}

class AddToFavouriteInitial extends AddToFavouriteState {}

class AddToFavouriteLoading extends AddToFavouriteState {}

class AddToFavouriteLoaded extends AddToFavouriteState {
  final List<PokemonModel> pokemonModel;
  const AddToFavouriteLoaded({required this.pokemonModel});
}

class AddToFavouriterError extends AddToFavouriteState {
  final String messageError;
  const AddToFavouriterError({required this.messageError});
}
