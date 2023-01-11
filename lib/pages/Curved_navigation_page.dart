import 'package:flutter/material.dart';
import 'package:smart_bee/icon/curved_icon2_icons.dart';
import 'package:smart_bee/icon/curved_icon4_icons.dart';
import 'package:smart_bee/icon/curved_icon5_icons.dart';
import 'package:smart_bee/icon/my_flutter_app_icons.dart';
import 'package:smart_bee/pages/CongViec.dart';
import 'package:smart_bee/pages/DuAn.dart';
import 'package:smart_bee/pages/ListDuAn.dart';
import 'package:smart_bee/pages/TaiChinh.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Curved_navigation_page extends StatefulWidget {
  const Curved_navigation_page({super.key});

  @override
  State<Curved_navigation_page> createState() => _Curved_navigation_pageState();
}

class _Curved_navigation_pageState extends State<Curved_navigation_page> {
  final items = const [
    Icon(
      MyFlutterApp.group_1000001220,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      CurvedIcon2.wallet,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.add,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      CurvedIcon4.checkbox_marked_outline,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      CurvedIcon5.signal,
      size: 30,
      color: Color.fromARGB(255, 255, 255, 255),
    )
  ];

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Container(
          child: getSelectedWidget(index: index),
        )),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60.0,
        items: items,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        color: Color.fromRGBO(89, 132, 62, 1),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const ListDuAn();
        break;
      case 1:
        widget = const DuAn();
        break;
      case 2:
        widget = const TaiChinh();
        break;
      default:
        widget = const CongViec();
        break;
    }
    return widget;
  }
}
