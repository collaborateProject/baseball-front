import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class OddPieChart extends StatelessWidget {
  Map<String, double> dataMap = {"승리": 7, "패배": 2, "무승부": 1};
  List<Color> colorList = [
    Color(0xffDDE8EA),
    Color(0xffB3C8CF),
    Color(0xff6D8B91)
  ];
  OddPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: PieChart(
      colorList: colorList,
      dataMap: dataMap,
      chartRadius: MediaQuery.of(context).size.width / 1.7,
      chartValuesOptions:
          const ChartValuesOptions(showChartValuesInPercentage: true),
    ));
  }
}
