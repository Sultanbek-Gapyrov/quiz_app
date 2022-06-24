import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_brain.dart';
import 'package:quiz_app/widgets/new_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon correctIcon = const Icon(
    Icons.check,
    color: Colors.green,
    size: 45,
  );
  Icon incorrectIcon = const Icon(Icons.close, color: Colors.red, size: 45);
  List<Icon> icons = <Icon>[];
  String suroo = '';

  @override
  void initState() {
    suroo = quizBrain.getQuestions();
    // icons.add(correctIcon);
    // icons.add(incorrectIcon);

    super.initState();
  }

  bool isFinished = false;

  void userAnswered(bool answer) {
    bool realAnswers = quizBrain.getAnswer();
    if (answer == realAnswers) {
      icons.add(correctIcon);
    } else {
      icons.add(incorrectIcon);
    }

    quizBrain.getNext();
    suroo = quizBrain.getQuestions();
    if (suroo == 'Suroolor buttu') {
      isFinished = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: Padding(
        padding: EdgeInsets.only(top: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isFinished == true)
              Center(
                child: NewButton(
                  color: Colors.blue,
                  text: "Again",
                  pressed: () {
                    quizBrain.restart();
                    isFinished = false;
                    quizBrain.getQuestions();
                    icons = [];
                    setState(() {});
                  },
                ),
              )
            else
              Column(
                children: [
                  Center(
                    child: Text(
                      suroo = quizBrain.getQuestions(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  NewButton(
                    text: "True",
                    color: Colors.green,
                    pressed: () {
                      userAnswered(true);
                      // icons.add(correctIcon);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NewButton(
                    text: 'False',
                    color: Colors.red,
                    pressed: () {
                      userAnswered(false);
                      // icons.add(incorrectIcon);
                    },
                  ),
                ],
              ),
            SizedBox(
              height: 40,
            ),

            Wrap(spacing: 5, children: icons),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }
}
