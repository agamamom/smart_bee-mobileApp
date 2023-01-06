import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DuAn_TaiChinh extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  DuAn_TaiChinh({Key? key}) : super(key: key);

  @override
  State<DuAn_TaiChinh> createState() => _DuAn_TaiChinhState();
}

class _DuAn_TaiChinhState extends State<DuAn_TaiChinh> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('2020', 2, 20, 19),
      ChartData('2021', 3, 9, 7),
      ChartData('2022', 2, 10, 7),
      ChartData('Q1/22', 1, 13, 10),
      ChartData('Q2/22', 2, 25, 21),
      ChartData('Q3/22', 3, 15, 13),
      ChartData('Q4/22', 4, 7, 6),
    ];
    return SingleChildScrollView(
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Tài chính",
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(99, 99, 100, 1)),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(127, 123, 120, 120),
                        blurRadius: 1.0,
                        spreadRadius: -2,
                        offset: Offset(0, 6)),
                  ],
                ),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    palette: <Color>[
                      Color.fromARGB(255, 1, 83, 53),
                      Color.fromRGBO(0, 183, 117, 1),
                      Color.fromARGB(255, 213, 27, 3)
                    ],
                    legend:
                        Legend(isVisible: true, position: LegendPosition.top),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <CartesianSeries>[
                      StackedColumnSeries<ChartData, String>(
                          name: 'Thu khác',
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y1),
                      StackedColumnSeries<ChartData, String>(
                          name: 'Thu theo hóa đơn',
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y2),
                      LineSeries<ChartData, String>(
                          name: 'Chi phí',
                          dataSource: chartData,
                          markerSettings: MarkerSettings(isVisible: true),
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y3)
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Tháng này",
                style: TextStyle(
                    color: Color.fromRGBO(7, 98, 65, 1),
                    fontWeight: FontWeight.w700),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 41,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(127, 123, 120, 120),
                        blurRadius: 1.0,
                        spreadRadius: -2,
                        offset: Offset(0, 6)),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Thu:",
                        style: TextStyle(
                            color: Color.fromRGBO(99, 99, 100, 1),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "2.478.999.999",
                        style: TextStyle(
                            color: Color.fromRGBO(99, 99, 100, 1),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 41,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(127, 123, 120, 120),
                        blurRadius: 1.0,
                        spreadRadius: -2,
                        offset: Offset(0, 6)),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chi:",
                        style: TextStyle(
                            color: Color.fromRGBO(99, 99, 100, 1),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "2.478.999.999",
                        style: TextStyle(
                            color: Color.fromRGBO(99, 99, 100, 1),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 41,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(127, 123, 120, 120),
                        blurRadius: 1.0,
                        spreadRadius: -2,
                        offset: Offset(0, 6)),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chênh lệch:",
                        style: TextStyle(
                            color: Color.fromRGBO(7, 98, 65, 1),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "2.478.999.999",
                        style: TextStyle(
                            color: Color.fromRGBO(7, 98, 65, 1),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
    //Initialize the chart widget
  }
}

class ChartData {
  ChartData(this.x, this.y1, this.y2, this.y3);
  final String x;
  final int y1;
  final int y2;
  final int y3;
}
