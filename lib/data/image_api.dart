import 'package:http/http.dart';
import 'package:image/image.dart' as lib;
import 'package:pixel_match_web/core/logger.dart';

class ImageApi {

  Future<lib.Image> getImageFrom(String url) async {
    final response = await get(Uri.parse(url));
    if (response.statusCode != 200) {
      Log.e('error: ${response.statusCode}');
    }

    List<int> values = response.bodyBytes.buffer.asUint8List();
    return lib.decodeImage(values)!;
  }
}