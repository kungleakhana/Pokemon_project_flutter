import 'package:flutter/material.dart';
import 'package:pokemon_project/models/pokemon_model.dart';
import 'package:pokemon_project/screen/pokemon_detail.dart';

class CartWidget extends StatefulWidget {
  final PokemonModel pokemonModel;

  const CartWidget({super.key, required this.pokemonModel});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                PokemonDetail(pokemonModel: widget.pokemonModel)));
      },
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      widget.pokemonModel.name ?? "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    "ID : ${widget.pokemonModel.id ?? " "} ",
                    style: TextStyle(
                      color: Color(0xff5089C6),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    widget.pokemonModel.xdescription ?? "",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Type",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
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
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 10),
                                  child: Text(widget
                                      .pokemonModel.typeofpokemon![index]),
                                )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
