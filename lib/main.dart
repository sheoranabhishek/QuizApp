//dart has a main function that gets called automatically
import 'package:flutter/material.dart';
import './answer.dart';
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
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      //creating maps
      {
        'questionText': 'What\'s your favourite color ? ',
        'answers': ['Blue', 'Blue', 'Red', 'Green'],
      },
      {
        'questionText': 'What\'s your favourite animal ? ',
        'answers': ['Zebra', 'Elephant', 'Dog', 'Cat'],
      },
      {
        'questionText': 'Who\'s your favourite cricketer? ',
        'answers': ['Sangakara', 'MSD', 'Sehwag', 'Kohli'],
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText']),
            //mapping the maps to list in widgets
            //spread operator ... takes a list , and pull the value from the list and add to the surrounding lists.
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}

//it is a good practice to have only one widget per file.
