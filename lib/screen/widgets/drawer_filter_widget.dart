import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/pokemon_event.dart';

import '../../bloc/pokemon_bloc.dart';
import '../../bloc/pokemon_state.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool isActive = false;
  List<String> selectedType = [];
  @override
  void initState() {
    setState(() {
      selectedType = context.read<PokemonBloc>().filterTypes;
    });
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: const Text(
                  "Filter By Type:",
                  style: TextStyle(
                    fontSize: 15,
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
                      context.read<PokemonBloc>().pokemonType.length,
                      (index) => InkWell(
                            onTap: () {
                              setState(() {
                                if (selectedType.contains(context
                                    .read<PokemonBloc>()
                                    .pokemonType[index])) {
                                  selectedType.remove(context
                                      .read<PokemonBloc>()
                                      .pokemonType[index]);
                                } else {
                                  selectedType.add(context
                                      .read<PokemonBloc>()
                                      .pokemonType[index]);
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedType.contains(context
                                        .read<PokemonBloc>()
                                        .pokemonType[index])
                                    ? Colors.green.withOpacity(0.5)
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              child: Text(
                                context.read<PokemonBloc>().pokemonType[index],
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    context
                        .read<PokemonBloc>()
                        .add(FilterTypeEvent(typeList: selectedType));
                  });
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(primary: Colors.white),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0.1,
                        blurRadius: 0.7,
                        offset: Offset(0, 0.8), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
