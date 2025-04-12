import 'package:flutter/material.dart';

// Pokémon 类型及其对应颜色的映射
const Map<String, Color> pokemonTypeColors = {
  '一般': Color(0xFF999999),    // Normal
  '火': Color(0xFFEE8130),      // Fire
  '水': Color(0xFF6390F0),      // Water
  '电': Color(0xFFF7D02C),      // Electric
  '草': Color(0xFF7AC74C),      // Grass
  '冰': Color(0xFF96D9D6),      // Ice
  '格斗': Color(0xFFC22E28),    // Fighting
  '毒': Color(0xFFA33EA1),      // Poison
  '地面': Color(0xFFE2BF65),    // Ground
  '飞行': Color(0xFFA98FF3),    // Flying
  '超能力': Color(0xFFF95587),   // Psychic
  '虫': Color(0xFFA6B91A),       // Bug
  '岩石': Color(0xFFB6A136),    // Rock
  '幽灵': Color(0xFF735797),    // Ghost
  '龙': Color(0xFF6F35FC),      // Dragon
  '恶': Color(0xFF705746),      // Dark
  '钢': Color(0xFFB7B7CE),      // Steel
  '妖精': Color(0xFFD685AD),    // Fairy
  // 招式
  '物理': Color(0xFFFF4400),
  '特殊': Color(0xFF2266CC),
  '变化': Color(0xFF999999),
};

class PokemonType extends StatelessWidget {
  final List<String> types; // Pokémon 类型列表

  const PokemonType({
    super.key,
    required this.types,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: types.map((type) => _buildItemType(type)).toList(),
    );
  }

  Widget _buildItemType(String type) {
    final color = pokemonTypeColors[type] ?? Colors.grey; // 默认颜色为灰色
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        type,
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}