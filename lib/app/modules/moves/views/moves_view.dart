import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokedex_app/app/components/pokemon_type.dart';

import '../../../data/models/pokemon_move_model.dart';
import '../controllers/moves_controller.dart';

class MovesView extends GetView<MovesController> {
  const MovesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        surfaceTintColor: Colors.transparent, // 关键参数
        backgroundColor: Colors.white, // 固定背景色
        title: const Text('招式列表'),
      ),
      body: Obx(() {
        return Column(
          children: [
            // PokemonSearch(controller: controller),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(12),
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemCount: controller.pokemonMoveList.length,
                itemBuilder: (context, index) {
                  final pokemonMove = controller.pokemonMoveList[index];
                  return _buildPokemonMoveItem(pokemonMove);
                },
              ),
            )
          ],
        );
      }),
    );
  }

  Widget _buildPokemonMoveItem(PokemonMove pokemonMove) {
    return InkWell(
      onTap: () {
        // Get.toNamed('/move/拍击');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                pokemonMove.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                // 类型标签
                PokemonType(types: [pokemonMove.type]),
                const SizedBox(width: 4),
                PokemonType(types: [pokemonMove.category]),
                // 编号
                Text(
                  '#${pokemonMove.index}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
