import 'package:get/get.dart';

import '../controllers/pokedex_controller.dart';

class PokedexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokedexController>(
      () => PokedexController(),
    );
  }
}
