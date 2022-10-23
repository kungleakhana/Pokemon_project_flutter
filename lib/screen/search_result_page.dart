import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/pokemon_bloc.dart';
import 'package:pokemon_project/bloc/pokemon_state.dart';

import 'widgets/pokemon_cart_widget.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
        if (state is PokemonLoadingState) {
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
        } else if (state is PokemonErrorState) {
          return Center(
            child: Text(state.messageError),
          );
        }
        return Container();
      }),
    );
  }
}
