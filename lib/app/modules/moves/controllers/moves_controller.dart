import 'package:get/get.dart';
import 'package:pokedex_app/app/data/models/pokemon_move_model.dart';
import 'package:pokedex_app/app/data/services/move_api_service.dart';

class MovesController extends GetxController {
  final MoveApiService _apiService = MoveApiService();
  final RxList<PokemonMove> pokemonMoveList = <PokemonMove>[].obs;

  @override
  void onInit() {
    fetchPokemonMoves();
    super.onInit();
  }

  @override
  void onClose() {
    pokemonMoveList.close();
    super.onClose();
  }

  // 获取所有招式列表
  Future<void> fetchPokemonMoves() async {
    final response = await _apiService.getPokemonMoveList();
    pokemonMoveList.assignAll(response);
  }
}
