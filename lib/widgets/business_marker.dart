import 'package:flutter/material.dart';
import 'dart:math';

class BusinessMarker extends StatelessWidget {
  final AnimationController controller;
  final Color color;
  final VoidCallback onLongPress;

  const BusinessMarker({
    Key? key,
    required this.controller,
    required this.color,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  color.withOpacity(0.9),
                  color.withOpacity(0.3),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3 + controller.value * 0.4),
                  blurRadius: 20 + controller.value * 10,
                  spreadRadius: 5 + controller.value * 5,
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(Icons.store, color: Colors.white, size: 30),
                ...List.generate(4, (i) {
                  final angle = (i * 90 + controller.value * 360) * pi / 180;
                  return Transform.translate(
                    offset: Offset(
                      cos(angle) * (20 + controller.value * 5),
                      sin(angle) * (20 + controller.value * 5),
                    ),
                    child: Icon(
                      Icons.star,
                      color: Colors.white.withOpacity(0.8),
                      size: 8,
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
