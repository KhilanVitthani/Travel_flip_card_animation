import 'dart:math';
import 'package:flutter/material.dart';
import 'cover_screen.dart';
import 'image_screen.dart';

class AnimatedScreen extends StatefulWidget {
  final AnimationController controller;

  AnimatedScreen({required this.controller});

  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  late Animation _animation;
  Widget visibleScreen = Container();

  Widget getScreen() {
    if (_animation.value < 0.5) {
      visibleScreen = CoverScreen(
        tripTitle: 'City Break',
        tripPrice: 'From 29€',
      );
    } else {
      visibleScreen = ImageScreen();
    }
    return visibleScreen;
  }

  @override
  void initState() {
    _animation = Tween(begin: 0.0, end: 1.0).animate(widget.controller)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationY(pi * _animation.value),
      child: getScreen(),
    );
  }
}
