import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/pokemon.dart';
import '../models/pokemon_item.dart';

class PokeApiService {
  static const String pokemonFullList = 'assets/pokemon_full_list.json';

  Future<List<PokemonItem>> getPokemonList() async {
    final String jsonString = await rootBundle.loadString(pokemonFullList);
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => PokemonItem.fromJson(json)).toList();
  }
}