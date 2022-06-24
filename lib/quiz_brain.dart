import 'package:quiz_app/quiz.dart';

class QuizBrain {
  int _index = 0;

  List<Quiz> questionsAnwers = <Quiz>[
    Quiz(question: 'There are five different blood groups.', answer: false),
    Quiz(question: 'Fish can not blink.', answer: true),
    Quiz(
        question: ' "A" is the most common letter used inthe English language.',
        answer: false),
    Quiz(
        question: 'Kyrgyzstan is the smallest country in Central Asia',
        answer: false),
    Quiz(
        question: 'The human eye can distinguish 10 milllion different color',
        answer: true),
  ];
  String getQuestions() {
    if (_index < questionsAnwers.length) {
      return questionsAnwers[_index].question;
    } else {
      return 'Suroolor buttu';
    }
  }

  bool getAnswer() {
    if (_index < questionsAnwers.length) {
      return questionsAnwers[_index].answer;
    }
  }

  void getNext() {
    _index++;
  }

  void restart() {
    _index = 0;
  }
}

final QuizBrain quizBrain = QuizBrain();
