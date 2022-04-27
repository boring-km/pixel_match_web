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
        final state = controller.state;

        return Scaffold(
          body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: ImagePainter(
                    colors: state.colors,
                    xCount: state.width,
                    yCount: state.height,
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
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 50,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.answers.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: ElevatedButton(
                                      onPressed: controller.check(state.answers[index]),
                                      style: ElevatedButton.styleFrom(primary: Colors.white),
                                      child: Text(
                                        state.answers[index],
                                        style: const TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
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
