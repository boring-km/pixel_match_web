import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:image/image.dart' as lib;
import 'package:pixel_match_web/core/logger.dart';
import 'package:pixel_match_web/ui/colors.dart';
import 'package:http/http.dart' as http;

class ImageUseCase {

  static Future<lib.Image> getImageFrom() async {
    final response = await http.get(Uri.parse('https://cache.wjthinkbig.com/TEST/WEBP/sample.WEBP'));
    if (response.statusCode == 200) {
      Log.d('정상');
    } else {
      Log.e('error: ${response.statusCode}');
    }
    List<int> values = response.bodyBytes.buffer.asUint8List();
    final lib.Image image = lib.decodeImage(values)!;
    return image;
  }

  static List<Color> getPixelColors(lib.Image image, int pixel) {
    var width = image.width;
    var pixelHeight = getHeight(image, pixel);

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

  static int getHeight(lib.Image image, int pixel) {
    return (pixel * (image.height / image.width)).toInt();
  }

}