import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:image/image.dart' as lib;
import 'package:pixel_match_web/data/image_api.dart';
import 'package:pixel_match_web/domain/model/pixel_state.dart';
import 'package:pixel_match_web/ui/colors.dart';

class ImageUseCase {

  final ImageApi _imageApi;
  ImageUseCase(this._imageApi);

  Future<lib.Image> getImageFrom() async {
    return _imageApi.getImageFrom();
  }

  PixelState getPixelInfo(lib.Image image, int width, int selectedPixel) {
    return PixelState(
      width: selectedPixel,
      height: _getHeight(image, selectedPixel),
      colors: _getPixelColors(image, selectedPixel),
    );
  }

  List<Color> _getPixelColors(lib.Image image, int pixel) {
    var width = image.width;
    var pixelHeight = _getHeight(image, pixel);

    final List<Color> colors = <Color>[];
    final chunk = width ~/ (pixel + 1);

    for (int y = 0; y < pixelHeight; y++) {
      for (int x = 0; x < pixel; x++) {
        int p = image.getPixel(x * chunk, y * chunk);
        colors.add(abgrToColor(p));
      }
    }
    return colors;
  }

  int _getHeight(lib.Image image, int pixel) {
    return (pixel * (image.height / image.width)).toInt();
  }
}
