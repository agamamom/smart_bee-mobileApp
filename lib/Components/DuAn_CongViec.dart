import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class DuAn_CongViec extends StatefulWidget {
  const DuAn_CongViec({super.key});

  @override
  State<DuAn_CongViec> createState() => _DuAn_CongViecState();
}

class _DuAn_CongViecState extends State<DuAn_CongViec> {
  Map<String, double> dataMapTyLeDongGop = {
    "P.HCTH": 5,
    "P.Kinh doanh": 3,
    "P.Triển khai": 1,
    "P.DEV": 2,
  };
  final colorListTyLeDongGop = <Color>[
    Color.fromRGBO(0, 59, 70, 1),
    Color.fromRGBO(102, 165, 173, 1),
    Color.fromRGBO(196, 223, 230, 1),
    Color.fromRGBO(7, 87, 91, 1),
  ];
  Map<String, double> dataMapTinhTrang = {
    "Hoàn thành": 5,
    "Đang thực hiện": 2,
    "Sắp trễ hạn": 1,
    "Trễ hạn": 3,
  };
  final colorListTinhTrang = <Color>[
    Color.fromRGBO(11, 67, 171, 1),
    Color.fromRGBO(156, 191, 255, 1),
    Color.fromRGBO(214, 7, 7, 1),
    Color.fromRGBO(250, 129, 47, 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
          child: Column(
        children: [
          Text(
            "Công việc",
            style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(99, 99, 100, 1)),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Tỷ lệ đóng góp",
                  style: TextStyle(
                      color: Color.fromRGBO(99, 99, 100, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            child: PieChart(
              dataMap: dataMapTinhTrang,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 1.2,
              colorList: colorListTinhTrang,
              initialAngleInDegree: 0,
              chartType: ChartType.disc,
              totalValue: 11,
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValuesInPercentage: true,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Tình trạng",
                  style: TextStyle(
                      color: Color.fromRGBO(99, 99, 100, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            child: PieChart(
              dataMap: dataMapTyLeDongGop,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 1.2,
              colorList: colorListTyLeDongGop,
              initialAngleInDegree: 0,
              chartType: ChartType.disc,
              totalValue: 11,
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValuesInPercentage: true,
              ),
            ),
          )
        ],
      )),
    );
  }
}
