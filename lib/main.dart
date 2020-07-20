//dart has a main function that gets called automatically
import 'package:flutter/material.dart';

import './question.dart';

void main() {
  runApp(MyApp()); //runs our app , it is predefined.
}

//All widgets are classes , so we use () while calling them.
//we need to creaate classes to see widgets
//Scaffold is a widget , it is helpful in customizing.
class MyApp extends StatefulWidget {
  //this is the basic startup
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });

    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favourite color ? ',
      'What\'s your favourite animal ? ',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(questions.elementAt(questionIndex)),
            RaisedButton(
                child: Text('Answer 1'),
                onPressed:
                    answerQuestion), //here we don't use () to answer question because , it is given as a pointer.
            RaisedButton(child: Text('Answer 2'), onPressed: answerQuestion),
            RaisedButton(
                child: Text('Answer 3'),
                onPressed: () => print(
                    'Answer 3 chosen')), //This is another way of writing an anonymous function.
            RaisedButton(
                child: Text('Answer 4'),
                onPressed: () {
                  print('Answer 4 chosen');
                }), //This is again another method.
          ],
        ),
      ),
    );
  }
}

//it is a good practice to have only one widget per file.
