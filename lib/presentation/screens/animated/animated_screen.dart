import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static String name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  double radius = 10.0;
  Color color = Colors.amber;
  int duration = 300;

  void changeShape(Size size) {
    final random = Random();
    width = random.nextInt(size.width.toInt()).toDouble();
    height = random.nextInt(size.height.toInt()).toDouble();
    radius = random.nextInt(100).toDouble();
    duration = random.nextInt(1000);

    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1.0,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: duration),
          curve: Curves.easeInCirc,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: color,
          ),
          width: width + 10,
          height: height + 10,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changeShape(size),
        child: const Icon(Icons.play_circle_fill_rounded),
      ),
    );
  }
}
