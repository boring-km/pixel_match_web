import 'package:get/get.dart';
import 'package:pixel_match_web/data/image_api.dart';
import 'package:pixel_match_web/data/image_use_case.dart';
import 'package:pixel_match_web/presentation/play/play_view_model.dart';

class PlayViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PlayViewModel(
      Get.put(ImageUseCase(
        Get.put(ImageApi())
      ))
    ));
  }

}