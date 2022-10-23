import 'package:flutter/material.dart';
import 'package:pokemon_project/models/pokemon_model.dart';

class PokemonDetail extends StatefulWidget {
  final PokemonModel pokemonModel;
  const PokemonDetail({super.key, required this.pokemonModel});

  @override
  State<PokemonDetail> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PokemonDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 2 / 1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  // color: Colors.green.withOpacity(0.1),
                  child: Image.network(
                    widget.pokemonModel.imageurl ?? "",
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  // color: Colors.green.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.pokemonModel.category ?? "",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            widget.pokemonModel.name ?? "",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
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
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(10.0),
                ),

                // color: Colors.green.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(widget.pokemonModel.xdescription ?? "",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              height: 1.5)),
                      Text(
                        "Characteristics",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.5),
                                  border: Border.all(
                                      color: Colors.green.withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Weight",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      widget.pokemonModel.weight ?? "",
                                      style: _buildValuePrice(),
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.5),
                                  border: Border.all(
                                      color: Colors.green.withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(8)),
                              // color: Colors.green.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Height",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      widget.pokemonModel.height ?? "",
                                      style: _buildValuePrice(),
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.5),
                                  border: Border.all(
                                      color: Colors.green.withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(8)),
                              // color: Colors.green.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Speed",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      widget.pokemonModel.speed.toString(),
                                      style: _buildValuePrice(),
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.5),
                                  border: Border.all(
                                      color: Colors.green.withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(8)),
                              // color: Colors.green.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "HP",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      widget.pokemonModel.hp.toString(),
                                      style: _buildValuePrice(),
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.5),
                                  border: Border.all(
                                      color: Colors.green.withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(8)),
                              // color: Colors.green.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Attack",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      widget.pokemonModel.attack.toString(),
                                      style: _buildValuePrice(),
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.5),
                                  border: Border.all(
                                      color: Colors.green.withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(8)),
                              // color: Colors.green.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Defense",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      widget.pokemonModel.defense.toString(),
                                      style: _buildValuePrice(),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_buildValuePrice() {
  return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black.withOpacity(0.8));
}
