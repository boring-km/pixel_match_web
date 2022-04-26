import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_match_web/presentation/play/play_view_model.dart';

import 'image_painter.dart';

class PlayView extends GetView<PlayViewModel> {
  const PlayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayViewModel>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: ImagePainter(
                    colors: controller.state.colors,
                    xCount: controller.state.width,
                    yCount: controller.state.height,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              ),
                              child: const Text(
                                '이 포켓몬의 이름은 뭘까요?',
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Container(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              width: 150,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              ),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: '팬텀',
                                ),
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: controller.showBefore,
                                  style: ElevatedButton.styleFrom(primary: Colors.white),
                                  child: Text(
                                    controller.hasBeforeString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: controller.showBefore,
                                  style: ElevatedButton.styleFrom(primary: Colors.white),
                                  child: Text(
                                    '확인',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: controller.showNext,
                                  style: ElevatedButton.styleFrom(primary: Colors.white),
                                  child: Text(
                                    controller.hasNextString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
