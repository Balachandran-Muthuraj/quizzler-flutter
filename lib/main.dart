import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/Quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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
                  CreateIcons(true);


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
                  CreateIcons(false);


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


  void CreateIcons(bool Pressedstate)
  {
    setState(() {
    bool Correctanswer=quizbrain.GetAnswerforQuestion();

    if(Pressedstate==Correctanswer)
      {
        ScoreKeeper.add(Icon(
          Icons.check,color: Colors.green,
        ));
      }
    else{
      ScoreKeeper.add(Icon(
          Icons.close,color: Colors.red,
      ));
    }
    if(quizbrain.IsQuestionsExist())
    {
      Alert(
          context: context,
          title: "Quizz Apps",
          desc: "Thanks for your Answer.")
          .show();
      ScoreKeeper.clear();
      quizbrain.ResetQuestions();
    }
    else{
    quizbrain.GetNextQuestion();}
    });
}

}
