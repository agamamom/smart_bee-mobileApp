import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:smart_bee/Components/SettingButton.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:smart_bee/pages/Curved_navigation_page.dart';
import 'package:intl/intl.dart';

class ThemViec extends StatefulWidget {
  const ThemViec({super.key});

  @override
  State<ThemViec> createState() => _ThemViecState();
}

class _ThemViecState extends State<ThemViec> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  final List<String> items = ['Vào', 'Ra', 'Khác'];
  String? selectedValue;

  late TextTheme textTheme;
  bool shouldCheck = false;
  bool shouldCheckDefault = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                    const SettingButton()
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
                        Text(
                          "Thêm việc",
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
                          width: 6,
                        ),
                        Container(
                          width: double.infinity,
                          child: DefaultTabController(
                            length: 2,
                            child: Column(children: [
                              Container(
                                height: 48,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(179, 179, 179, 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TabBar(
                                    labelColor: Colors.white,
                                    unselectedLabelColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    indicator: BoxDecoration(
                                        color: Color.fromRGBO(72, 181, 89, 1),
                                        borderRadius: BorderRadius.circular(8)),
                                    tabs: [
                                      Tab(
                                        text: "Việc dự án",
                                      ),
                                      Tab(
                                        text: 'Việc phát sinh',
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 500,
                                child: TabBarView(children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 30),
                                    child: ListView(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional.topStart,
                                            child: Container(
                                              width: 500,
                                              height: 50,
                                              child:
                                                  DropdownButtonHideUnderline(
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
                                                          'Chọn dự án',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    71,
                                                                    69,
                                                                    69),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: items
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item,
                                                            child: Text(
                                                              item,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        71,
                                                                        69,
                                                                        69),
                                                              ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ))
                                                      .toList(),
                                                  value: selectedValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedValue =
                                                          value as String;
                                                    });
                                                  },
                                                  // icon: const Icon(
                                                  //   Icons.arrow_forward_ios_outlined,
                                                  // ),
                                                  iconSize: 24,
                                                  iconEnabledColor:
                                                      Color.fromARGB(
                                                          255, 71, 69, 69),
                                                  iconDisabledColor:
                                                      Colors.grey,
                                                  buttonHeight: 31,
                                                  buttonWidth: 150,
                                                  buttonPadding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  buttonDecoration:
                                                      BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          114, 97, 95, 95),
                                                    ),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  dropdownMaxHeight: 200,
                                                  dropdownWidth: 200,
                                                  dropdownPadding: null,
                                                  dropdownDecoration:
                                                      BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius:
                                                      const Radius.circular(4),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(0, -7),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional.topStart,
                                            child: Container(
                                              width: 500,
                                              height: 50,
                                              child:
                                                  DropdownButtonHideUnderline(
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
                                                          'Bước thực hiện',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    71,
                                                                    69,
                                                                    69),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: items
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item,
                                                            child: Text(
                                                              item,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        71,
                                                                        69,
                                                                        69),
                                                              ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ))
                                                      .toList(),
                                                  value: selectedValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedValue =
                                                          value as String;
                                                    });
                                                  },
                                                  // icon: const Icon(
                                                  //   Icons.arrow_forward_ios_outlined,
                                                  // ),
                                                  iconSize: 24,
                                                  iconEnabledColor:
                                                      Color.fromARGB(
                                                          255, 71, 69, 69),
                                                  iconDisabledColor:
                                                      Colors.grey,
                                                  buttonHeight: 31,
                                                  buttonWidth: 150,
                                                  buttonPadding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  buttonDecoration:
                                                      BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          114, 97, 95, 95),
                                                    ),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  dropdownMaxHeight: 200,
                                                  dropdownWidth: 200,
                                                  dropdownPadding: null,
                                                  dropdownDecoration:
                                                      BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius:
                                                      const Radius.circular(4),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(0, -7),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional.topStart,
                                            child: Container(
                                              width: 500,
                                              height: 50,
                                              child:
                                                  DropdownButtonHideUnderline(
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
                                                          'Nhóm việc',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    71,
                                                                    69,
                                                                    69),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: items
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item,
                                                            child: Text(
                                                              item,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        71,
                                                                        69,
                                                                        69),
                                                              ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ))
                                                      .toList(),
                                                  value: selectedValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedValue =
                                                          value as String;
                                                    });
                                                  },
                                                  // icon: const Icon(
                                                  //   Icons.arrow_forward_ios_outlined,
                                                  // ),
                                                  iconSize: 24,
                                                  iconEnabledColor:
                                                      Color.fromARGB(
                                                          255, 71, 69, 69),
                                                  iconDisabledColor:
                                                      Colors.grey,
                                                  buttonHeight: 31,
                                                  buttonWidth: 150,
                                                  buttonPadding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  buttonDecoration:
                                                      BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          114, 97, 95, 95),
                                                    ),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  dropdownMaxHeight: 200,
                                                  dropdownWidth: 200,
                                                  dropdownPadding: null,
                                                  dropdownDecoration:
                                                      BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius:
                                                      const Radius.circular(4),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(0, -7),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional.topStart,
                                            child: Container(
                                              width: 500,
                                              height: 50,
                                              child:
                                                  DropdownButtonHideUnderline(
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
                                                          'Tên việc',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    71,
                                                                    69,
                                                                    69),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: items
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item,
                                                            child: Text(
                                                              item,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        71,
                                                                        69,
                                                                        69),
                                                              ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ))
                                                      .toList(),
                                                  value: selectedValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedValue =
                                                          value as String;
                                                    });
                                                  },
                                                  // icon: const Icon(
                                                  //   Icons.arrow_forward_ios_outlined,
                                                  // ),
                                                  iconSize: 24,
                                                  iconEnabledColor:
                                                      Color.fromARGB(
                                                          255, 71, 69, 69),
                                                  iconDisabledColor:
                                                      Colors.grey,
                                                  buttonHeight: 31,
                                                  buttonWidth: 150,
                                                  buttonPadding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  buttonDecoration:
                                                      BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          114, 97, 95, 95),
                                                    ),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  dropdownMaxHeight: 200,
                                                  dropdownWidth: 200,
                                                  dropdownPadding: null,
                                                  dropdownDecoration:
                                                      BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius:
                                                      const Radius.circular(4),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(0, -7),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                                color:
                                                    Color.fromARGB(76, 0, 0, 0),
                                                blurRadius: 3,
                                                offset: Offset(0, 2))
                                          ]),
                                          child: TextFormField(
                                            maxLines: 2,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsets.all(15),
                                              hintText: 'Mô tả việc',
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        130, 79, 82, 78),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        130, 79, 82, 78),
                                                    width: 1),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        130, 79, 82, 78),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              filled: true,
                                              fillColor: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "ĐVT:",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Container(
                                                    width: 70,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.all(4),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                  width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                  width: 1),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                  width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            Color.fromARGB(255,
                                                                255, 255, 255),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Số lượng:",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Container(
                                                    width: 70,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.all(4),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                  width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                  width: 1),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                  width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            Color.fromARGB(255,
                                                                255, 255, 255),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Giờ công:",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                    ),
                                                    Container(
                                                      height: 31,
                                                      child: TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets.all(4),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            130,
                                                                            79,
                                                                            82,
                                                                            78),
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            130,
                                                                            79,
                                                                            82,
                                                                            78),
                                                                    width: 1),
                                                          ),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            130,
                                                                            79,
                                                                            82,
                                                                            78),
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  255),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Hạn hoàn thành:",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black),
                                                ),
                                                Container(
                                                  height: 31,
                                                  width: 162,
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      contentPadding:
                                                          EdgeInsets.all(4),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    130,
                                                                    79,
                                                                    82,
                                                                    78),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    130,
                                                                    79,
                                                                    82,
                                                                    78),
                                                            width: 1),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    130,
                                                                    79,
                                                                    82,
                                                                    78),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      filled: true,
                                                      fillColor: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.add,
                                                size: 16,
                                                color: Color.fromRGBO(
                                                    125, 125, 125, 1)),
                                            Text("Thêm nhân sự hỗ trợ:",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        125, 125, 125, 1))),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Wrap(
                                              children: [
                                                Text(
                                                  "tuanbv, truongpv",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 230,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 15),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color.fromRGBO(
                                                228, 250, 214, 1),
                                          ),
                                          child: Column(children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Đăng ký làm ngoài giờ",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                CustomCheckBox(
                                                  value: shouldCheck,
                                                  shouldShowBorder: true,
                                                  borderColor: Color.fromARGB(
                                                      255, 132, 130, 130),
                                                  checkedFillColor:
                                                      Color.fromRGBO(
                                                          72, 181, 69, 1),
                                                  borderRadius: 4,
                                                  borderWidth: 1,
                                                  checkBoxSize: 22,
                                                  onChanged: (val) {
                                                    //do your stuff here
                                                    setState(() {
                                                      shouldCheck = val;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Ngày-tháng:",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Container(
                                                        width: 280,
                                                        child: DateTimePicker(
                                                          type:
                                                              DateTimePickerType
                                                                  .date,
                                                          //dateMask: 'yyyy/MM/dd',
                                                          controller:
                                                              _controller3,
                                                          //initialValue: _initialValue,
                                                          firstDate:
                                                              DateTime(2000),
                                                          lastDate:
                                                              DateTime(2100),
                                                          icon:
                                                              Icon(Icons.event),

                                                          locale: Locale(
                                                              'en', 'US'),
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  _valueChanged3 =
                                                                      val),
                                                          validator: (val) {
                                                            setState(() =>
                                                                _valueToValidate3 =
                                                                    val ?? '');
                                                            return null;
                                                          },
                                                          onSaved: (val) =>
                                                              setState(() =>
                                                                  _valueSaved3 =
                                                                      val ??
                                                                          ''),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              child: IntrinsicWidth(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Từ giờ:",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          Container(
                                                            child:
                                                                TextFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(4),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color.fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                      width: 1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color.fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                      width: 1),
                                                                ),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color.fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                      width: 1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                ),
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        255),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Đến giờ:",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          Container(
                                                            child:
                                                                TextFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(4),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color.fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                      width: 1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color.fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                      width: 1),
                                                                ),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color.fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                      width: 1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                ),
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        255),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: Column(children: [
                                            SizedBox(
                                              height: 47,
                                              width: 175,
                                              child: ElevatedButton(
                                                onPressed: () => ({}),
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Color.fromRGBO(
                                                              89, 132, 62, 1)),
                                                ),
                                                child: const Text('Save',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  _returnTaiChinhPage(),
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 30),
                                    child: ListView(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional.topStart,
                                            child: Container(
                                              width: 500,
                                              height: 50,
                                              child:
                                                  DropdownButtonHideUnderline(
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
                                                          'Nhóm việc',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    71,
                                                                    69,
                                                                    69),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: items
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item,
                                                            child: Text(
                                                              item,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        71,
                                                                        69,
                                                                        69),
                                                              ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ))
                                                      .toList(),
                                                  value: selectedValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedValue =
                                                          value as String;
                                                    });
                                                  },
                                                  // icon: const Icon(
                                                  //   Icons.arrow_forward_ios_outlined,
                                                  // ),
                                                  iconSize: 24,
                                                  iconEnabledColor:
                                                      Color.fromARGB(
                                                          255, 71, 69, 69),
                                                  iconDisabledColor:
                                                      Colors.grey,
                                                  buttonHeight: 31,
                                                  buttonWidth: 150,
                                                  buttonPadding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  buttonDecoration:
                                                      BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          114, 97, 95, 95),
                                                    ),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  dropdownMaxHeight: 200,
                                                  dropdownWidth: 200,
                                                  dropdownPadding: null,
                                                  dropdownDecoration:
                                                      BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius:
                                                      const Radius.circular(4),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(0, -7),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional.topStart,
                                            child: Container(
                                              width: 500,
                                              height: 50,
                                              child:
                                                  DropdownButtonHideUnderline(
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
                                                          'Tên việc',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    71,
                                                                    69,
                                                                    69),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: items
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item,
                                                            child: Text(
                                                              item,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        71,
                                                                        69,
                                                                        69),
                                                              ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ))
                                                      .toList(),
                                                  value: selectedValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedValue =
                                                          value as String;
                                                    });
                                                  },
                                                  // icon: const Icon(
                                                  //   Icons.arrow_forward_ios_outlined,
                                                  // ),
                                                  iconSize: 24,
                                                  iconEnabledColor:
                                                      Color.fromARGB(
                                                          255, 71, 69, 69),
                                                  iconDisabledColor:
                                                      Colors.grey,
                                                  buttonHeight: 31,
                                                  buttonWidth: 150,
                                                  buttonPadding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  buttonDecoration:
                                                      BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          114, 97, 95, 95),
                                                    ),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),
                                                  buttonElevation: 2,
                                                  itemHeight: 40,
                                                  itemPadding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  dropdownMaxHeight: 200,
                                                  dropdownWidth: 200,
                                                  dropdownPadding: null,
                                                  dropdownDecoration:
                                                      BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),
                                                  dropdownElevation: 8,
                                                  scrollbarRadius:
                                                      const Radius.circular(4),
                                                  scrollbarThickness: 6,
                                                  scrollbarAlwaysShow: true,
                                                  offset: const Offset(0, -7),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                                color:
                                                    Color.fromARGB(76, 0, 0, 0),
                                                blurRadius: 3,
                                                offset: Offset(0, 2))
                                          ]),
                                          child: TextFormField(
                                            maxLines: 2,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsets.all(15),
                                              hintText: 'Mô tả việc',
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        130, 79, 82, 78),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        130, 79, 82, 78),
                                                    width: 1),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        130, 79, 82, 78),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              filled: true,
                                              fillColor: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "ĐVT:",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Container(
                                                    width: 70,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.all(4),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                  width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                  width: 1),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                  width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                        filled: true,
                                                        fillColor: const Color
                                                                .fromARGB(
                                                            255, 255, 255, 255),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Số lượng:",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    width: 70,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(4),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                  width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                        focusedBorder:
                                                            const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                  width: 1),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          130,
                                                                          79,
                                                                          82,
                                                                          78),
                                                                  width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                        filled: true,
                                                        fillColor: const Color
                                                                .fromARGB(
                                                            255, 255, 255, 255),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Giờ công:",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                    ),
                                                    SizedBox(
                                                      height: 31,
                                                      child: TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            130,
                                                                            79,
                                                                            82,
                                                                            78),
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                          ),
                                                          focusedBorder:
                                                              const OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            130,
                                                                            79,
                                                                            82,
                                                                            78),
                                                                    width: 1),
                                                          ),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            130,
                                                                            79,
                                                                            82,
                                                                            78),
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                          ),
                                                          filled: true,
                                                          fillColor: const Color
                                                                  .fromARGB(255,
                                                              255, 255, 255),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Hạn hoàn thành:",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 31,
                                                  width: 162,
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              4),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color
                                                                    .fromARGB(
                                                                        130,
                                                                        79,
                                                                        82,
                                                                        78),
                                                                width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      focusedBorder:
                                                          const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    130,
                                                                    79,
                                                                    82,
                                                                    78),
                                                            width: 1),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color
                                                                    .fromARGB(
                                                                        130,
                                                                        79,
                                                                        82,
                                                                        78),
                                                                width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.add,
                                                size: 16,
                                                color: Color.fromRGBO(
                                                    125, 125, 125, 1)),
                                            const Text("Thêm nhân sự hỗ trợ:",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        125, 125, 125, 1))),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            Wrap(
                                              children: const [
                                                Text(
                                                  "tuanbv, truongpv",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 230,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 15),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color.fromRGBO(
                                                228, 250, 214, 1),
                                          ),
                                          child: ListView(
                                            children: [
                                              Column(children: [
                                                Row(
                                                  children: [
                                                    const Text(
                                                      "Đăng ký làm ngoài giờ",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(
                                                      width: 4,
                                                    ),
                                                    CustomCheckBox(
                                                      value: shouldCheck,
                                                      shouldShowBorder: true,
                                                      borderColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              132,
                                                              130,
                                                              130),
                                                      checkedFillColor:
                                                          const Color.fromRGBO(
                                                              72, 181, 69, 1),
                                                      borderRadius: 4,
                                                      borderWidth: 1,
                                                      checkBoxSize: 22,
                                                      onChanged: (val) {
                                                        //do your stuff here
                                                        setState(() {
                                                          shouldCheck = val;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Ngày-tháng:",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        Container(
                                                          width: 280,
                                                          child: DateTimePicker(
                                                            type:
                                                                DateTimePickerType
                                                                    .date,
                                                            //dateMask: 'yyyy/MM/dd',
                                                            controller:
                                                                _controller3,
                                                            //initialValue: _initialValue,
                                                            firstDate:
                                                                DateTime(2000),
                                                            lastDate:
                                                                DateTime(2100),
                                                            icon: Icon(
                                                                Icons.event),

                                                            locale: Locale(
                                                                'en', 'US'),
                                                            onChanged: (val) =>
                                                                setState(() =>
                                                                    _valueChanged3 =
                                                                        val),
                                                            validator: (val) {
                                                              setState(() =>
                                                                  _valueToValidate3 =
                                                                      val ??
                                                                          '');
                                                              return null;
                                                            },
                                                            onSaved: (val) =>
                                                                setState(() =>
                                                                    _valueSaved3 =
                                                                        val ??
                                                                            ''),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  child: IntrinsicWidth(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Từ giờ:",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              Container(
                                                                child:
                                                                    TextFormField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .all(4),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Color.fromARGB(
                                                                              130,
                                                                              79,
                                                                              82,
                                                                              78),
                                                                          width:
                                                                              1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Color.fromARGB(
                                                                              130,
                                                                              79,
                                                                              82,
                                                                              78),
                                                                          width:
                                                                              1),
                                                                    ),
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Color.fromARGB(
                                                                              130,
                                                                              79,
                                                                              82,
                                                                              78),
                                                                          width:
                                                                              1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            255),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Đến giờ:",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              Container(
                                                                child:
                                                                    TextFormField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .all(4),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Color.fromARGB(
                                                                              130,
                                                                              79,
                                                                              82,
                                                                              78),
                                                                          width:
                                                                              1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Color.fromARGB(
                                                                              130,
                                                                              79,
                                                                              82,
                                                                              78),
                                                                          width:
                                                                              1),
                                                                    ),
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Color.fromARGB(
                                                                              130,
                                                                              79,
                                                                              82,
                                                                              78),
                                                                          width:
                                                                              1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            255),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: Column(children: [
                                            SizedBox(
                                              height: 47,
                                              width: 175,
                                              child: ElevatedButton(
                                                onPressed: () => ({}),
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Color.fromRGBO(
                                                              89, 132, 62, 1)),
                                                ),
                                                child: const Text('Save',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  _returnTaiChinhPage(),
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              )
                            ]),
                          ),
                        ),
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
