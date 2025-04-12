class Pokemon {
  final String index;
  final String name;
  final String nameEn;
  final String nameJp;
  final List<String> types;
  final Meta meta;
  final String profile;
  final List<Form> forms;
  final List<Stat> stats;
  final List<FlavorTextGroup> flavorTexts;
  final List<EvolutionChain> evolutionChains;
  final Map<String, String> names;
  final MoveData moves;
  final List<HomeImage> homeImages;

  Pokemon({
    required this.index,
    required this.name,
    required this.nameEn,
    required this.nameJp,
    required this.types,
    required this.meta,
    required this.profile,
    required this.forms,
    required this.stats,
    required this.flavorTexts,
    required this.evolutionChains,
    required this.names,
    required this.moves,
    required this.homeImages,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      index: json['index'] ?? '0000',
      name: json['name'] ?? '未知',
      nameEn: json['name_en'] ?? 'Unknown',
      nameJp: json['name_jp'] ?? '不明',
      types: List<String>.from(json['types'] ?? []),
      meta: Meta.fromJson(json['meta'] ?? {}),
      profile: json['profile'] ?? '暂无介绍',
      forms: List<Form>.from(
          (json['forms'] ?? []).map((x) => Form.fromJson(x))),
      stats: List<Stat>.from(
          (json['stats'] ?? []).map((x) => Stat.fromJson(x))),
      flavorTexts: List<FlavorTextGroup>.from(
          (json['flavor_texts'] ?? []).map((x) => FlavorTextGroup.fromJson(x))),
      evolutionChains: (json['evolution_chains'] as List).map<EvolutionChain>(
              (chain) => EvolutionChain.fromJson(chain as List<dynamic>)
      ).toList(),
      names: Map<String, String>.from(json['names'] ?? {}),
      moves: MoveData.fromJson(json['moves'] ?? {}),
      homeImages: List<HomeImage>.from(
          (json['home_images'] ?? []).map((x) => HomeImage.fromJson(x))),
    );
  }
}

class Meta {
  final String iconPosition;

  Meta({required this.iconPosition});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      iconPosition: json['icon_position'] ?? '0 0',
    );
  }
}

class Form {
  final String name;
  final String index;
  final bool isMega;
  final bool isGmax;
  final String image;
  final List<String> types;
  final String genus;
  final List<Ability> abilities;
  final Experience experience;
  final String height;
  final String weight;
  final GenderRate genderRate;
  final String shape;
  final String color;
  final CatchRate catchRate;
  final List<String> eggGroups;

  Form({
    required this.name,
    required this.index,
    required this.isMega,
    required this.isGmax,
    required this.image,
    required this.types,
    required this.genus,
    required this.abilities,
    required this.experience,
    required this.height,
    required this.weight,
    required this.genderRate,
    required this.shape,
    required this.color,
    required this.catchRate,
    required this.eggGroups,
  });

  factory Form.fromJson(Map<String, dynamic> json) {
    return Form(
      name: json['name'] ?? '未知形态',
      index: json['index'] ?? '0000',
      isMega: json['is_mega'] ?? false,
      isGmax: json['is_gmax'] ?? false,
      image: json['image'] ?? 'default.png',
      types: List<String>.from(json['types'] ?? []),
      genus: json['genus'] ?? '未知种类',
      abilities: List<Ability>.from(
          (json['ability'] ?? []).map((x) => Ability.fromJson(x))),
      experience: Experience.fromJson(json['experience'] ?? {}),
      height: json['height'] ?? '0m',
      weight: json['weight'] ?? '0kg',
      genderRate: GenderRate.fromJson(json['gender_rate'] ?? {}),
      shape: json['shape'] ?? '未知形状',
      color: json['color'] ?? '未知颜色',
      catchRate: CatchRate.fromJson(json['catch_rate'] ?? {}),
      eggGroups: List<String>.from(json['egg_groups'] ?? []),
    );
  }
}

class Ability {
  final String name;
  final bool isHidden;

  Ability({required this.name, required this.isHidden});

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      name: json['name'] ?? '未知特性',
      isHidden: json['is_hidden'] ?? false,
    );
  }
}

class Experience {
  final String number;
  final String speed;

  Experience({required this.number, required this.speed});

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      number: json['number'] ?? '0',
      speed: json['speed'] ?? '普通',
    );
  }
}

class GenderRate {
  final double male;
  final double female;

  GenderRate({required this.male, required this.female});

  factory GenderRate.fromJson(Map<String, dynamic> json) {
    return GenderRate(
      male: _parsePercentage(json['male']),
      female: _parsePercentage(json['female']),
    );
  }

  static double _parsePercentage(String? value) {
    if (value == null) return 0.0;
    final cleanValue = value.replaceAll('%', '');
    return double.tryParse(cleanValue) ?? 0.0;
  }
}

class CatchRate {
  final int number;
  final double rate;

  CatchRate({required this.number, required this.rate});

  factory CatchRate.fromJson(Map<String, dynamic> json) {
    return CatchRate(
      number: int.tryParse(json['number']?.toString() ?? '0') ?? 0,
      rate: _parseRate(json['rate']),
    );
  }

  static double _parseRate(dynamic value) {
    if (value is String) {
      return double.tryParse(value.replaceAll('%', '')) ?? 0.0;
    }
    return value?.toDouble() ?? 0.0;
  }
}

class Stat {
  final String form;
  final StatData data;

  Stat({required this.form, required this.data});

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      form: json['form'] ?? '一般',
      data: StatData.fromJson(json['data'] ?? {}),
    );
  }
}

class StatData {
  final int hp;
  final int attack;
  final int defense;
  final int spAttack;
  final int spDefense;
  final int speed;

  StatData({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.spAttack,
    required this.spDefense,
    required this.speed,
  });

  factory StatData.fromJson(Map<String, dynamic> json) {
    return StatData(
      hp: _parseInt(json['hp']),
      attack: _parseInt(json['attack']),
      defense: _parseInt(json['defense']), // 注意字段拼写可能需要调整
      spAttack: _parseInt(json['sp_attack']),
      spDefense: _parseInt(json['sp_defense']),
      speed: _parseInt(json['speed']),
    );
  }

  static int _parseInt(dynamic value) {
    if (value is String) return int.tryParse(value) ?? 0;
    return value?.toInt() ?? 0;
  }
}

class FlavorTextGroup {
  final String name;
  final List<FlavorText> versions;

  FlavorTextGroup({required this.name, required this.versions});

  factory FlavorTextGroup.fromJson(Map<String, dynamic> json) {
    return FlavorTextGroup(
      name: json['name'] ?? '未知世代',
      versions: List<FlavorText>.from(
          (json['versions'] ?? []).map((x) => FlavorText.fromJson(x))),
    );
  }
}

class FlavorText {
  final String name;
  final String group;
  final String text;

  FlavorText({required this.name, required this.group, required this.text});

  factory FlavorText.fromJson(Map<String, dynamic> json) {
    return FlavorText(
      name: json['name'] ?? '未知版本',
      group: json['group'] ?? '未知组别',
      text: json['text'] ?? '暂无描述',
    );
  }
}

class EvolutionChain {
  final List<EvolutionStage> stages;

  EvolutionChain({required this.stages});

  // 参数类型改为 List<dynamic>
  factory EvolutionChain.fromJson(List<dynamic> json) {
    return EvolutionChain(
      stages: json
          .map<EvolutionStage>((stage) => EvolutionStage.fromJson(stage))
          .toList(),
    );
  }
}

class EvolutionStage {
  final String name;
  final String stage;
  final String? text;
  final String image;
  final String? backText;
  final String? from;
  final String? formName;

  EvolutionStage({
    required this.name,
    required this.stage,
    this.text,
    required this.image,
    this.backText,
    this.from,
    this.formName,
  });

  factory EvolutionStage.fromJson(Map<String, dynamic> json) {
    return EvolutionStage(
      name: json['name'] ?? '未知阶段',
      stage: json['stage'] ?? '未进化',
      text: json['text'],
      image: json['image'] ?? 'default.png',
      backText: json['back_text'],
      from: json['from'],
      formName: json['form_name'],
    );
  }
}

class MoveData {
  final List<LearnedMove> learned;
  final List<MachineMove> machine;

  MoveData({required this.learned, required this.machine});

  factory MoveData.fromJson(Map<String, dynamic> json) {
    return MoveData(
      learned: List<LearnedMove>.from(
          (json['learned'] ?? []).map((x) => LearnedMove.fromJson(x))),
      machine: List<MachineMove>.from(
          (json['machine'] ?? []).map((x) => MachineMove.fromJson(x))),
    );
  }
}

class LearnedMove {
  final String form;
  final List<Move> data;

  LearnedMove({required this.form, required this.data});

  factory LearnedMove.fromJson(Map<String, dynamic> json) {
    return LearnedMove(
      form: json['form'] ?? '一般',
      data: List<Move>.from((json['data'] ?? []).map((x) => Move.fromJson(x))),
    );
  }
}

class MachineMove {
  final String form;
  final List<Move> data;

  MachineMove({required this.form, required this.data});

  factory MachineMove.fromJson(Map<String, dynamic> json) {
    return MachineMove(
      form: json['form'] ?? '一般',
      data: List<Move>.from((json['data'] ?? []).map((x) => Move.fromJson(x))),
    );
  }
}

class Move {
  final String levelLearnedAt;
  final String? machineUsed;
  final String method;
  final String name;
  final String flavorText;
  final String type;
  final String category;
  final String power;
  final String accuracy;
  final String pp;

  Move({
    required this.levelLearnedAt,
    this.machineUsed,
    required this.method,
    required this.name,
    required this.flavorText,
    required this.type,
    required this.category,
    required this.power,
    required this.accuracy,
    required this.pp,
  });

  factory Move.fromJson(Map<String, dynamic> json) {
    return Move(
      levelLearnedAt: json['level_learned_at']?.toString() ?? '—',
      machineUsed: json['machine_used'],
      method: json['method'] ?? '未知方式',
      name: json['name'] ?? '未知招式',
      flavorText: json['flavor_text'] ?? '暂无描述',
      type: json['type'] ?? '一般',
      category: json['category'] ?? '变化',
      power: json['power']?.toString() ?? '—',
      accuracy: json['accuracy']?.toString() ?? '—',
      pp: json['pp']?.toString() ?? '0',
    );
  }
}

class HomeImage {
  final String name;
  final String image;
  final String? shiny;

  HomeImage({required this.name, required this.image, this.shiny});

  factory HomeImage.fromJson(Map<String, dynamic> json) {
    return HomeImage(
      name: json['name'] ?? '未知形态',
      image: json['image'] ?? 'default.png',
      shiny: json['shiny'],
    );
  }
}