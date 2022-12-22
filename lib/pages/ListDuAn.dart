import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListDuAn extends StatefulWidget {
  const ListDuAn({super.key});

  @override
  State<ListDuAn> createState() => _ListDuAnState();
}

class _ListDuAnState extends State<ListDuAn> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover)),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Image.asset(
                    'assets/images/bee-icon.png',
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Image.asset(
                    'assets/images/calendar-icon.png',
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Image.asset(
                    'assets/images/setting-icon.png',
                    fit: BoxFit.contain,
                  )
                ]),
                SizedBox(
                  height: 14.0,
                ),
                Text(
                  'Welcome, hienltt',
                  style: TextStyle(
                      fontSize: 15.0, color: Color.fromRGBO(99, 99, 100, 1)),
                ),
              ],
            ),
          )),
    );
  }
}
