import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/pokemonfilter_bloc/bloc/pokemon_filter_bloc.dart';
import 'package:pokemon_project/models/pokemon_model.dart';

class DrawerWidget extends StatefulWidget {
  List<PokemonModel> filterList = [];


  DrawerWidget({required this.filterList,  super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool isActive = false;
  List<String> selectedType = [];

  @override
  void initState() {
    context
        .read<PokemonFilterBloc>()
        .add(FilterTypeEvent(typeList: selectedType, listPokemon: widget.filterList));

    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonFilterBloc, PokemonFilterState>(
        builder: (context, state) {
      print(state.toString());
      if (state is PokemonFilterError) {
        return Text(state.messageError);
      }
      if (state is PokemonFilterLoaded) {
        return Drawer(
          child: SafeArea(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const Text(
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
                        state.filterType.length,
                        (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  if (selectedType
                                      .contains(state.filterType[index])) {
                                    selectedType
                                        .remove(state.filterType[index]);
                                  } else {
                                    selectedType.add(state.filterType[index]);
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: selectedType.contains(
                                          state.filterType[index])
                                      ? Colors.green.withOpacity(0.5)
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 10),
                                child: Text(
                                  state.filterType[index],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          context.read<PokemonFilterBloc>().add(FilterTypeEvent(
                              typeList: selectedType,
                              listPokemon: widget.filterList));
                        });
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
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
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 20),
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
        return Text("hello");
        // }
      }
      // if (state is PokemonFilterLoading) {
      //   return CircularProgressIndicator();
      // } else {
      //   return Text("hello");
      // }
    });
  }
}
