import 'package:flutter/material.dart';

class FadeInRight extends StatelessWidget {
  FadeInRight({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Positioned(
                top: 0,
                right: animation.value,
                child: child,
              );
          },
          child: child
      );
  }
}



