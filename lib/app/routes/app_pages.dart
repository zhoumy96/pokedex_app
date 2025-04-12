import 'package:get/get.dart';

import '../modules/abilities/bindings/abilities_binding.dart';
import '../modules/abilities/views/abilities_view.dart';
import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/items/bindings/items_binding.dart';
import '../modules/items/views/items_view.dart';
import '../modules/moves/bindings/moves_binding.dart';
import '../modules/moves/views/moves_view.dart';
import '../modules/pokedex/bindings/pokedex_binding.dart';
import '../modules/pokedex/views/pokedex_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: _Paths.POKEDEX,
    //   page: () => const PokedexView(),
    //   binding: PokedexBinding(),
    // ),
    // GetPage(
    //   name: _Paths.ITEMS,
    //   page: () => const ItemsView(),
    //   binding: ItemsBinding(),
    // ),
    // GetPage(
    //   name: _Paths.MOVES,
    //   page: () => const MovesView(),
    //   binding: MovesBinding(),
    // ),
    // GetPage(
    //   name: _Paths.ABILITIES,
    //   page: () => const AbilitiesView(),
    //   binding: AbilitiesBinding(),
    // ),
    // GetPage(
    //   name: _Paths.ABOUT,
    //   page: () => const AboutView(),
    //   binding: AboutBinding(),
    // ),
  ];
}
