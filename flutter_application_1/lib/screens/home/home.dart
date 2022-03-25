import 'package:flutter/material.dart';
import 'package:conditional_questions/conditional_questions.dart';
//import 'package:sklite/utils/io.dart';
import 'dart:convert';
import 'package:flutter_application_1/services/auth.dart';
import 'questions.dart';

var lst=[];


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Questionnarie'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //SVC svc;
  _HomePageState() {}
  final AuthService _auth = AuthService();

  final _key = GlobalKey<QuestionFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],

      ),
      body: ConditionalQuestions(
        key: _key,
        children: questions(),
        trailing: [
          MaterialButton(
            color: Colors.blueAccent,
            splashColor: Colors.orangeAccent,
            onPressed: (){
              //print("hello");
              lst.add(_key.currentState?.widget);
              print(lst);
               // learnDemo();
            },
            child: Text("Submit"),
          )
        ],
      ),
    );
  }
  // learnDemo() async{
  //   List<List<int>> X = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];
  //   print("Naive Bayes");
  //   //print(svc.predict(X));
  // }
}