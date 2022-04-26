import 'dart:convert';

import 'package:http/http.dart';

class QuizApi {

  static Future<List> getQuizData() async {
    final response = await get(Uri.parse('https://cache.wjthinkbig.com/TEST/WEBP/QUIZ.JSON'));
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes))['quizList'];
    }
    return [];
  }

}