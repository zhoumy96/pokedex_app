import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/components/pokemon_type.dart';
import '../../../components/pokemon_avatar.dart';
import '../../../components/searches/pokemon_search.dart';
import '../../../data/models/pokemon_item.dart';
import '../controllers/pokedex_controller.dart';

class PokedexView extends GetWidget<PokedexController> {
  const PokedexView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PokedexController());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        surfaceTintColor: Colors.transparent, // 关键参数
        backgroundColor: Colors.white, // 固定背景色
        title: const Text('宝可梦图鉴'),
      ),
      body: Obx(() {
        return Column(
          children: [
            // PokemonSearch(controller: controller),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: controller.searchPokemonList.length,
                itemBuilder: (context, index) {
                  final pokemon = controller.searchPokemonList[index];
                  return _buildPokemonItem(pokemon);
                },
              ),
            )
          ],
        );
      }),
    );
  }

  Widget _buildPokemonItem(PokemonItem pokemonItem) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white, // 背景颜色
        borderRadius: BorderRadius.circular(15), // 圆角
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // 阴影颜色
            offset: Offset(0, 10), // 阴影偏移量
            blurRadius: 5, // 模糊半径
            spreadRadius: 5, // 扩展半径
          ),
        ],
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          PokemonAvatar(bgPosition: pokemonItem.meta.iconPosition),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pokemonItem.name),
                SizedBox(height: 6),
                PokemonType(types: pokemonItem.types),
              ],
            ),
          ),
          Text('#${pokemonItem.index}'),
          SizedBox(width: 16),
        ],
      ),
    );
  }

}
