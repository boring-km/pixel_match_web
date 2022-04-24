import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_match_web/presentation/play/play_view_model.dart';

import 'image_painter.dart';

class PlayView extends GetView<PlayViewModel> {
  const PlayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: ImagePainter(
                colors: controller.colors,
                xCount: controller.pixelWidth,
                yCount: controller.pixelHeight,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 64,
                      child: Row(
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
                          GestureDetector(
                            onTap: () => controller.start(),
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: controller.showNext,
                            child: Container(
                              color: Colors.white,
                              child: Text(
                                controller.hasNextString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
