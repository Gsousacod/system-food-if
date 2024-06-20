import 'package:flutter/material.dart';

class WeeklyChart extends StatelessWidget {
  final List<double> data = [15, 20, 25, 30, 35, 40, 45];
  final List<String> daysOfWeek = [
    'Seg',
    'Ter',
    'Qua',
    'Qui',
    'Sex',
    'Sáb',
    'Dom'
  ];

  WeeklyChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: CustomPaint(
        painter: LineChartPainter(data: data, daysOfWeek: daysOfWeek),
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  final List<double> data;
  final List<String> daysOfWeek;
  final double lineWidth = 4.0;
  final double pointRadius = 6.0;
  final double padding = 16.0;
  final double labelPadding = 16.0;

  LineChartPainter({required this.data, required this.daysOfWeek});

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round;

    Paint pointPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    double minX = padding;
    double maxX = size.width - padding;
    double minY = padding;
    double maxY = size.height - padding - labelPadding;

    // Desenha a linha do gráfico
    for (int i = 0; i < data.length - 1; i++) {
      double x1 = minX + (maxX - minX) * (i / (data.length - 1));
      double y1 = maxY - (maxY - minY) * (data[i] / getMaxData());
      double x2 = minX + (maxX - minX) * ((i + 1) / (data.length - 1));
      double y2 = maxY - (maxY - minY) * (data[i + 1] / getMaxData());

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), linePaint);

      // Desenha os pontos no gráfico
      canvas.drawCircle(Offset(x1, y1), pointRadius, pointPaint);
    }

    // Desenha as legendas no eixo X
    for (int i = 0; i < daysOfWeek.length; i++) {
      double x = minX + (maxX - minX) * (i / (daysOfWeek.length - 1));
      TextSpan span = TextSpan(
        text: daysOfWeek[i],
        style: const TextStyle(color: Colors.black, fontSize: 12.0),
      );
      TextPainter tp = TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, Offset(x - tp.width / 2, maxY + labelPadding / 2));
    }
  }

  double getMaxData() {
    return data.reduce((curr, next) => curr > next ? curr : next);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
