import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/filter/filter_bloc.dart';
import 'package:pokemon_project/bloc/filter/filter_event.dart';
import 'package:pokemon_project/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokemon_project/bloc/pokemon/pokemon_event.dart';
import 'package:pokemon_project/bloc/pokemon_favourite/pokemon_favourite_bloc.dart';
import 'package:pokemon_project/repository/pokemon_repository.dart';
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
        BlocProvider(
          create: (context) => FilterBloc(),
        ),
        BlocProvider(
          create: (context) => PokemonFavouriteBloc(),
        )
      ],
      child: Builder(builder: (context) {
        return BlocProvider(
          create: (context) =>
              PokemonBloc(pokemonRepository: PokemonRepository())
                ..add(GetPokemonEvent(onGottenPokemonType: (pokemonTypeList) {
                  context.read<FilterBloc>().add(
                      InitFilterResource(pokemonTypeList: pokemonTypeList));
                })),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomeScreen(),
          ),
        );
      }),
    );
  }
}
