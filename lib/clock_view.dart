import 'dart:async';
import 'dart:math';

import 'package:alarm/widgets/clockpointer.dart';
import 'package:flutter/material.dart';

class Clockview extends StatefulWidget {
  Clockview({super.key, required this.size});

  double size;

  @override
  State<Clockview> createState() => _ClockviewState();
}

class _ClockviewState extends State<Clockview> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}
