// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/pokemon_favourite/pokemon_favourite_bloc.dart';
import 'package:pokemon_project/bloc/pokemon_favourite/pokemon_favourite_state.dart';
import '../bloc/pokemon_favourite/pokemon_favourite_event.dart';
import 'widgets/pokemon_cart_widget.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    context.read<PokemonFavouriteBloc>().add(GetFavouriteList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonFavouriteBloc, PokemonFavouriteState>(
      builder: (context, state) {
        if (state is PokemonFavouriteErrorState) {
          return Scaffold(
            body: Center(
              child: Text(state.messageError),
            ),
          );
        } else if (state is PokemonFavouriteSucessState) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.green,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Wishlist"),
                  ],
                ),
              ),
              body: ListView.builder(
                itemCount: state.pokemonList.length,
                itemBuilder: (context, index) {
                  return PokemonCartWidget(
                    pokemonModel: state.pokemonList[index],
                  );
                },
              ));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
