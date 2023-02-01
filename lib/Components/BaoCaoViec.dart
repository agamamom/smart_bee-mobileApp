import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:quickalert/quickalert.dart';
import 'package:smart_bee/Components/SettingButton.dart';
import 'package:smart_bee/pages/Curved_navigation_page.dart';
import '../pages/TaiChinh.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:dotted_border/dotted_border.dart';

class BaoCaoViec extends StatefulWidget {
  const BaoCaoViec({super.key});

  @override
  State<BaoCaoViec> createState() => _BaoCaoViecState();
}

class _BaoCaoViecState extends State<BaoCaoViec> {
  final List<String> items = ['Vào', 'Ra', 'Khác'];
  final List<String> itemsTK = ['No 1', "No 2"];
  String? selectedValue;
  String? selectedValue2;

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

  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.cover)),
              child: SingleChildScrollView(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(children: [
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
                    const SettingButton(),
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                              child: Container(
                                width: 38,
                                height: 38,
                                color: Color.fromARGB(90, 120, 116, 134),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      size: 18,
                                    ),
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    onPressed: () => _returnTaiChinhPage(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Báo cáo việc",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Today",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(120, 116, 134, 1)),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "02/02/2022",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(120, 116, 134, 1)),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "17h00",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(120, 116, 134, 1)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
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
                                    color: Color.fromRGBO(72, 181, 69, 1),
                                  ),
                                  color: Color.fromRGBO(72, 181, 69, 1),
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
                                  color: Color.fromRGBO(72, 181, 69, 1),
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
                        SizedBox(
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
                                    icon: Icon(Icons.event),

                                    locale: Locale('en', 'US'),
                                    onChanged: (val) =>
                                        setState(() => _valueChanged3 = val),
                                    validator: (val) {
                                      setState(
                                          () => _valueToValidate3 = val ?? '');
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
                                    icon: Icon(Icons.event),

                                    locale: Locale('en', 'US'),
                                    onChanged: (val) =>
                                        setState(() => _valueChanged3 = val),
                                    validator: (val) {
                                      setState(
                                          () => _valueToValidate3 = val ?? '');
                                      return null;
                                    },
                                    onSaved: (val) => setState(
                                        () => _valueSaved3 = val ?? ''),
                                  ),
                                ),
                              )
                            ]),
                        SizedBox(
                          height: 20,
                        ),
                        Table(
                          columnWidths: {
                            0: FractionColumnWidth(.53),
                            1: FractionColumnWidth(.33)
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
                                      child: Text('Nhóm việc',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Color.fromRGBO(
                                                  112, 112, 112, 1),
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                  Container(
                                    height: 35.0,
                                    alignment: Alignment.center,
                                    child: Text('Giờ công',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color.fromRGBO(
                                                112, 112, 112, 1),
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 35.0,
                                    child: Text('%',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color.fromRGBO(
                                                112, 112, 112, 1),
                                            fontWeight: FontWeight.w500)),
                                  )
                                ]),
                            TableRow(children: [
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: Text('vfvfdbgbsdcasczxvfb',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: Text('10h',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: Text('10%',
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
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 4,
                                    offset: Offset(0, 7),
                                  )
                                ],
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: Color.fromRGBO(228, 250, 214, 1)),
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Hoàn thành trong tuần",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                DottedBorder(
                                    dashPattern: [3, 3, 3, 3],
                                    color: Colors.black,
                                    strokeWidth: 1,
                                    strokeCap: StrokeCap.round,
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(5),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 6),
                                    child: Text(
                                      "150/160h",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    )),
                                SizedBox(
                                  width: 16,
                                ),
                                ClipRRect(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(72, 181, 69, 1),
                                    ),
                                    height: 45,
                                    width: 45,
                                    child: Center(
                                      child: Text(
                                        "90%",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                )
                              ],
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
    );
  }
}
