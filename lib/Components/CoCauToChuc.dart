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
          return SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(68, 131, 247, 1)),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const Text(
                    "Cơ cấu tổ chức",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(68, 131, 247, 1)),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: FittedBox(
                      child: DataTable(
                        dataRowHeight: 60,
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => const Color.fromRGBO(238, 238, 238, 1)),
                        border: TableBorder.all(
                            color: const Color.fromARGB(174, 238, 233, 233)),
                        columns: const [
                          DataColumn(
                              label: SizedBox(width: 30, child: Text("STT"))),
                          DataColumn(
                              label:
                                  SizedBox(width: 60, child: Text("Mã phòng"))),
                          DataColumn(
                              label: SizedBox(
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
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
      },
    );
  }
}
