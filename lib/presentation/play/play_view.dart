import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_match_web/presentation/play/play_view_model.dart';

class PlayView extends GetView<PlayViewModel> {
  const PlayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.white,
            child: const Center(
              child: Text('웹 버전 픽셀 그림 맞추기'),
            ),
          ),
        ),
      ),
    );
  }
}
