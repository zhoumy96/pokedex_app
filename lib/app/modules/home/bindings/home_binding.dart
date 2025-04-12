import 'package:get/get.dart';

import '../../abilities/controllers/abilities_controller.dart';
import '../../about/controllers/about_controller.dart';
import '../../items/controllers/items_controller.dart';
import '../../moves/controllers/moves_controller.dart';
import '../../pokedex/controllers/pokedex_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut(() => PokedexController(), fenix: true);
    Get.lazyPut(() => ItemsController(), fenix: true);
    Get.lazyPut(() => MovesController(), fenix: true);
    Get.lazyPut(() => AbilitiesController(), fenix: true);
    Get.lazyPut(() => AboutController(), fenix: true);
  }
}
