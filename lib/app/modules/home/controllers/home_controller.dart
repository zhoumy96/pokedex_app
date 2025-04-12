import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../abilities/views/abilities_view.dart';
import '../../about/views/about_view.dart';
import '../../items/views/items_view.dart';
import '../../moves/views/moves_view.dart';
import '../../pokedex/views/pokedex_view.dart';

class HomeController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final pages = <Widget>[
    const PokedexView(),
    const ItemsView(),
    const MovesView(),
    const AbilitiesView(),
    const AboutView(),
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
