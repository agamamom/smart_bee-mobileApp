import 'package:flutter/material.dart';
import 'package:smart_bee/Components/CoCauToChuc.dart';
import 'package:smart_bee/Components/HeSoPhuCapChucVu.dart';
import 'package:smart_bee/Components/NhomMuc.dart';
import 'package:smart_bee/Components/ThuTienMat.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Components/ForgotPassword.dart';

class TaiChinh extends StatefulWidget {
  const TaiChinh({super.key});

  @override
  State<TaiChinh> createState() => _TaiChinhState();
}

class _TaiChinhState extends State<TaiChinh> {
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
              child: SingleChildScrollView(
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                            fontSize: 15.0,
                            color: Color.fromRGBO(99, 99, 100, 1)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "Tài Chính",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(99, 99, 100, 1)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Column(
                          children: [
                            Wrap(spacing: 10.0, runSpacing: 10.0, children: [
                              GestureDetector(
                                onTap: () => {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ThuTienMat()))
                                },
                                child: Container(
                                  width: 163,
                                  height: 134,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color:
                                            Color.fromARGB(255, 48, 200, 73)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 67,
                                          height: 67,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 12),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Color.fromRGBO(
                                                  72, 181, 69, 1)),
                                          child: Icon(
                                            Icons.add_box_outlined,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            size: 50.0,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Text(
                                                "Thu TM",
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        72, 181, 69, 1)),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1),
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ForgotPassword()))
                                },
                                child: Container(
                                  width: 163,
                                  height: 134,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color:
                                            Color.fromARGB(255, 48, 200, 73)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 67,
                                            height: 67,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 10),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1)),
                                            child: Image.asset(
                                              "assets/images/ThuCK.png",
                                              fit: BoxFit.cover,
                                            )),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Text(
                                                "Thu CK",
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        72, 181, 69, 1)),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1),
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ForgotPassword()))
                                },
                                child: Container(
                                  width: 163,
                                  height: 134,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color:
                                            Color.fromARGB(255, 48, 200, 73)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 67,
                                            height: 67,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 12),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1)),
                                            child: Image.asset(
                                              "assets/images/ChiTM.png",
                                              fit: BoxFit.cover,
                                            )),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Text(
                                                "Chi TM",
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        72, 181, 69, 1)),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1),
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ForgotPassword()))
                                },
                                child: Container(
                                  width: 163,
                                  height: 134,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color:
                                            Color.fromARGB(255, 48, 200, 73)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 67,
                                          height: 67,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 12),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Color.fromRGBO(
                                                  72, 181, 69, 1)),
                                          child: Image.asset(
                                            "assets/images/ChiCK.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Text(
                                                "Chi CK",
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        72, 181, 69, 1)),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1),
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: 50,
                            ),
                            Wrap(spacing: 10.0, runSpacing: 10.0, children: [
                              GestureDetector(
                                onTap: () => {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ForgotPassword()))
                                },
                                child: Container(
                                  width: 163,
                                  height: 134,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color:
                                            Color.fromARGB(255, 48, 200, 73)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 67,
                                            height: 67,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 12),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: Color.fromRGBO(
                                                    255, 199, 39, 1)),
                                            child: Image.asset(
                                                "assets/images/GhiSo.png")),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Text(
                                                "Ghi sổ",
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        72, 181, 69, 1)),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1),
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ForgotPassword()))
                                },
                                child: Container(
                                  width: 163,
                                  height: 134,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color:
                                            Color.fromARGB(255, 48, 200, 73)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 67,
                                            height: 67,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 10),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: Color.fromRGBO(
                                                    255, 199, 39, 1)),
                                            child: Image.asset(
                                              "assets/images/ExchangeCurrency.png",
                                              fit: BoxFit.cover,
                                            )),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Text(
                                                "Số quỹ",
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        72, 181, 69, 1)),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1),
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
