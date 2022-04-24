import 'dart:typed_data';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:image/image.dart' as lib;
import 'package:pixel_match_web/ui/colors.dart';

class ImageUseCase {

  static Future<lib.Image> getImageFrom() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    Uint8List fileBytes = result?.files.first.bytes ?? Uint8List(0);
    List<int> values = fileBytes.buffer.asUint8List();
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