import 'package:pokemon_project/models/pokemon_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PokemonRepository {
  Future<List<PokemonModel>> getAllPokemon() async {
    var url = Uri.parse(
        "https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json");
    var response = await http.get(url);
    List listPokemon = convert.jsonDecode(response.body);
    List<PokemonModel> pokemon =
        listPokemon.map((e) => PokemonModel.fromJson(e)).toList();
    return pokemon;
  }
}
