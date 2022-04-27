import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as lib;
import 'package:pixel_match_web/core/random.dart';
import 'package:pixel_match_web/data/get_divisors.dart';
import 'package:pixel_match_web/data/image_use_case.dart';
import 'package:pixel_match_web/data/quiz_api.dart';
import 'package:pixel_match_web/domain/model/pixel_state.dart';
import 'package:pixel_match_web/ui/transparent_dialog.dart';

class PlayViewModel extends GetxController {
  List<int> _pixelWidthList = <int>[];
  int _pixelIndex = 2;
  late lib.Image _image;
  int _answerIndex = 0;

  PixelState _state = const PixelState(
    width: 1,
    height: 1,
    colors: [],
    quizList: [],
    answers: [],
  );

  bool isCheck = false;

  bool close = false;

  PixelState get state => _state;

  final ImageUseCase imageUseCase;

  PlayViewModel(this.imageUseCase);

  @override
  void onInit() {
    super.onInit();

    Future.microtask(() async {
      var quizData = await QuizApi.getQuizData();
      _state = state.copyWith(quizList: quizData, answers: _getAnswerList(quizData));

      _answerIndex = randomNumberFrom(state.quizList);
      _image = await imageUseCase.getImageFrom(state.quizList[_answerIndex]['imageUrl']);
      _state = state.copyWith(width: _initializeWidth());
      showPixels(_state.width);
    });
  }

  int _initializeWidth() {
    int imageWidth = _image.width;
    _pixelWidthList = GetDivisors.by(imageWidth);
    return _pixelWidthList[_pixelIndex] + 1;
  }

  showPixels(int selectedPixel) async {
    _state = imageUseCase.getPixelInfo(_image, _state, selectedPixel - 1);
    Future.delayed(const Duration(milliseconds: 100), () => update());
  }

  bool hasNext() => _pixelIndex + 1 < _pixelWidthList.length;

  bool hasBefore() => 2 < _pixelIndex;

  String hasNextString() => hasNext() ? '다음' : '끝';

  String hasBeforeString() => hasBefore() ? '이전' : '시작';

  get showNext => () {
        if (hasNext()) {
          showPixels(_pixelWidthList[++_pixelIndex]);
        }
      };

  get showBefore => () {
        if (hasBefore()) {
          showPixels(_pixelWidthList[--_pixelIndex]);
        }
      };

  check(String input) {
    if (isCheck) {
      return null;
    }
    return () {
      isCheck = true;
      final isAnswer = input == state.quizList[_answerIndex]['answer'];
      if (isAnswer) {
        showTransparentDialog(
          Get.context!,
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: const Center(
                    child: Text(
                  '정답',
                  style: TextStyle(fontSize: 20),
                )),
              ),
            ),
          ),
        );
      } else {
        showTransparentDialog(
          Get.context!,
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: const Center(
                    child: Text(
                  '오답',
                  style: TextStyle(fontSize: 20),
                )),
              ),
            ),
          ),
        );
      }
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.pop(Get.context!);
      });
    };
  }

  List<String> _getAnswerList(List<dynamic> quizList) {
    List<String> answers = [];
    for (var quiz in quizList) {
      answers.add(quiz['answer']);
    }
    return answers;
  }
}
