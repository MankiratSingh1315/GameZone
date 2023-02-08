import 'dart:math';

import 'package:flutter/material.dart';

class RollTheDice extends StatefulWidget {
  const RollTheDice({super.key});

  @override
  State<RollTheDice> createState() => _RollTheDiceState();
}

class _RollTheDiceState extends State<RollTheDice>
    with SingleTickerProviderStateMixin {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  late AnimationController _controller;
  late CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  animate() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    _controller.addListener(() {
      setState(() {});
      print(_controller.value);
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          leftDiceNumber = Random().nextInt(6) + 1;
          rightDiceNumber = Random().nextInt(6) + 1;
        });
        print('completed');
        _controller.reverse();
      }
    });
  }

  void roll() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roll the Dice'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              child: Text(
                  'Made by Mankirat Singh\nRoll No. : 102203620\nBranch : COE'),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Image(
                      height: 200 - animation.value * 200,
                      image:
                          AssetImage('assets/images/dice$leftDiceNumber.png')),
                )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Image(
                      height: 200 - animation.value * 200,
                      image:
                          AssetImage('assets/images/dice$rightDiceNumber.png')),
                ))
              ],
            ),
            Spacer(),
            ElevatedButton(onPressed: roll, child: const Text('Roll'))
          ],
        ),
      ),
    );
  }
}
