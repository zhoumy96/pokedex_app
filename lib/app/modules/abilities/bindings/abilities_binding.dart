import 'package:get/get.dart';

import '../controllers/abilities_controller.dart';

class AbilitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbilitiesController>(
      () => AbilitiesController(),
    );
  }
}
