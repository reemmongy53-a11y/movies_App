import 'package:flutter/material.dart';


class linearGradient extends StatelessWidget {
  final Color startColor;
  final Color endColor;
  final Color primaryColor;
  final double primaryOpacity;
  final double startOpacity;
  final double endOpacity;
  final Alignment begin;
  final Alignment end;


  linearGradient({
    super.key,
    required this.startColor,
    required this.endColor,
    this.primaryColor=Colors.white,
    this.primaryOpacity=0.0,
    required this.startOpacity ,
    required this.endOpacity,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            colors: [
              primaryColor.withOpacity(primaryOpacity),
              startColor.withOpacity(startOpacity),
              endColor.withOpacity(endOpacity),
            ],
          ),
        ),
      ),
    );
  }
}