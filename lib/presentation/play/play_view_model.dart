import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as lib;
import 'package:pixel_match_web/data/get_divisors.dart';
import 'package:pixel_match_web/data/image_use_case.dart';

class PlayViewModel extends GetxController {
  List<Color> colors = <Color>[];
  List<int> _pixelWidthList = <int>[];

  int pixelWidth = 1;
  int pixelHeight = 1;
  int _pixelIndex = 2;

  late Future<lib.Image> image;


  start() async {
    image = ImageUseCase.getImageFrom();
    pixelWidth = _initializeWidth(await image);
    showPixels(pixelWidth);
  }

  int _initializeWidth(lib.Image image) {
    int imageWidth = image.width;
    _pixelWidthList = GetDivisors.by(imageWidth);
    return _pixelWidthList[_pixelIndex] + 1;
  }

  showPixels(int selectedPixel) async {
    pixelWidth = selectedPixel - 1;
    colors = ImageUseCase.getPixelColors(await image, pixelWidth);
    pixelHeight = ImageUseCase.getHeight(await image, pixelWidth);
    Future.delayed(const Duration(milliseconds: 300), () => update());
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
}