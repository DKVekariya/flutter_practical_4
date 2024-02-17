class Quiz {
  List<Question> questions;

  Quiz({required this.questions});

  Quiz.fromJson(Map<String, dynamic> json)
      : questions = List<Question>.from(
            json['questions'].map((x) => Question.fromJson(x)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['questions'] = questions.map((v) => v.toJson()).toList();
    return data;
  }
}

class Question {
  String question;
  Options options;

  Question({required this.question, required this.options});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      options: Options.fromJson(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['options'] = options.toJson();
    return data;
  }

  List<String> optionList() {
    return [options.a, options.b, options.c, options.d];
  }
}

class Options {
  String a;
  String b;
  String c;
  String d;

  Options({required this.a, required this.b, required this.c, required this.d});

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      a: json['a'],
      b: json['b'],
      c: json['c'],
      d: json['d'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['a'] = a;
    data['b'] = b;
    data['c'] = c;
    data['d'] = d;
    return data;
  }
}
