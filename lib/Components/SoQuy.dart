import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:smart_bee/Components/SettingButton.dart';
import 'package:smart_bee/pages/Curved_navigation_page.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:smart_bee/model/soQuy-model.dart';
import 'package:http/http.dart' as http;

class SoQuy extends StatefulWidget {
  const SoQuy({super.key});

  @override
  State<SoQuy> createState() => _SoQuyState();
}

class _SoQuyState extends State<SoQuy> {
  final List<String> items = ['Vào', 'Ra', 'Khác'];
  final List<String> itemsTK = ['No 1', "No 2"];
  String? selectedValue;
  String? selectedValue2;

  // void myFunction() {
  //   futureCongViec
  // }

  Future<SoQuyModel> fetchSectionData() async {
    String dataUrl =
        'http://115.75.13.14:2603/api/SmartBee?PageIndex=0&PageSize=10';
    var response = await http.get(Uri.parse(dataUrl));
    if (response.statusCode == 200) {
      return SoQuyModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get the data');
    }
  }

  late Future<SoQuyModel> futureCongViec;

  void _returnTaiChinhPage() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      text: 'Bạn có chắc sẽ thoát',
      confirmBtnText: 'Có',
      cancelBtnText: 'Không',
      confirmBtnColor: Colors.green,
      onConfirmBtnTap: () => {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Curved_navigation_page()))
      },
      onCancelBtnTap: () =>
          {Navigator.of(context, rootNavigator: true).pop(false)},
    );
  }

  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  late TextEditingController _controller3;
  String _valueChanged3 = '';
  String _valueToValidate3 = '';
  String _valueSaved3 = '';

  @override
  void initState() {
    super.initState();
    futureCongViec = fetchSectionData();
    Intl.defaultLocale = 'pt_BR';

    _controller3 = TextEditingController(text: DateTime.now().toString());

    String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
    String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');

    _getValue();
  }

  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _controller3.text = '2002-11-22';
      });
    });
  }

  NumberFormat vnCurrencyFormat =
      NumberFormat.currency(locale: 'vi_VN', symbol: '₫', decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(true);
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.cover)),
                child: SingleChildScrollView(
                    child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      const SizedBox(
                        width: 15.0,
                      ),
                      Image.asset(
                        'assets/images/calendar-icon.png',
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      const SettingButton()
                    ]),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
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
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Column(
                        children: [
                          const Text(
                            "Sổ quỹ",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Row(
                                  children: const [
                                    // Icon(
                                    //   Icons.list,
                                    //   size: 16,
                                    //   color: Colors.yellow,
                                    // ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '1111 Tiền Việt Nam',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                items: items
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as String;
                                  });
                                },
                                // icon: const Icon(
                                //   Icons.arrow_forward_ios_outlined,
                                // ),
                                iconSize: 24,
                                iconEnabledColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                iconDisabledColor: Colors.grey,
                                buttonHeight: 31,
                                buttonWidth: double.infinity,
                                buttonPadding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: const Color.fromRGBO(72, 181, 69, 1),
                                  ),
                                  color: const Color.fromRGBO(72, 181, 69, 1),
                                ),
                                buttonElevation: 2,
                                itemHeight: 40,
                                itemPadding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                dropdownMaxHeight: 200,
                                dropdownWidth: 200,
                                dropdownPadding: null,
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: const Color.fromRGBO(72, 181, 69, 1),
                                ),
                                dropdownElevation: 8,
                                scrollbarRadius: const Radius.circular(4),
                                scrollbarThickness: 6,
                                scrollbarAlwaysShow: true,
                                offset: const Offset(0, -7),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Container(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: const [
                                      // Icon(
                                      //   Icons.list,
                                      //   size: 16,
                                      //   color: Colors.yellow,
                                      // ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Từ ngày - Đến ngày',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Color.fromARGB(255, 83, 81, 81),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: items
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    255, 83, 81, 81),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value as String;
                                    });
                                  },
                                  // icon: const Icon(
                                  //   Icons.arrow_forward_ios_outlined,
                                  // ),
                                  iconSize: 24,
                                  iconEnabledColor:
                                      const Color.fromARGB(255, 83, 81, 81),
                                  iconDisabledColor: Colors.grey,
                                  buttonHeight: 31,
                                  buttonWidth: double.infinity,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: const Color.fromRGBO(
                                          238, 238, 238, 1),
                                    ),
                                    color:
                                        const Color.fromRGBO(238, 238, 238, 1),
                                  ),
                                  buttonElevation: 2,
                                  itemHeight: 40,
                                  itemPadding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  dropdownMaxHeight: 200,
                                  dropdownWidth: 200,
                                  dropdownPadding: null,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color:
                                        const Color.fromRGBO(238, 238, 238, 1),
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarRadius: const Radius.circular(4),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(0, -7),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Wrap(
                              spacing: 4.0,
                              direction: Axis.horizontal,
                              children: [
                                FractionallySizedBox(
                                  widthFactor: 0.5,
                                  child: Form(
                                    child: DateTimePicker(
                                      type: DateTimePickerType.date,
                                      //dateMask: 'yyyy/MM/dd',
                                      controller: _controller3,
                                      //initialValue: _initialValue,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                      icon: const Icon(Icons.event),

                                      locale: const Locale('en', 'US'),
                                      onChanged: (val) =>
                                          setState(() => _valueChanged3 = val),
                                      validator: (val) {
                                        setState(() =>
                                            _valueToValidate3 = val ?? '');
                                        return null;
                                      },
                                      onSaved: (val) => setState(
                                          () => _valueSaved3 = val ?? ''),
                                    ),
                                  ),
                                ),
                                FractionallySizedBox(
                                  widthFactor: 0.48,
                                  child: Form(
                                    child: DateTimePicker(
                                      type: DateTimePickerType.date,
                                      //dateMask: 'yyyy/MM/dd',
                                      controller: _controller3,
                                      //initialValue: _initialValue,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                      icon: const Icon(Icons.event),

                                      locale: const Locale('en', 'US'),
                                      onChanged: (val) =>
                                          setState(() => _valueChanged3 = val),
                                      validator: (val) {
                                        setState(() =>
                                            _valueToValidate3 = val ?? '');
                                        return null;
                                      },
                                      onSaved: (val) => setState(
                                          () => _valueSaved3 = val ?? ''),
                                    ),
                                  ),
                                )
                              ]),
                          const SizedBox(
                            height: 20,
                          ),
                          FutureBuilder<SoQuyModel>(
                            future: futureCongViec,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: FittedBox(
                                        child: DataTable(
                                          columnSpacing: 10.0,
                                          headingRowHeight: 32.0,
                                          dataRowHeight: 70,
                                          horizontalMargin: 10.0,
                                          headingRowColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) =>
                                                      const Color.fromRGBO(
                                                          238, 238, 238, 1)),
                                          border: TableBorder.all(
                                              color: const Color.fromARGB(
                                                  174, 238, 233, 233)),
                                          columns: const [
                                            DataColumn(
                                                label: SizedBox(
                                                    width: 100,
                                                    child: Text("Ngày tháng"))),
                                            DataColumn(
                                                label: SizedBox(
                                                    width: 90,
                                                    child: Text("Thu"))),
                                            DataColumn(
                                                label: SizedBox(
                                                    width: 90,
                                                    child: Text("Chi"))),
                                          ],
                                          rows: snapshot.data!.result!
                                              .map((e) => DataRow(cells: [
                                                    DataCell(Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                            '${e.ngay!.substring(0, 10).toString()}'))),
                                                    DataCell(e.loai == "1"
                                                        ? Container(
                                                            width: 90,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                                '${vnCurrencyFormat.format(int.parse(e.soTien ?? ""))}'))
                                                        : Container(
                                                            width: 90,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(" "))),
                                                    DataCell(e.loai == "2"
                                                        ? Container(
                                                            width: 90,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                                '${vnCurrencyFormat.format(int.parse(e.soTien ?? ""))}'))
                                                        : Container(
                                                            width: 90,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(" "))),
                                                  ]))
                                              .toList(),
                                        ),
                                      )),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(69, 114, 173, 1)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: const Text(
                              "TỐN QUỸ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(165, 213, 254, 1)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              child: const Center(
                                child: Text(
                                  "9.990.000.000",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 209, 38, 38),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
