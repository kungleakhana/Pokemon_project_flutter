import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/pokemon_bloc.dart';
import 'package:pokemon_project/bloc/pokemon_event.dart';
import 'package:pokemon_project/bloc/pokemon_state.dart';
import 'package:pokemon_project/screen/search_result_page.dart';
import 'package:pokemon_project/screen/splash_screen.dart';
import 'package:pokemon_project/screen/widgets/pokemon_cart_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
      if (state is PokemonErrorState) {
        return Scaffold(
          body: Center(
            child: Text(state.messageError),
          ),
        );
      } else if (context.read<PokemonBloc>().pokemonList.isEmpty) {
        return const SplashScreen();
      } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text("Pokemon"),
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: _SearchDelegation());
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
          body: ListView.builder(
            itemCount: context.read<PokemonBloc>().pokemonList.length,
            itemBuilder: (context, index) {
              return PokemonCartWidget(
                pokemonModel: context.read<PokemonBloc>().pokemonList[index],
              );
            },
          ),
        );
      }
    });
  }
}

class _SearchDelegation extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<PokemonBloc>().add(SearchPokemonEvent(pokemonName: query));
    return const SearchResultPage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context.read<PokemonBloc>().add(SearchPokemonEvent(pokemonName: query));
    return const SearchResultPage();
  }
}
