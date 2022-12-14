import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/pokemonfilter_bloc/bloc/pokemon_filter_bloc.dart';
import 'package:pokemon_project/bloc/pokemonlist_bloc/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_project/models/pokemon_model.dart';
import 'package:pokemon_project/screen/filter_screen.dart';

class DrawerWidget extends StatefulWidget {
  List<PokemonModel> filterList = [];
  List<String> typeofPokemon = [];
  DrawerWidget(
      {required this.filterList, required this.typeofPokemon, super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  List<String> selectedType = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListBloc, PokemonListState>(
        builder: (context, state) {
      if (state is PokemonListError) {
        return Text(state.messageError);
      }
      if (state is PokemonLoaded) {
        return Drawer(
          child: SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Filter By Type:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 4,
                    children: List.generate(
                        widget.typeofPokemon.length,
                        (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  if (selectedType
                                      .contains(widget.typeofPokemon[index])) {
                                    selectedType
                                        .remove(widget.typeofPokemon[index]);
                                  } else {
                                    selectedType
                                        .add(widget.typeofPokemon[index]);
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: selectedType.contains(
                                          state.pokemonTypeList[index])
                                      ? Colors.green.withOpacity(0.5)
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 10),
                                child: Text(
                                  state.pokemonTypeList[index],
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            )),
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        context.read<PokemonFilterBloc>().add(
                              FilterTypeEvent(
                                typeList: selectedType,
                                listPokemon: widget.filterList,
                              ),
                            );

                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const FilterScreen())));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 0.1,
                              blurRadius: 0.7,
                              offset:
                                  Offset(0, 0.8), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      } else {
        return const Text("hello");
        // }
      }
    });
  }
}
