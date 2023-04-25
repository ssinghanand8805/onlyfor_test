
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../modal/post_wise_modal.dart';
class DashBoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        leadingWidth: 30,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Chart',
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
       backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Chart(),

          circularChart(),
        ],
      ),
    );
  }

  Widget circularChart() {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: SfCircularChart(
            title: ChartTitle(
                text: 'Total Reaction',
                //  borderWidth: 1,
                // Aligns the chart title to left
                alignment: ChartAlignment.center,
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                )),
            legend: Legend(
                isVisible: true,
                width: "130",
                legendItemBuilder:
                    (String name, dynamic series, dynamic point, int index) {
                  return Container(
                    width: 174,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: point.color),
                              height: 15,
                              width: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(9.0, 8, 15, 9),
                              child: Text(
                                point.x.toString(),
                                style: const TextStyle(
                                    color:  Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(9.0, 8, 15, 9),
                          child: Row(
                            children: [
                              Text(
                                point.y.toString(),
                                style: TextStyle(
                                    color:  Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "%",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                  dataSource: chartData,
                  pointColorMapper: (ChartData data, _) => data.color,
                  xValueMapper: (ChartData data, _) => data.mobile,
                  yValueMapper: (ChartData data, _) => data.sale,
                  innerRadius: '55%'),
            ],

            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                widget: Container(
                    child: const Text(
                      'Reaction',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )),
              )
            ]));
  }
  Widget Chart() {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            labelRotation: 0,
            labelIntersectAction: AxisLabelIntersectAction.multipleRows,
          ),

          title: ChartTitle(
              text: 'Post Wise OverView',
              backgroundColor: Colors.white,
              borderColor: Colors.black,
              //  borderWidth: 1,
              // Aligns the chart title to left
              alignment: ChartAlignment.center,
              textStyle: const TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontSize: 20,
              )),
          series: <ChartSeries>[
            // Renders line chart

            ColumnSeries<ChartDataInfo, String>(
              dataSource: indexChart,
              pointColorMapper: (ChartDataInfo data, _) => data.color,
              xValueMapper: (ChartDataInfo data, _) => data.year,
              yValueMapper: (ChartDataInfo data, _) => data.value,
              enableTooltip: true,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                angle: 0,
              ),
            ),
          ],
        ));
  }
}



