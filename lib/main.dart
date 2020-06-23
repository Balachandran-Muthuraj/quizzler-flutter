import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  List<Widget> ScoreKeeper = [
  ];
  List<String> Questions=[
    'Is Lee Sian Long is the Singapore PM',
    'Is Narendra Modi is the India PM',
    'Is Edappadi Palanisamy is the CM of Andra',
  ];
  int Questionnumber=0;
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
                Questions[Questionnumber],
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
                   Questionnumber++;
                   print(Questionnumber);
                   ScoreKeeper.add(  Icon(
                     Icons.check,color: Colors.green,
                   ));
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
                   
                   Questionnumber++;
                   print(Questionnumber);
                   ScoreKeeper.add(  Icon(
                     Icons.close,color: Colors.red,
                   ));

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
}
