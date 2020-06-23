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
                'This is where the question text will go.',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: FlatButton(
                  color: Colors.green,
                  child: Text('Yes',style: TextStyle(fontSize: 20,color:Colors.white),),onPressed: (){
                    print('Press Yes');
                },
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: FlatButton(
                  color: Colors.red,
                  child: Text('False',style: TextStyle(  fontSize: 20.0,
                    color: Colors.white,),),onPressed: (){
                  print('Press False');
                },
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
