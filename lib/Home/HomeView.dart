import 'package:flutter/material.dart';
import 'package:flutter_practical_4/Data/Models/Question.dart';
import 'package:flutter_practical_4/Data/Repository/QuiseRepository.dart';
import 'package:flutter_practical_4/Styles/Styles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final QuizRepository _quizRepository = QuizRepository.shared;
  Quiz _quiz = Quiz(questions: []);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchQuiz();
  }

  void _fetchQuiz() async {
    Quiz quiz = await _quizRepository.getQuiz();
    setState(() {
      _quiz = quiz;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Home'),
        ),
        body: _quiz.questions.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : _body(_quiz));
  }

  Widget _body(Quiz quiz) {
    List<Question> questions = quiz.questions;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [...questions.map((e) => _questionView(e))],
      ),
    );
  }

  Widget _questionView(Question question) {
    List<String> options = question.optionList();
    return Column(
      children: [
        Text(question.question),
        Vspacer(height: 10),
        Column(
          children: [
            ...options.map(
              (e) => Padding(
                padding: const EdgeInsets.all(8),
                child: Text(e),
              ),
            ),
          ],
        )
      ],
    );
  }
}
