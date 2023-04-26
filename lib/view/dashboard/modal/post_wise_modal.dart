import 'package:flutter/material.dart';

class ChartData {
  ChartData(this.mobile, this.sale, [this.color]);

  final String mobile;
  final double sale;
  final Color?color;
}

class ChartDataInfo {
  ChartDataInfo(this.year, this.value, [this.color]);

  final String year;
  final double value;
  final Color?color;
}

final List<ChartData> chartData = [
  ChartData('iPhone', 38, Color.fromRGBO(147, 0, 119, 1)),
  ChartData('MI', 52, Color.fromARGB(255, 223, 215, 67)),
  ChartData('Redmi', 12, Color.fromARGB(255, 7, 170, 118)),
];

final List<ChartDataInfo> indexChart = [
  ChartDataInfo('Sun', 25.5, Color.fromRGBO(9, 0, 136, 1)),
  ChartDataInfo('Mon', 38, Color.fromRGBO(147, 0, 119, 1)),
  ChartDataInfo('Tue', 34, Color.fromRGBO(228, 0, 124, 1)),
  ChartDataInfo('Wed', 52, Color.fromARGB(255, 59, 19, 41)),
  ChartDataInfo('Fri', 52, Color.fromARGB(255, 223, 215, 67)),
  ChartDataInfo('Sat', 12, Color.fromARGB(255, 7, 170, 118)),
];

