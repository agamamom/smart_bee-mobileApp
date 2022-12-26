import 'package:flutter/material.dart';

class NhomMuc extends StatelessWidget {
  const NhomMuc({super.key});

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
                "Nhóm mục",
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
              0: FractionColumnWidth(.2),
              1: FractionColumnWidth(.25)
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
                        child: Text('Mục',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromRGBO(112, 112, 112, 1),
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Container(
                      height: 35.0,
                      alignment: Alignment.center,
                      child: Text('Tiểu mục',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35.0,
                      child: Text('Tên mục/tiểu mục',
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
                  child: Text('dv',
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
                  child: Text('Hoạt động Dịch Vụ',
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
                  child: Text('dv01',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('Dịch vụ Tư vấn QLDA',
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
                  child: Text('dv2',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(80, 82, 89, 1),
                          fontWeight: FontWeight.w400)),
                ),
                Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text('Dịch vụ Tư vấn lập đề cương',
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
