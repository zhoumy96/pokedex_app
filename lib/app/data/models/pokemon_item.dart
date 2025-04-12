class PokemonItem {
  final String index;
  final String name;
  final String nameJp;
  final String nameEn;
  final String generation;
  final List<String> types;
  final Meta meta;

  PokemonItem({
    required this.index,
    required this.name,
    required this.nameJp,
    required this.nameEn,
    required this.generation,
    required this.types,
    required this.meta,
  });

  factory PokemonItem.fromJson(Map<String, dynamic> json) {
    return PokemonItem(
      index: json['index'] ?? '0000',
      name: json['name'] ?? '未知',
      nameJp: json['name_jp'] ?? '不明',
      nameEn: json['name_en'] ?? 'Unknown',
      generation: json['generation'] ?? '未知世代',
      types: List<String>.from(json['types'] ?? []),
      meta: Meta.fromJson(json['meta'] ?? {}),
    );
  }

  static List<PokemonItem> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => PokemonItem.fromJson(json)).toList();
  }
}

class Meta {
  final String iconPosition;

  Meta({required this.iconPosition});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      iconPosition: json['icon_position'] ?? '0px 0px',
    );
  }
}