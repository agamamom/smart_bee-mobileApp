import 'package:flutter/material.dart';
import 'package:smart_bee/Components/DuAn_CongViec.dart';
import 'package:smart_bee/Components/DuAn_DangThucHien.dart';
import 'package:smart_bee/Components/DuAn_TaiChinh.dart';
import 'package:smart_bee/Components/DuAn_TienDo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DuAn extends StatefulWidget {
  const DuAn({super.key});

  @override
  State<DuAn> createState() => _DuAnState();
}

class _DuAnState extends State<DuAn> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    const DuAnDangThucHien(),
    DuAn_TaiChinh(),
    DuAn_CongViec(),
    DuAn_TienDo(
      color: Color.fromRGBO(0, 219, 153, 1),
    )
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.cover)),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome, hienltt',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color.fromRGBO(99, 99, 100, 1)),
                        ),
                        Image.asset(
                          'assets/images/bee-icon.png',
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    Container(
                        child: Expanded(
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List<Widget>.generate(_pages.length,
                                    (int index) {
                                  return AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      height: (index == _currentPage) ? 10 : 6,
                                      width: (index == _currentPage) ? 10 : 6,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 30),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  99, 99, 100, 1)),
                                          color: (index == _currentPage)
                                              ? Color.fromARGB(
                                                  30, 255, 255, 255)
                                              : Color.fromRGBO(
                                                  99, 99, 100, 1)));
                                })),
                          ),
                          Container(
                            child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              onPageChanged: _onchanged,
                              controller: _controller,
                              itemCount: _pages.length,
                              itemBuilder: (context, int index) {
                                return _pages[index];
                              },
                            ),
                            margin: EdgeInsets.only(top: 70),
                          )
                        ],
                      ),
                    )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
