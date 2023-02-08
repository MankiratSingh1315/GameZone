import 'dart:ui';
import 'package:course_management/flip%20the%20coin.dart';
import 'package:course_management/rollthedice.dart';
import 'package:flutter/material.dart';
import 'package:course_management/tictactoe.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 25),
              Text(
                "Game Zone",
                style: TextStyle(
                    fontFamily: 'mont',
                    fontSize: 60,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                height: 50,
                child: Text(
                    'Made by Mankirat Singh\nRoll No. : 102203620\nBranch : COE'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Which Game would you like to play?',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 60),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RollTheDice()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Image(image: AssetImage('assets/images/dice.jpg')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RollTheDice()),
                  );
                },
                child: Text(
                  "Roll the dice",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TicTacToe()),
                  );
                },
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Image(
                        image: AssetImage('assets/images/tictactoe.jpg'))),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TicTacToe()),
                  );
                },
                child: Text(
                  'Tic-Tac-Toe',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FlipTheCoin()),
                      );
                    },
                    child: Image(
                        image: AssetImage('assets/images/flip the coin.jpg'))),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FlipTheCoin()),
                    );
                  },
                  child: Text('Flip the coin', style: TextStyle(fontSize: 20))),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
