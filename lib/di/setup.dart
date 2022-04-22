import 'package:get/get.dart';
import 'package:pixel_match_web/presentation/play/play_view_model.dart';

class PlayViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PlayViewModel());
  }

}