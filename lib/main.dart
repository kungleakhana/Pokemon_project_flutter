import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/pokemon_favourite/pokemon_favourite_bloc.dart';
import 'package:pokemon_project/bloc/pokemonfilter_bloc/bloc/pokemon_filter_bloc.dart';
import 'package:pokemon_project/bloc/pokemonlist_bloc/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_project/bloc/pokmonseach_bloc/bloc/pokemon_seach_bloc.dart';
import 'package:pokemon_project/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonListBloc>(
          create: (BuildContext context) =>
              PokemonListBloc()..add(GetPokemon()),
        ),
        BlocProvider<PokemonSeachBloc>(
          create: (BuildContext context) => PokemonSeachBloc(),
        ),
        BlocProvider<PokemonFilterBloc>(
          create: (BuildContext context) => PokemonFilterBloc(),
        ),
        BlocProvider<PokemonFavouriteBloc>(
          create: (BuildContext context) => PokemonFavouriteBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
      // child: BlocProvider(
      //   create: (context) => PokemonListBloc()
      //     ..add(GetPokemon()),
      //   child: MaterialApp(
      //     debugShowCheckedModeBanner: false,
      //     title: 'Flutter Demo',
      //     theme: ThemeData(
      //       primarySwatch: Colors.blue,
      //     ),
      //     home: const HomeScreen(),
      //   ),
      // ),
    );
  }
}
