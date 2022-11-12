import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/addtofavourite_bloc/bloc/add_to_favourite_bloc.dart';
import 'package:pokemon_project/screen/widgets/pokemon_cart_widget.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddToFavouriteBloc, AddToFavouriteState>(
      builder: (context, state) {
        if (state is AddToFavouriterError) {
          return Scaffold(
            body: Center(
              child: Text(state.messageError),
            ),
          );
        } else if (state is AddToFavouriteLoaded) {
          return Scaffold(
            appBar: AppBar(
                
                backgroundColor: Colors.green,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Wishlist"),
                  ],
                ),
                
              ),
              body: ListView.builder(
                itemCount: state.pokemonModel.length,
                itemBuilder: (context, index) {
                  
                  return PokemonCartWidget(
                    pokemonModel: state.pokemonModel[index],
                  );
                },
              ));
        } else if (state is AddToFavouriteLoading) {
          return CircularProgressIndicator();
        } else {
          return Text("error");
        }
      },
    );
  }
}
