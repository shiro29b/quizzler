import 'package:flutter/material.dart';
import 'quizbrain.dart';

Quizbrain quizBrain = Quizbrain();


void main() {
  runApp(Quizzler());
}

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
  List<Icon> sk = [];

  void checkanswer(bool userpickedanswer){
    bool correctanswer = quizBrain.getqnans();

    setState(() {
    if(correctanswer == userpickedanswer) {
      sk.add(Icon(Icons.check,color: Colors.green,));
    }
    else{
      sk.add(Icon(Icons.close,color: Colors.red,));
    }

      quizBrain.nextqn();
    }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Expanded(
          flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(

                child: Text(quizBrain.getqntext(),textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white,fontSize: 25),
                ),
              ),
            )
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(color: Colors.red,
                onPressed: (){
                  checkanswer(true);
                },
                child: Text("True",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            )
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.green,
                onPressed: (){
                    checkanswer(false);
                  },
                child: Text("False",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            )
        ),
        Row(
          children: sk,
        ),
      ]
    );
  }
}

