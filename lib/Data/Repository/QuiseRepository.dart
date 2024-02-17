import 'package:flutter_practical_4/Data/Models/Question.dart';

import '../../Utils/JSONReader.dart';

final class QuizRepository {
  static final shared = QuizRepository();

  Future<Quiz> getQuiz() async {
    final data = await readJson('assets/quiz.json');
    return Quiz.fromJson(data);
  }
}
