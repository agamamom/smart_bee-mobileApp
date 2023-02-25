import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:quickalert/quickalert.dart';
import 'package:smart_bee/Components/setting_button.dart';
import 'package:smart_bee/pages/curved_navigation_page.dart';

import 'package:intl/intl.dart';
import 'package:custom_check_box/custom_check_box.dart';

class DuyetViec extends StatefulWidget {
  const DuyetViec({super.key});

  @override
  State<DuyetViec> createState() => _DuyetViecState();
}

class _DuyetViecState extends State<DuyetViec> {
  final List<String> items = ['Vào', 'Ra', 'Khác'];

  String? selectedValue;

  void _returnTaiChinhPage() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      text: 'Bạn có chắc sẽ không duyệt',
      confirmBtnText: 'Có',
      cancelBtnText: 'Không',
      confirmBtnColor: Colors.green,
      onConfirmBtnTap: () => {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => CurvedNavigationPage(
                  indexOfScreen: 5,
                )))
      },
      onCancelBtnTap: () =>
          {Navigator.of(context, rootNavigator: true).pop(false)},
    );
  }

  late TextEditingController _controller3;

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'pt_BR';

    _controller3 = TextEditingController(text: DateTime.now().toString());

    _getValue();
  }

  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _controller3.text = '2002-11-22';
      });
    });
  }

  bool shouldCheck = false;
  bool shouldCheck2 = false;
  bool shouldCheckDefault = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                              child: Container(
                                width: 38,
                                height: 38,
                                color: const Color.fromARGB(90, 120, 116, 134),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.close,
                                      size: 18,
                                    ),
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    onPressed: () => _returnTaiChinhPage(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "Duyệt việc",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
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
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'phulq 1.111 giờ công',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
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
                                  const Color.fromARGB(255, 255, 255, 255),
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
                        Table(
                          columnWidths: const {
                            0: FractionColumnWidth(.53),
                            1: FractionColumnWidth(.33)
                          },
                          border: TableBorder.all(
                              color: const Color.fromARGB(255, 219, 216, 216),
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
                                      child: const Text('Mô tả việc',
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
                                    child: const Text('Giờ công',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color.fromRGBO(
                                                112, 112, 112, 1),
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 35.0,
                                    child: const Text('',
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
                                child: const Text('xadacascvcxvc',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: const Text('10h',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: CustomCheckBox(
                                  value: shouldCheck,
                                  shouldShowBorder: true,
                                  borderColor:
                                      const Color.fromARGB(255, 132, 130, 130),
                                  checkedFillColor:
                                      const Color.fromRGBO(72, 181, 69, 1),
                                  borderRadius: 4,
                                  borderWidth: 1,
                                  checkBoxSize: 18,
                                  onChanged: (val) {
                                    //do your stuff here
                                    setState(() {
                                      shouldCheck = val;
                                    });
                                  },
                                ),
                              )
                            ]),
                            TableRow(children: [
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: const Text('',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: const Text('',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              CustomCheckBox(
                                value: shouldCheck2,
                                shouldShowBorder: true,
                                borderColor:
                                    const Color.fromARGB(255, 132, 130, 130),
                                checkedFillColor:
                                    const Color.fromRGBO(72, 181, 69, 1),
                                borderRadius: 4,
                                borderWidth: 1,
                                checkBoxSize: 18,
                                onChanged: (val) {
                                  //do your stuff here
                                  setState(() {
                                    shouldCheck2 = val;
                                  });
                                },
                              )
                            ]),
                            TableRow(children: [
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: const Text('',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: const Text('',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: const Text('',
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
                                child: const Text('',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: const Text('',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: const Text('',
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
                                child: const Text('',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: const Text('',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: const Text('',
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
                                child: const Text('',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: const Text('',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: const Text('',
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
                                child: const Text('',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: const Text('',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: const Text('',
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
                                child: const Text('',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: const Text('',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromRGBO(80, 82, 89, 1),
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: const Text('',
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
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Column(children: [
                      SizedBox(
                        height: 47,
                        width: 175,
                        child: ElevatedButton(
                          onPressed: () => ({}),
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromRGBO(89, 132, 62, 1)),
                          ),
                          child: const Text('Duyệt',
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () => _returnTaiChinhPage(),
                        child: const Text(
                          'Không duyệt',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ]),
                  ),
                ]),
              )),
            )
          ],
        ),
      ),
    );
  }
}
