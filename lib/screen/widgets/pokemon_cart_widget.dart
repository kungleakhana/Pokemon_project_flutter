import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_project/bloc/pokemon_favourite/pokemon_favourite_bloc.dart';
import 'package:pokemon_project/bloc/pokemon_favourite/pokemon_favourite_event.dart';
import 'package:pokemon_project/bloc/pokemon_favourite/pokemon_favourite_state.dart';
import 'package:pokemon_project/models/pokemon_model.dart';
import 'package:pokemon_project/screen/pokemon_detail.dart';

class PokemonCartWidget extends StatefulWidget {
  final PokemonModel pokemonModel;

  String? isActive;
  PokemonCartWidget({super.key, required this.pokemonModel, this.isActive});

  @override
  State<PokemonCartWidget> createState() => _PokemonCartWidgetState();
}

class _PokemonCartWidgetState extends State<PokemonCartWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  PokemonDetail(pokemonModel: widget.pokemonModel)));
        });
      },
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Container(
            height: 150,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green.withOpacity(0.3)),
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: AspectRatio(
                    aspectRatio: 3 / 3.2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.pokemonModel.imageurl ?? "",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  widget.pokemonModel.name ?? "",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.05),
                                  shape: BoxShape.circle),
                              child: IconButton(onPressed: () {
                                context.read<PokemonFavouriteBloc>().add(
                                    FavouriteClicked(
                                        pokemonModel: widget.pokemonModel));
                              }, icon: BlocBuilder<PokemonFavouriteBloc,
                                      PokemonFavouriteState>(
                                  builder: (context, state) {
                                if (state is PokemonFavouriteSucessState &&
                                    state.pokemonList
                                        .contains(widget.pokemonModel)) {
                                  return const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  );
                                }
                                return const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                );
                              })),
                            ),
                          ],
                        ),
                        Text(
                          "ID : ${widget.pokemonModel.id ?? " "} ",
                          style: const TextStyle(
                            color: Color(0xff5089C6),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          widget.pokemonModel.xdescription ?? "",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Type",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                              width: 5,
                            ),
                            Wrap(
                              spacing: 5,
                              children: List.generate(
                                  widget.pokemonModel.typeofpokemon!.length,
                                  (index) => Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.5),
                                          // color: Colors.blue[200],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 10),
                                        child: Text(widget.pokemonModel
                                            .typeofpokemon![index]),
                                      )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
