class PokemonMove {
  final String index;
  final String generation;
  final String name;
  final String nameJp;
  final String nameEn;
  final String type;
  final String category;
  final String power;
  final String accuracy;
  final String pp;
  final String text;

  PokemonMove({
    required this.index,
    required this.generation,
    required this.name,
    required this.nameJp,
    required this.nameEn,
    required this.type,
    required this.category,
    required this.power,
    required this.accuracy,
    required this.pp,
    required this.text,
  });

  factory PokemonMove.fromJson(Map<String, dynamic> json) {
    return PokemonMove(
      index: json['index']?.toString() ?? '0000',
      generation: json['generation']?.toString() ?? '未知世代',
      name: json['name']?.toString() ?? '未知技能',
      nameJp: json['name_jp']?.toString() ?? '不明',
      nameEn: json['name_en']?.toString() ?? 'Unknown',
      type: json['type']?.toString() ?? '一般',
      category: json['category']?.toString() ?? '物理',
      power: json['power']?.toString() ?? '0',
      accuracy: json['accuracy']?.toString() ?? '0',
      pp: json['pp']?.toString() ?? '0',
      text: json['text']?.toString() ?? '效果未知',
    );
  }

  static List<PokemonMove> listFromJson(List<dynamic> jsonList) {
    return jsonList
        .map((json) => PokemonMove.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
