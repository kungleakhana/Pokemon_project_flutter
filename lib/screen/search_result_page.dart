import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/pokemon_search/pokemon_search_bloc.dart';

import '../bloc/pokemon_search/pokemon_search_state.dart';
import 'widgets/pokemon_cart_widget.dart';

class SearchResultPage extends StatelessWidget {
  final PokemonSearchBloc pokemonSearchBloc;
  SearchResultPage({required this.pokemonSearchBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
          bloc: pokemonSearchBloc,
          builder: (context, state) {
            if (state is PokemonSearchLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is PokemonSearchSucessState) {
              if (state.pokemonList.isEmpty) {
                return const Center(
                  child: Text("No data"),
                );
              }
              return ListView.builder(
                itemCount: state.pokemonList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: PokemonCartWidget(
                            pokemonModel: state.pokemonList[index],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else if (state is PokemonSearchErrorState) {
              return Center(
                child: Text(state.messageError),
              );
            }
            return Container();
          }),
    );
  }
}
