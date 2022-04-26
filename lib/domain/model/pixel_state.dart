import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pixel_state.freezed.dart';

@freezed
class PixelState with _$PixelState {
  const factory PixelState({
    required int width,
    required int height,
    required List<Color> colors,
  }) = _PixelState;

}
