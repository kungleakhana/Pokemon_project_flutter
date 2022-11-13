part of 'add_to_favourite_bloc.dart';

abstract class AddToFavouriteEvent extends Equatable {
  const AddToFavouriteEvent();

  @override
  List<Object> get props => [];
}

class AddToWishListEvent extends AddToFavouriteEvent {
 
  AddToWishListEvent();
}
