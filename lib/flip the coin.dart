import 'package:flutter/material.dart';
import 'dart:math';

class FlipTheCoin extends StatefulWidget {
  const FlipTheCoin({super.key});

  @override
  State<FlipTheCoin> createState() => _FlipTheCoinState();
}

class _FlipTheCoinState extends State<FlipTheCoin>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation animation;
  int ht = 0;

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
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _controller.addListener(() {
      setState(() {});
      print(_controller.value);
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          ht = Random().nextInt(2);
        });
        print('completed');
        _controller.reverse();
      }
    });
  }

  void flip() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final angle = 0 * -pi;
    final Transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateX(angle);
    return Scaffold(
      appBar: AppBar(
          title: Text('Flip the coin'),
          backgroundColor: Color.fromARGB(255, 255, 48, 7)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              child: Text(
                  'Made by Mankirat Singh\nRoll No. : 102203620\nBranch : COE'),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: Image(
                width: 200 - animation.value * 200,
                image: AssetImage('assets/images/$ht.png'),
              ),
            )),
            Align(
                alignment: AlignmentDirectional.topCenter,
                child: ElevatedButton(
                    onPressed: flip,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 48, 7)),
                    child: Text('Flip')))
          ],
        ),
      ),
    );
  }
}
