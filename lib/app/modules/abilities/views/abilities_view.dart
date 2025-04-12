import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/abilities_controller.dart';

class AbilitiesView extends GetView<AbilitiesController> {
  const AbilitiesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AbilitiesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AbilitiesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
