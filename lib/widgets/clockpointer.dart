import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  var datetime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerx = size.width / 2;
    var centery = size.height / 2;
    var center = Offset(centerx, centery);
    var radius = min(centerx, centery);

    var fill = Paint()..color = Color(0xFF444974);
    var outline = Paint()
      ..color = Color(0xFFEAECFF)
      ..strokeWidth = size.width / 20
      ..style = PaintingStyle.stroke;

    var second = Paint()
      ..color = Colors.orange
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60
      ..style = PaintingStyle.stroke;

    var mints = Paint()
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = size.width / 30
      ..style = PaintingStyle.stroke;

    var houre = Paint()
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(colors: [Colors.green, Colors.black])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = size.width / 19
      ..style = PaintingStyle.stroke;

    var dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    var centerdot = Paint()..color = Color(0xFFEAECFF);

    canvas.drawCircle(center, radius * 0.75, fill);
    canvas.drawCircle(center, radius * 0.75, outline);

    var horx = centerx +
        radius *
            0.4 *
            cos((datetime.hour * 30 + datetime.minute * 0.5) * pi / 180);
    var hory = centerx +
        radius *
            0.4 *
            sin((datetime.hour * 30 + datetime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(horx, hory), houre);

    var minx = centerx + radius * 0.6 * cos(datetime.minute * 6 * pi / 180);
    var miny = centerx + radius * 0.6 * sin(datetime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minx, miny), mints);

    var secx = centerx + radius * 0.6 * cos(datetime.second * 6 * pi / 180);
    var secy = centerx + radius * 0.6 * sin(datetime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secx, secy), second);

    canvas.drawCircle(center, radius * 0.1, centerdot);

    var dotcirout = radius;
    var dotcirin = radius * 0.9;

    for (double i = 0; i < 360; i += 12) {
      var x1 = centerx + dotcirout * cos(i * pi / 180);
      var y1 = centerx + dotcirout * sin(i * pi / 180);

      var x2 = centerx + dotcirin * cos(i * pi / 180);
      var y2 = centerx + dotcirin * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
