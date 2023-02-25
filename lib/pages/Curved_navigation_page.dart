import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_bee/icon/curved_icon2_icons.dart';
import 'package:smart_bee/icon/curved_icon4_icons.dart';
import 'package:smart_bee/icon/curved_icon5_icons.dart';
import 'package:smart_bee/icon/my_flutter_app_icons.dart';
import 'package:smart_bee/pages/cong_viec.dart';
import 'package:smart_bee/pages/du_an.dart';
import 'package:smart_bee/pages/list_du_an.dart';
import 'package:smart_bee/pages/tai_chinh.dart';
import 'package:smart_bee/pages/tien_do_bao_cao_tuan.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// ignore: must_be_immutable
class CurvedNavigationPage extends StatefulWidget {
  final int? indexOfScreen;
  int? index;
  CurvedNavigationPage({super.key, required this.indexOfScreen, this.index});

  @override
  State<CurvedNavigationPage> createState() => _CurvedNavigationPageState();
}

class _CurvedNavigationPageState extends State<CurvedNavigationPage> {
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
      CurvedIcon4.checkboxMarkedOutline,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      CurvedIcon5.signal,
      size: 30,
      color: Color.fromARGB(255, 255, 255, 255),
    )
  ];

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Do you want to exit app?'),
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('No')),
            ElevatedButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Yes')),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child:
                getSelectedWidget(index: widget.index ?? widget.indexOfScreen),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 60.0,
          items: items,
          index: widget.index ?? 0,
          onTap: (selectedIndex) {
            setState(() {
              widget.index = selectedIndex;
            });
          },
          color: const Color.fromRGBO(89, 132, 62, 1),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          animationDuration: const Duration(milliseconds: 300),
        ),
      ),
    );
  }

  Widget getSelectedWidget({required int? index}) {
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
      case 3:
        widget = const TienDoBaoCaoTuan();
        break;
      default:
        widget = const CongViec();
        break;
    }
    return widget;
  }
}
