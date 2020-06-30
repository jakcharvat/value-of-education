import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LiteracyIncomeChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double maxX = 0;
    double maxY = 0;

    final data = (JsonDecoder().convert(_data) as Map).values.toList();
    for (var val in data) {
      final x = val['literacy'];
      final y = val['gdp'];

      if (maxX < x) maxX = x;
      if (maxY < y) maxY = y;
    }

    final spots = data.map((val) {
      final x = val['literacy'];
      final y = val['gdp'];

      return ScatterSpot(maxX - x, y,
          radius: 10.0,
          color: ColorTween(begin: Color(0xffff5182), end: Color(0xff35ab7a))
              .lerp(x / (maxX + 50)).withOpacity(0.6));
    }).toList();

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      color: Colors.grey.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Literacy vs GDP Per Capita',
              style: TextStyle(
                color: _textColor(context),
                fontSize: 22,
                fontFamily: 'Raleway',
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'GDP Per Capita (PPP)',
                    style: TextStyle(
                      color: _textColor(context),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: 'Raleway',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Arrow(MediaQuery.of(context).size.height / 1.5 - 80),
                SizedBox(width: 20),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height / 1.5),
                  child: ScatterChart(
                    ScatterChartData(
                      scatterSpots: spots,
                      minX: 0,
                      maxX: maxX - 30,
                      minY: 0,
                      maxY: maxY,
                      borderData: FlBorderData(
                        show: false,
                      ),
                      gridData: const FlGridData(
                        show: false,
                      ),
                      titlesData: FlTitlesData(
                        show: false,
                      ),
                      scatterTouchData: const ScatterTouchData(
                        enabled: false,
                      ),
                    ),
                    swapAnimationDuration: Duration(milliseconds: 600),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            RotatedBox(
              quarterTurns: -1,
              child: Arrow(MediaQuery.of(context).size.height / 1.5 - 80),
            ),
            SizedBox(height: 10.0),
            Text(
              'Literacy Rate',
              style: TextStyle(
                color: _textColor(context),
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Raleway',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _textColor(context) {
    if (Theme.of(context).brightness == Brightness.light) return Color(0xff7589a2);

    return Color(0xff97abc4);
  }
}

String _data =
    '{"Brazil":{"literacy":93.0,"gdp":15553},"Spain":{"literacy":98.0,"income":38761.1845695886,"gdp":39037},"Algeria":{"literacy":81.0,"gdp":15293},"Malta":{"literacy":94.0,"gdp":40797},"Serbia":{"literacy":98.0,"gdp":15432},"Côte d\'Ivoire":{"literacy":47.0,"gdp":3945},"Jordan":{"literacy":98.0,"gdp":9173},"Bangladesh":{"literacy":73.0,"gdp":3877},"Rwanda":{"literacy":73.0,"gdp":2043},"Vanuatu":{"literacy":87.0,"gdp":3215},"Indonesia":{"literacy":95.0,"gdp":12310},"Portugal":{"literacy":96.0,"income":25487.063695971,"gdp":32554},"Italy":{"literacy":99.0,"income":37751.9346359886,"gdp":40924},"Nepal":{"literacy":67.0,"gdp":2702},"Madagascar":{"literacy":74.0,"gdp":1558},"Burkina Faso":{"literacy":41.0,"gdp":1866},"Tonga":{"literacy":99.0,"gdp":5969},"Seychelles":{"literacy":95.0,"gdp":29328},"Kuwait":{"literacy":96.0,"gdp":72096},"Suriname":{"literacy":94.0,"gdp":15191},"Romania":{"literacy":98.0,"gdp":26660},"Uruguay":{"literacy":98.0,"gdp":22610},"Montenegro":{"literacy":98.0,"gdp":19355},"Cameroon":{"literacy":77.0,"gdp":3722},"Paraguay":{"literacy":94.0,"gdp":13109},"Costa Rica":{"literacy":97.0,"gdp":17110},"Mexico":{"literacy":95.0,"income":16297.708306066,"gdp":18656},"Namibia":{"literacy":91.0,"gdp":10471},"Comoros":{"literacy":58.0,"gdp":2751},"Central African Republic":{"literacy":37.0,"gdp":727},"India":{"literacy":74.0,"gdp":7166},"Albania":{"literacy":98.0,"gdp":12943},"Mali":{"literacy":35.0,"gdp":2218},"Morocco":{"literacy":73.0,"gdp":8225},"Iraq":{"literacy":50.0,"gdp":16935},"Panama":{"literacy":95.0,"gdp":24521},"Benin":{"literacy":42.0,"gdp":2276},"Kyrgyzstan":{"literacy":99.0,"gdp":3735},"Bahrain":{"literacy":97.0,"gdp":47708},"Aruba":{"literacy":97.0,"gdp":39493},"Honduras":{"literacy":87.0,"gdp":4997},"China":{"literacy":96.0,"gdp":16842},"Kenya":{"literacy":81.0,"gdp":3292},"Oman":{"literacy":95.0,"gdp":41331},"Singapore":{"literacy":97.0,"gdp":94105},"Mongolia":{"literacy":98.0,"gdp":12946},"Peru":{"literacy":94.0,"gdp":13463},"Zambia":{"literacy":86.0,"gdp":4033},"Argentina":{"literacy":99.0,"gdp":20829},"Sudan":{"literacy":60.0,"gdp":4914},"Samoa":{"literacy":99.0,"gdp":6641},"Eswatini":{"literacy":88.0,"gdp":8659},"Timor-Leste":{"literacy":68.0,"gdp":7228},"Nigeria":{"literacy":62.0,"gdp":5887},"Mauritius":{"literacy":91.0,"gdp":22356},"Uganda":{"literacy":76.0,"gdp":1868},"Afghanistan":{"literacy":43.0,"gdp":1976},"Gabon":{"literacy":84.0,"gdp":18113},"Colombia":{"literacy":95.0,"gdp":14503},"Sierra Leone":{"literacy":43.0,"gdp":1530},"Ghana":{"literacy":79.0,"gdp":4502},"Belarus":{"literacy":99.0,"gdp":18896},"Congo":{"literacy":80.0,"gdp":5454},"Lebanon":{"literacy":95.0,"gdp":14513},"San Marino":{"literacy":99.0,"gdp":63549}}';

class Arrow extends StatelessWidget {
  Arrow(this.height);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.0,
      height: height,
      child: CustomPaint(
        painter: Triangle(color: _textColor(context)),
      ),
    );
  }

  Color _textColor(context) {
    if (Theme.of(context).brightness == Brightness.light) return Color(0xff7589a2);

    return Color(0xff97abc4);
  }
}

class Triangle extends CustomPainter {
  Triangle({
    this.color = const Color(0xff7589a2),
  });

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();

    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
