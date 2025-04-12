import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/pokemon_item.dart';
import '../../../data/services/pokeapi_service.dart';

class PokedexController extends GetxController {
  final PokeApiService _apiService = PokeApiService();
  final RxList<PokemonItem> pokemonList = <PokemonItem>[].obs;
  final RxList<PokemonItem> searchPokemonList = <PokemonItem>[].obs;

  @override
  void onInit() {
    fetchPokemon();
    super.onInit();
  }

  @override
  void onClose() {
    pokemonList.close();
    searchPokemonList.close();
    super.onClose();
  }

  // 获取所有宝可梦列表
  Future<void> fetchPokemon() async {
    final response = await _apiService.getPokemonList();
    pokemonList.assignAll(response);
    searchPokemonList.assignAll(response);
  }

}

PokedexController get controller {
  assert(Get.isRegistered<PokedexController>(), '请先注册PokedexController');
  return Get.find();
}
