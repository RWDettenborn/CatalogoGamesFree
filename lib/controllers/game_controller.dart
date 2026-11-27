import 'package:get/get.dart';
import 'package:catalogo_games_free/models/game_model.dart';
import 'package:catalogo_games_free/services/game_service.dart';

class GameController extends GetxController {
  final GameService _service = GameService();

  final RxList<GameModel> jogos = <GameModel>[].obs;
  final RxBool carregando = false.obs;
  final RxnString erro = RxnString();

  static GameController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    carregarJogos();
  }

  String _msg(Object e) => e.toString().replaceFirst('Exception: ', '');

  Future<void> carregarJogos() async {
    carregando.value = true;
    erro.value = null;
    try {
      final lista = await _service.fetchGames();
      jogos.assignAll(lista);
    } catch (e) {
      erro.value = _msg(e);
    } finally {
      carregando.value = false;
    }
  }
}