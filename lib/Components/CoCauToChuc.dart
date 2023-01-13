import 'dart:convert';
import 'package:easy_table/easy_table.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_bee/model/data.dart';

class CoCauToChuc extends StatefulWidget {
  const CoCauToChuc({super.key});

  @override
  State<CoCauToChuc> createState() => _CoCauToChucState();
}

class _CoCauToChucState extends State<CoCauToChuc> {
  Future<CongViec> fetchSectionData() async {
    String dataUrl =
        'http://115.75.13.14:2602/api/SmartBee?PageIndex=0&PageSize=10';
    var response = await http.get(Uri.parse(dataUrl));
    if (response.statusCode == 200) {
      return CongViec.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get the data');
    }
  }

  // Future<CongViec> fetchSectionData() async {
  //   String dataUrl =
  //       'http://115.75.13.14:2602/api/SmartBee?PageIndex=0&PageSize=10';
  //   var response = await http.get(Uri.parse(dataUrl));
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> map = json.decode(response.body);
  //     Future<CongViec> dataCongViec = map["result"];
  //     return dataCongViec;
  //   } else {
  //     throw Exception('Failed to get the data');
  //   }
  // }

  late Future<CongViec> futureCongViec;

  @override
  void initState() {
    super.initState();
    futureCongViec = fetchSectionData();
  }

  EasyTableModel<CongViec>? _model;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CongViec>(
      future: futureCongViec,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final leg = snapshot.data!.result;
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
                // Table(
                //   columnWidths: {
                //     0: FractionColumnWidth(.16),
                //     1: FractionColumnWidth(.28)
                //   },
                //   border: TableBorder.all(
                //       color: Color.fromARGB(255, 219, 216, 216),
                //       style: BorderStyle.solid,
                //       width: 1),
                //   children: [
                //     // TableRow(
                //     //     decoration: const BoxDecoration(
                //     //       color: Color.fromARGB(169, 207, 205, 205),
                //     //     ),
                //     //     children: [
                //     //       TableCell(
                //     //         child: Container(
                //     //           height: 35.0,
                //     //           alignment: Alignment.center,
                //     //           child: Text('STT',
                //     //               style: TextStyle(
                //     //                   fontSize: 14.0,
                //     //                   color: Color.fromRGBO(112, 112, 112, 1),
                //     //                   fontWeight: FontWeight.w500)),
                //     //         ),
                //     //       ),
                //     //       Container(
                //     //         height: 35.0,
                //     //         alignment: Alignment.center,
                //     //         child: Text('Mã phòng',
                //     //             style: TextStyle(
                //     //                 fontSize: 14.0,
                //     //                 color: Color.fromRGBO(112, 112, 112, 1),
                //     //                 fontWeight: FontWeight.w500)),
                //     //       ),
                //     //       Container(
                //     //         alignment: Alignment.center,
                //     //         height: 35.0,
                //     //         child: Text('Tên phòng',
                //     //             style: TextStyle(
                //     //                 fontSize: 14.0,
                //     //                 color: Color.fromRGBO(112, 112, 112, 1),
                //     //                 fontWeight: FontWeight.w500)),
                //     //       )
                //     //     ]),

                //     TableRow(
                //         decoration: const BoxDecoration(
                //           color: Color.fromARGB(169, 207, 205, 205),
                //         ),
                //         children: [
                //           ListView.builder(
                //               itemBuilder: (BuildContext context, int index) {
                //             var dataa = snapshot.data?.result as Map?;
                //             String idNguoichutri = dataa?["idNguoichutri"];
                //             return Column(
                //               children: [
                //                 Container(
                //                   height: 50.0,
                //                   alignment: Alignment.center,
                //                   child: Text(idNguoichutri,
                //                       style: TextStyle(
                //                           fontSize: 12.0,
                //                           color: Color.fromRGBO(80, 82, 89, 1),
                //                           fontWeight: FontWeight.w400)),
                //                 ),
                //                 Container(
                //                   height: 50.0,
                //                   alignment: Alignment.center,
                //                   child: Text('1',
                //                       style: TextStyle(
                //                           fontSize: 12.0,
                //                           color: Color.fromRGBO(80, 82, 89, 1),
                //                           fontWeight: FontWeight.w400)),
                //                 ),
                //                 Container(
                //                   height: 50.0,
                //                   alignment: Alignment.center,
                //                   child: Text('1',
                //                       style: TextStyle(
                //                           fontSize: 12.0,
                //                           color: Color.fromRGBO(80, 82, 89, 1),
                //                           fontWeight: FontWeight.w400)),
                //                 ),
                //               ],
                //             );
                //           }),
                //         ]),
                //     // TableRow(children: [
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('1',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('gddh',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('Giám đốc điều hành',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   )
                //     // ]),
                //     // TableRow(children: [
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('2',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('gdkd',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('Giám đốc kinh doanh',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   )
                //     // ]),
                //     // TableRow(children: [
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('3',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('da',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('Phòng Dự án',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   )
                //     // ]),
                //     // TableRow(children: [
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('4',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('hcth',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('Phòng Hành chính tổng hợp',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   )
                //     // ]),
                //     // TableRow(children: [
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('5',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('tk',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('Phòng Triển khai',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   )
                //     // ]),
                //     // TableRow(children: [
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('6',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('dev',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('Phòng Code',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   )
                //     // ]),
                //     // TableRow(children: [
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   )
                //     // ]),
                //     // TableRow(children: [
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   )
                //     // ]),
                //     // TableRow(children: [
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   )
                //     // ]),
                //     // TableRow(children: [
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   ),
                //     //   Container(
                //     //     height: 50.0,
                //     //     alignment: Alignment.center,
                //     //     child: Text('',
                //     //         style: TextStyle(
                //     //             fontSize: 12.0,
                //     //             color: Color.fromRGBO(80, 82, 89, 1),
                //     //             fontWeight: FontWeight.w400)),
                //     //   )
                //     // ]),
                //   ],
                // ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: FittedBox(
                        child: DataTable(
                          dataRowHeight: 60,
                          headingRowColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromRGBO(238, 238, 238, 1)),
                          border: TableBorder.all(
                              color: Color.fromARGB(174, 238, 233, 233)),
                          columns: [
                            DataColumn(
                                label:
                                    Container(width: 30, child: Text("STT"))),
                            DataColumn(
                                label: Container(
                                    width: 60, child: Text("Mã phòng"))),
                            DataColumn(
                                label: Container(
                                    width: 100, child: Text("Tên phòng"))),
                          ],
                          rows: snapshot.data!.result!
                              .map((e) => DataRow(cells: [
                                    DataCell(Container(
                                        alignment: Alignment.center,
                                        width: 30,
                                        child: Text(
                                            '${snapshot.data!.result!.indexOf(e) + 1}'))),
                                    DataCell(Container(
                                        alignment: Alignment.center,
                                        width: 60,
                                        child: Text('${e.idNguoichutri}'))),
                                    DataCell(Container(
                                        alignment: Alignment.center,
                                        width: 100,
                                        child: Text('${e.idNguoichutri}'))),
                                  ]))
                              .toList(),
                        ),
                      )),
                ),
              ]),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
      },
    );
  }
}
