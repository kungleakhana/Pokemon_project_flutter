import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/filter/filter_bloc.dart';
import 'package:pokemon_project/bloc/filter/filter_event.dart';
import 'package:pokemon_project/bloc/filter/fliter_state.dart';
import 'package:pokemon_project/bloc/pokemon/pokemon_state.dart';

import '../../bloc/pokemon/pokemon_bloc.dart';

class DrawerWidget extends StatefulWidget {
  final Function(List<String>) onFilterSubmit;
  const DrawerWidget({super.key, required this.onFilterSubmit});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  List<String> _typesToSubmit = [];
  @override
  void initState() {
    context.read<FilterBloc>().add(GetFilterItems());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
      return Drawer(
        child: SafeArea(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
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
              BlocConsumer<FilterBloc, FilterState>(listener: (c, state) {
                if (state is FilterSucessState) {
                  _typesToSubmit = state.pokemonTypeList
                      .where((e) => e.isSelected)
                      .map((e) => e.name)
                      .toList();
                }
              }, builder: (c, state) {
                if (state is FilterSucessState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 4,
                      children: List.generate(
                          state.pokemonTypeList.length,
                          (index) => InkWell(
                                onTap: () {
                                  context.read<FilterBloc>().add(
                                      FilterItemClicked(
                                          pokemonTypeModel:
                                              state.pokemonTypeList[index]));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        state.pokemonTypeList[index].isSelected
                                            ? Colors.green.withOpacity(0.5)
                                            : Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 10),
                                  child: Text(
                                    state.pokemonTypeList[index].name,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              )),
                    ),
                  );
                }
                return Container();
              }),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      widget.onFilterSubmit(_typesToSubmit);
                      Navigator.of(context).pop();
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
    });
  }
}
