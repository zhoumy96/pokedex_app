// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../modules/pokedex/controllers/pokedex_controller.dart';
// class PokemonSearch extends StatelessWidget {
//   final PokedexController controller;
//
//   const PokemonSearch({
//     super.key,
//     required this.controller,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: TextField(
//         // focusNode: controller.searchFocusNode,
//         // controller: controller.searchTextController,
//         // onChanged: (value) => controller.searchQuery.refresh(),
//         decoration: InputDecoration(
//           hintText: '输入宝可梦名称或编号',
//           hintStyle: TextStyle(
//             color: Theme.of(context).colorScheme.onSurfaceVariant,
//             fontSize: 16,
//           ),
//           prefixIcon: Icon(
//             Icons.search,
//             color: Theme.of(context).colorScheme.onSurfaceVariant,
//           ),
//           suffixIcon: Obx(() => controller.searchQuery.isNotEmpty
//               ? IconButton(
//                   icon: Icon(
//                     Icons.clear,
//                     color: Theme.of(context).colorScheme.onSurfaceVariant,
//                   ),
//                   onPressed: controller.clearSearch,
//                 )
//               : SizedBox.shrink()
//           ),
//           filled: true,
//           fillColor: Theme.of(context).colorScheme.surfaceContainerLowest,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(24),
//             borderSide: BorderSide.none,
//           ),
//           contentPadding: const EdgeInsets.symmetric(vertical: 14),
//         ),
//         style: TextStyle(
//           color: Theme.of(context).colorScheme.onSurface,
//           fontSize: 16,
//         ),
//       ),
//     );
//   }
// }
