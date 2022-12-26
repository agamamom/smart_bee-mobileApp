import 'package:flutter/material.dart';

class CoCauToChuc extends StatelessWidget {
  const CoCauToChuc({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(children: [
          Row(
            children: [
              Container(
                width: 7.0,
                height: 7.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(68, 131, 247, 1)),
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "Cơ cấu tổ chức",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(68, 131, 247, 1)),
              ),
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          Table(
            columnWidths: {
              0: FractionColumnWidth(.16),
              1: FractionColumnWidth(.28)
            },
            border: TableBorder.all(
                color: Color.fromARGB(255, 219, 216, 216),
                style: BorderStyle.solid,
                width: 1),
            children: [
              TableRow(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(169, 207, 205, 205),
                  ),
                  children: [
                    TableCell(
                      child: Container(
                        height: 35.0,
                        alignment: Alignment.center,
                        child: Text('STT',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromRGBO(112, 112, 112, 1),
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Container(
                      height: 35.0,
                      alignment: Alignment.center,
                      child: Text('Mã phòng',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35.0,
                      child: Text('Tên phòng',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.w500)),
                    )
                  ]),
              TableRow(children: [
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('1',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('gddh',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('Giám đốc điều hành',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                )
              ]),
              TableRow(children: [
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('2',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('gdkd',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('Giám đốc kinh doanh',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                )
              ]),
              TableRow(children: [
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('3',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('da',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('Phòng Dự án',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                )
              ]),
              TableRow(children: [
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('4',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('hcth',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('Phòng Hành chính tổng hợp',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                )
              ]),
              TableRow(children: [
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('5',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('tk',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('Phòng Triển khai',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                )
              ]),
              TableRow(children: [
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('6',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('dev',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('Phòng Code',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                )
              ]),
              TableRow(children: [
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                )
              ]),
              TableRow(children: [
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                )
              ]),
              TableRow(children: [
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                )
              ]),
              TableRow(children: [
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                )
              ]),
            ],
          ),
        ]),
      ),
    );
  }
}
