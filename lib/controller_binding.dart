import 'package:get/get.dart';
import 'package:catalogo_games_free/controllers/game_controller.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<GameController>(GameController(), permanent: true);
  }
}