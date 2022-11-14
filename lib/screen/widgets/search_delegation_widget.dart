import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/pokmonseach_bloc/bloc/pokemon_seach_bloc.dart';
import 'package:pokemon_project/models/pokemon_model.dart';
import 'package:pokemon_project/screen/search_result_page.dart';

class SearchDelegation extends SearchDelegate {
  List<PokemonModel> searchList = [];
  SearchDelegation({required this.searchList});
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
    context
        .read<PokemonSeachBloc>()
        .add(SearchPokemonEvent(pokemonName: query, pokemonList: searchList));
    return const SearchResultPage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context
        .read<PokemonSeachBloc>()
        .add(SearchPokemonEvent(pokemonName: query, pokemonList: searchList));
    return const SearchResultPage();
  }
}
