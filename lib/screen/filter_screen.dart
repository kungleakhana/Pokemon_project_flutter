import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/pokemonfilter_bloc/bloc/pokemon_filter_bloc.dart';
import 'package:pokemon_project/screen/widgets/pokemon_cart_widget.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
        backgroundColor: Colors.green,
      ),
      body: BlocBuilder<PokemonFilterBloc, PokemonFilterState>(
        builder: (context, state) {
          if (state is PokemonFilterLoaded) {
            return ListView.builder(
              itemCount: state.pokemonFilterList.length,
              itemBuilder: (context, index) {
                return PokemonCartWidget(
                  pokemonModel: state.pokemonFilterList[index],
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
