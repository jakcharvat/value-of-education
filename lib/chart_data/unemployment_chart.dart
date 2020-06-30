import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class UnemploymentChart extends StatelessWidget {
  UnemploymentChart(this.offset, this.animHeight);

  final double offset;
  final double animHeight;
  
  final Color leftBarColor = const Color(0xff35ab7a);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 14;

  @override
  Widget build(BuildContext context) {
    final barGroup1 = makeGroupData(
      0,
      max(0, min(1, offset / animHeight)) * 8.929337239999997,
      max(0, min(1, offset / animHeight)) * 10.13362865526316,
    );
    final barGroup2 = makeGroupData(
      1,
      max(0, min(1, offset / animHeight)) * 5.295440840000001,
      max(0, min(1, offset / animHeight)) * 6.300807710526317,
    );
    final barGroup3 = makeGroupData(
      2,
      max(0, min(1, offset / animHeight)) * 3.3298283951219516,
      max(0, min(1, offset / animHeight)) * 4.055383997435897,
    );

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
    ];

    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: Colors.grey.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FittedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Unemployment rates by education level',
                      style: TextStyle(
                        color: _textColor(context),
                        fontSize: 22,
                        fontFamily: 'Raleway',
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '2008 vs 2018',
                      style: TextStyle(
                        color: _textColor(context),
                        fontSize: 16,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 11,
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.grey,
                          getTooltipItem: (_a, _b, _c, _d) => null,
                        ),
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          showTitles: true,
                          textStyle: TextStyle(
                            color: _textColor(context),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Raleway',
                          ),
                          margin: 20,
                          getTitles: (double value) {
                            switch (value.toInt()) {
                              case 0:
                                return 'Below\nSecondary';
                              case 1:
                                return 'Secondary';
                              case 2:
                                return 'Tertiary';
                              default:
                                return '';
                            }
                          },
                        ),
                        leftTitles: SideTitles(
                          showTitles: true,
                          textStyle: TextStyle(
                            color: _textColor(context),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Raleway',
                          ),
                          margin: 16,
                          reservedSize: 14,
                          getTitles: (value) {
                            if (value % 2 == 1) {
                              return '';
                            } else {
                              return '$value%';
                            }
                          },
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: items,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        color: leftBarColor,
        width: width,
        isRound: true,
      ),
      BarChartRodData(
        y: y2,
        color: rightBarColor,
        width: width,
        isRound: true,
      ),
    ]);
  }

  Color _textColor(context) {
    if (Theme.of(context).brightness == Brightness.light)
      return Color(0xff7589a2);

    return Color(0xff97abc4);
  }
}
