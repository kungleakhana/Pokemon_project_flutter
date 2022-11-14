import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokemon_project/bloc/pokemon/pokemon_event.dart';
import 'package:pokemon_project/bloc/pokemon_search/pokemon_search_bloc.dart';
import 'package:pokemon_project/screen/search_result_page.dart';
import 'package:pokemon_project/screen/splash_screen.dart';
import 'package:pokemon_project/screen/widgets/drawer_filter_widget.dart';
import 'package:pokemon_project/screen/widgets/pokemon_cart_widget.dart';

import '../bloc/pokemon/pokemon_state.dart';
import '../bloc/pokemon_search/pokemon_search_event.dart';
import 'wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
      } else if (state is PokemonSucessState) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: DrawerWidget(
            onFilterSubmit: (typeList) {
              context
                  .read<PokemonBloc>()
                  .add(GetPokemonByTypeEvent(typeList: typeList));
            },
          ),
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.filter_list_alt),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            backgroundColor: Colors.green,
            title: const Text("Pokemon"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const WishListScreen()));
                  },
                  icon: const Icon(Icons.favorite)),
              BlocProvider(
                create: (c) =>
                    PokemonSearchBloc(pokemonList: state.pokemonList),
                child: Builder(builder: (context) {
                  return IconButton(
                      onPressed: () {
                        showSearch(
                            context: context,
                            delegate: _SearchDelegation(
                                pokemonSeachBloc:
                                    BlocProvider.of<PokemonSearchBloc>(
                                        context)));
                      },
                      icon: const Icon(Icons.search));
                }),
              )
            ],
          ),
          body: ListView.builder(
            itemCount: state.pokemonList.length,
            itemBuilder: (context, index) {
              return PokemonCartWidget(
                pokemonModel: state.pokemonList[index],
              );
            },
          ),
        );
      } else {
        return const SplashScreen();
      }
    });
  }
}

class _SearchDelegation extends SearchDelegate {
  final PokemonSearchBloc pokemonSeachBloc;
  _SearchDelegation({required this.pokemonSeachBloc});
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
    pokemonSeachBloc.add(SearchPokemonEvent(pokemonName: query));
    return SearchResultPage(
      pokemonSearchBloc: pokemonSeachBloc,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    pokemonSeachBloc.add(SearchPokemonEvent(pokemonName: query));
    return SearchResultPage(
      pokemonSearchBloc: pokemonSeachBloc,
    );
  }
}
