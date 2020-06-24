import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/Quizbrain.dart';
import 'Questions.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  Quizbrain quizbrain=new Quizbrain();
  List<Icon> ScoreKeeper=[];


  bool boolAnswer=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                  child: Text(
                    quizbrain. GetquestionText(),
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.green,
                child: Text(
                  'Yes',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    bool Correctanswer=quizbrain.GetAnswerforQuestion();
                    ScoreKeeper.add(CreateIcons(true, Correctanswer));
quizbrain.GetNextQuestion();
                   // print(Questionnumber);

                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    bool Correctanswer=quizbrain.GetAnswerforQuestion();
                    ScoreKeeper.add(CreateIcons(false, Correctanswer));
                    quizbrain.GetNextQuestion();
                    //print(Questionnumber);

                  });
                },
              ),
            ),
          ),
          Row(

            children: ScoreKeeper,
          )
        ],
      ),
    );
  }


  Icon CreateIcons(bool Pressedstate, bool Correct)
  {
    if(Pressedstate==Correct)
      {
        return Icon(
          Icons.check,color: Colors.green,
        );
      }
    else{
      return Icon(
          Icons.close,color: Colors.red,
      );
    }
  }

}
