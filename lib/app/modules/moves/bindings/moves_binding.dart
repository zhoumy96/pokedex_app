import 'package:get/get.dart';

import '../controllers/moves_controller.dart';

class MovesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovesController>(
      () => MovesController(),
    );
  }
}
