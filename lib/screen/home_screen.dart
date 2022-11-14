import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/pokemonlist_bloc/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_project/bloc/pokmonseach_bloc/bloc/pokemon_seach_bloc.dart';
import 'package:pokemon_project/models/pokemon_model.dart';
import 'package:pokemon_project/screen/search_result_page.dart';
import 'package:pokemon_project/screen/splash_screen.dart';
import 'package:pokemon_project/screen/widgets/drawer_filter_widget.dart';
import 'package:pokemon_project/screen/widgets/pokemon_cart_widget.dart';
import 'package:pokemon_project/screen/widgets/search_delegation_widget.dart';
import 'package:pokemon_project/screen/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListBloc, PokemonListState>(
        builder: (context, state) {
      if (state is PokemonListError) {
        return Scaffold(
          body: Center(
            child: Text(state.messageError),
          ),
        );
      } else if (state is PokemonListLoading) {
        return const SplashScreen();
      } else if (state is PokemonLoaded) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: DrawerWidget(
            filterList: state.pokemonModel,
            typeofPokemon: state.pokemonTypeList,
          ),
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.filter_list_alt),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            backgroundColor: Colors.green,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Pokemon"),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const WishListScreen()));
                    },
                    icon: const Icon(Icons.favorite))
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate:
                            SearchDelegation(searchList: state.pokemonModel));
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
          body: ListView.builder(
            itemCount: state.pokemonModel.length,
            itemBuilder: (context, index) {
              return PokemonCartWidget(
                pokemonModel: state.pokemonModel[index],
              );
            },
          ),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
