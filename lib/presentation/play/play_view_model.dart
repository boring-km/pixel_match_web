import 'package:get/get.dart';
import 'package:image/image.dart' as lib;
import 'package:pixel_match_web/data/get_divisors.dart';
import 'package:pixel_match_web/data/image_use_case.dart';
import 'package:pixel_match_web/domain/model/pixel_state.dart';

class PlayViewModel extends GetxController {
  List<int> _pixelWidthList = <int>[];
  int _pixelIndex = 2;
  late lib.Image _image;

  PixelState _state = const PixelState(
    width: 1,
    height: 1,
    colors: [],
  );
  
  PixelState get state => _state;

  final ImageUseCase imageUseCase;

  PlayViewModel(this.imageUseCase);

  @override
  void onInit() {
    super.onInit();

    Future.microtask(() async {
      _image = await imageUseCase.getImageFrom();
      _state = state.copyWith(
        width: _initializeWidth()
      );
      showPixels(_state.width);
    });
  }

  int _initializeWidth() {
    int imageWidth = _image.width;
    _pixelWidthList = GetDivisors.by(imageWidth);
    return _pixelWidthList[_pixelIndex] + 1;
  }

  showPixels(int selectedPixel) async {
    _state = imageUseCase.getPixelInfo(_image, _state.width, selectedPixel - 1);
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
}
