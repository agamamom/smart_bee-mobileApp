import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:smart_bee/Components/SettingButton.dart';
import 'package:smart_bee/pages/Curved_navigation_page.dart';

class GhiSo extends StatefulWidget {
  const GhiSo({super.key});

  @override
  State<GhiSo> createState() => _GhiSoState();
}

class _GhiSoState extends State<GhiSo> {
  String _fileText = "";
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
            builder: (BuildContext context) => Curved_navigation_page(
                  indexOfScreen: 2,
                  index: 2,
                )))
      },
      onCancelBtnTap: () =>
          {Navigator.of(context, rootNavigator: true).pop(false)},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
                child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                        "Ghi sổ",
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
                      Wrap(
                        spacing: 4.0,
                        direction: Axis.horizontal,
                        children: const [
                          FractionallySizedBox(
                            widthFactor: 0.47,
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromRGBO(179, 179, 179, 1),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 14.74, horizontal: 24.34),
                                  border: OutlineInputBorder(),
                                  hintText: 'CHI',
                                  hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(179, 179, 179, 1),
                                        width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(179, 179, 179, 1),
                                        width: 1),
                                  )),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.47,
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromRGBO(72, 181, 69, 1),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 14.74, horizontal: 24.34),
                                  border: OutlineInputBorder(),
                                  hintText: 'THU',
                                  hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(72, 181, 69, 1),
                                        width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(72, 181, 69, 1),
                                        width: 1),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
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
                                    'Select Item',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 255, 255, 255),
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
                            iconSize: 24,
                            iconEnabledColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            iconDisabledColor: Colors.grey,
                            buttonHeight: 31,
                            buttonWidth: 150,
                            buttonPadding:
                                const EdgeInsets.only(left: 10, right: 10),
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: const Color.fromRGBO(191, 107, 123, 1),
                              ),
                              color: const Color.fromRGBO(191, 107, 123, 1),
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
                              color: const Color.fromRGBO(191, 107, 123, 1),
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
                        height: 20,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 80,
                            child: Text(
                              'Số hóa đơn:',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 45,
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              "1333/ABC",
                              style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(101, 103, 109, 1)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 80,
                            child: Text(
                              "Khách hàng:",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 45,
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              'MST KH',
                              style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(101, 103, 109, 1)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "TK Nợ:",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: const [
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: itemsTK
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue2,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue2 = value as String;
                                    });
                                  },
                                  iconSize: 24,
                                  iconEnabledColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  iconDisabledColor: Colors.grey,
                                  buttonHeight: 31,
                                  buttonWidth: 84,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
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
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarRadius: const Radius.circular(4),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(0, -7),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: const [
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: itemsTK
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue2,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue2 = value as String;
                                    });
                                  },
                                  iconSize: 24,
                                  iconEnabledColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  iconDisabledColor: Colors.grey,
                                  buttonHeight: 31,
                                  buttonWidth: 84,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
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
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarRadius: const Radius.circular(4),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(0, -7),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "TK Có:",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: const [
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: itemsTK
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue2,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue2 = value as String;
                                    });
                                  },
                                  iconSize: 24,
                                  iconEnabledColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  iconDisabledColor: Colors.grey,
                                  buttonHeight: 31,
                                  buttonWidth: 84,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
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
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarRadius: const Radius.circular(4),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(0, -7),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: const [
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: itemsTK
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue2,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue2 = value as String;
                                    });
                                  },
                                  iconSize: 24,
                                  iconEnabledColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  iconDisabledColor: Colors.grey,
                                  buttonHeight: 31,
                                  buttonWidth: 84,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
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
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarRadius: const Radius.circular(4),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(0, -7),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Số tiền",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 31,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets.all(4),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color:
                                                Color.fromARGB(130, 79, 82, 78),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromARGB(130, 79, 82, 78),
                                            width: 1),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color:
                                                Color.fromARGB(130, 79, 82, 78),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 31,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets.all(4),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color:
                                                Color.fromARGB(130, 79, 82, 78),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromARGB(130, 79, 82, 78),
                                            width: 1),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color:
                                                Color.fromARGB(130, 79, 82, 78),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                "TỔNG CỘNG:",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 31,
                                width: 135,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.all(4),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(130, 79, 82, 78),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(130, 79, 82, 78),
                                          width: 1),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(130, 79, 82, 78),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 40,
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
                              child: const Text('Save',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () => _returnTaiChinhPage(),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                )
              ]),
            )),
          )
        ],
      ),
    );
  }
}
