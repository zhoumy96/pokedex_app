import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pokedex_app/app/data/models/pokemon_move_model.dart';

class MoveApiService {
  static const String pokemonMoveList = 'assets/move_list.json';

  Future<List<PokemonMove>> getPokemonMoveList() async {
    final String jsonString = await rootBundle.loadString(pokemonMoveList);
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => PokemonMove.fromJson(json)).toList();
  }
}