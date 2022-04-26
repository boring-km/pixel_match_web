import 'dart:math';

int randomNumberFrom(List list) {
  final size = list.length;
  return Random().nextInt(size);
}