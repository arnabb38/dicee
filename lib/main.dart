//ArnabBasak//SoftwareDeveloper//16Jul2020//linkedin.com/in/arnab-basak

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';

var leftDiceNumber = 1;
var rightDiceNumber = 1;
int player1 = 0, player2 = 0, count1 = 0, count2 = 0;

void main() {
  runApp(MyApp());
}

void reset() {
  leftDiceNumber = 1;
  rightDiceNumber = 1;
  player1 = player2 = count1 = count2 = 0;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'D I C E E',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.purple, Colors.blue],
              ),
            ),
          ),
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              // color: Colors.teal.shade100,
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  leading: Icon(
                    Icons.face,
                    // color: Colors.teal.shade900,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  title: Text(
                    'Player 1 \nTap: $count1',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,

                      // color: Colors.teal.shade900,
                    ),
                  ),
                  subtitle: Text(
                    'Score: $player1',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,

                      // color: Colors.teal.shade900,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        count1++;
                        leftDiceNumber = Random().nextInt(6) + 1;
                        player1 += leftDiceNumber;
                      });
                    },
                    child: Image.asset('images/dice$leftDiceNumber.png'),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        count2++;
                        rightDiceNumber = Random().nextInt(6) + 1;
                        player2 += rightDiceNumber;
                      });
                    },
                    child: Image.asset('images/dice$rightDiceNumber.png'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Card(
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  leading: Icon(
                    Icons.face,
                    // color: Colors.teal.shade900,
                    color: Colors.white,

                    size: 40.0,
                  ),
                  title: Text(
                    'Player 2',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      // color: Colors.teal.shade900,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    'Tap: $count2 \nScore: $player2',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      // color: Colors.teal.shade900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.refresh),
                    iconSize: 40.0,
                    color: Colors.white,
                    hoverColor: Colors.red,
                    onPressed: () {
                      setState(() {
                        reset();
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
