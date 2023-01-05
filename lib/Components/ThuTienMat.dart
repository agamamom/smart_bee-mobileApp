// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/foundation.dart';

// const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

// class ThuTienMat extends StatefulWidget {
//   const ThuTienMat({super.key});

//   @override
//   State<ThuTienMat> createState() => _ThuTienMatState();
// }

// class _ThuTienMatState extends State<ThuTienMat> {
//   String dropdownValue = list.first;
//   String _fileText = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('assets/images/background.png'),
//                     fit: BoxFit.cover)),
//             child: SingleChildScrollView(
//                 child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//               child: Column(children: [
//                 Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//                   Image.asset(
//                     'assets/images/bee-icon.png',
//                     fit: BoxFit.contain,
//                   ),
//                   SizedBox(
//                     width: 15.0,
//                   ),
//                   Image.asset(
//                     'assets/images/calendar-icon.png',
//                     fit: BoxFit.contain,
//                   ),
//                   SizedBox(
//                     width: 15.0,
//                   ),
//                   Image.asset(
//                     'assets/images/setting-icon.png',
//                     fit: BoxFit.contain,
//                   )
//                 ]),
//                 SizedBox(
//                   height: 14.0,
//                 ),
//                 Text(
//                   'Welcome, hienltt',
//                   style: TextStyle(
//                       fontSize: 15.0, color: Color.fromRGBO(99, 99, 100, 1)),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.symmetric(horizontal: 15),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: Colors.white),
//                   child: Column(
//                     children: [
//                       Text(
//                         "Thu chuyển khoản",
//                         style: TextStyle(
//                             fontSize: 35, fontWeight: FontWeight.w500),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Today",
//                             style: TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w500,
//                                 color: Color.fromRGBO(120, 116, 134, 1)),
//                           ),
//                           SizedBox(
//                             width: 6,
//                           ),
//                           Text(
//                             "02/02/2022",
//                             style: TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w500,
//                                 color: Color.fromRGBO(120, 116, 134, 1)),
//                           ),
//                           SizedBox(
//                             width: 6,
//                           ),
//                           Text(
//                             "17h00",
//                             style: TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w500,
//                                 color: Color.fromRGBO(120, 116, 134, 1)),
//                           ),
//                         ],
//                       ),
//                       Wrap(
//                         spacing: 4.0,
//                         direction: Axis.horizontal,
//                         children: [
//                           FractionallySizedBox(
//                             widthFactor: 0.47,
//                             child: TextField(
//                               decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: Color.fromRGBO(179, 179, 179, 1),
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 14.74, horizontal: 24.34),
//                                   border: OutlineInputBorder(),
//                                   hintText: 'Số:',
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromRGBO(179, 179, 179, 1),
//                                         width: 1),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromRGBO(179, 179, 179, 1),
//                                         width: 1),
//                                   )),
//                             ),
//                           ),
//                           FractionallySizedBox(
//                               widthFactor: 0.47,
//                               child: Container(
//                                 height: 55,
//                                 child: DropdownButtonFormField(
//                                   isExpanded: true,
//                                   elevation: 16,
//                                   iconEnabledColor: Colors.white,
//                                   iconSize: 20,
//                                   style: TextStyle(color: Colors.white),
//                                   icon: Icon(Icons.arrow_drop_down_outlined),
//                                   decoration: InputDecoration(
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Color.fromRGBO(72, 181, 69, 1),
//                                           width: 1),
//                                       borderRadius: BorderRadius.circular(4),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Color.fromRGBO(72, 181, 69, 1),
//                                           width: 1),
//                                     ),
//                                     border: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Color.fromRGBO(72, 181, 69, 1),
//                                           width: 1),
//                                       borderRadius: BorderRadius.circular(4),
//                                     ),
//                                     filled: true,
//                                     fillColor: Color.fromRGBO(72, 181, 69, 1),
//                                   ),
//                                   dropdownColor: Color.fromRGBO(72, 181, 69, 1),
//                                   value: dropdownValue,
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       dropdownValue = newValue!;
//                                     });
//                                   },
//                                   items: list.map<DropdownMenuItem<String>>(
//                                       (String value) {
//                                     return DropdownMenuItem<String>(
//                                       value: value,
//                                       child: Text(value),
//                                     );
//                                   }).toList(),
//                                 ),
//                               )),
//                         ],
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 5),
//                         child: Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Người/đơn vị nộp:",
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black),
//                               ),
//                             ),
//                             Container(
//                               height: 55,
//                               child: DropdownButtonFormField(
//                                 isExpanded: true,
//                                 decoration: InputDecoration(
//                                   isDense: true,
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   filled: true,
//                                   fillColor: Color.fromARGB(255, 255, 255, 255),
//                                 ),
//                                 dropdownColor:
//                                     Color.fromARGB(255, 255, 255, 255),
//                                 value: dropdownValue,
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     dropdownValue = newValue!;
//                                   });
//                                 },
//                                 items: list.map<DropdownMenuItem<String>>(
//                                     (String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: Text(value),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 5),
//                         child: Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Ngày chứng từ:",
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black),
//                               ),
//                             ),
//                             Container(
//                               height: 55,
//                               child: DropdownButtonFormField(
//                                 isExpanded: true,
//                                 decoration: InputDecoration(
//                                   isDense: true,
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   filled: true,
//                                   fillColor: Color.fromARGB(255, 255, 255, 255),
//                                 ),
//                                 dropdownColor:
//                                     Color.fromARGB(255, 255, 255, 255),
//                                 value: dropdownValue,
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     dropdownValue = newValue!;
//                                   });
//                                 },
//                                 items: list.map<DropdownMenuItem<String>>(
//                                     (String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: Text(value),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 5),
//                         child: Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Phân loại (tiểu mục):",
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black),
//                               ),
//                             ),
//                             Container(
//                               height: 55,
//                               child: DropdownButtonFormField(
//                                 isExpanded: true,
//                                 decoration: InputDecoration(
//                                   isDense: true,
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   filled: true,
//                                   fillColor: Color.fromARGB(255, 255, 255, 255),
//                                 ),
//                                 dropdownColor:
//                                     Color.fromARGB(255, 255, 255, 255),
//                                 value: dropdownValue,
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     dropdownValue = newValue!;
//                                   });
//                                 },
//                                 items: list.map<DropdownMenuItem<String>>(
//                                     (String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: Text(value),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 5),
//                         child: Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Chọn tài khoản nhận tiền:",
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black),
//                               ),
//                             ),
//                             Container(
//                               height: 55,
//                               child: DropdownButtonFormField(
//                                 isExpanded: true,
//                                 decoration: InputDecoration(
//                                   isDense: true,
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   filled: true,
//                                   fillColor: Color.fromARGB(255, 255, 255, 255),
//                                 ),
//                                 dropdownColor:
//                                     Color.fromARGB(255, 255, 255, 255),
//                                 value: dropdownValue,
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     dropdownValue = newValue!;
//                                   });
//                                 },
//                                 items: list.map<DropdownMenuItem<String>>(
//                                     (String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: Text(value),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 5),
//                         child: Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Nội dung thu:",
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black),
//                               ),
//                             ),
//                             Container(
//                               height: 55,
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                   isDense: true,
//                                   hintText: 'Dslalhlcas',
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   filled: true,
//                                   fillColor: Color.fromARGB(255, 255, 255, 255),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 5),
//                         child: Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Tên Dự Án:",
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black),
//                               ),
//                             ),
//                             Container(
//                               height: 55,
//                               child: DropdownButtonFormField(
//                                 isExpanded: true,
//                                 decoration: InputDecoration(
//                                   isDense: true,
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   filled: true,
//                                   fillColor: Color.fromARGB(255, 255, 255, 255),
//                                 ),
//                                 dropdownColor:
//                                     Color.fromARGB(255, 255, 255, 255),
//                                 value: dropdownValue,
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     dropdownValue = newValue!;
//                                   });
//                                 },
//                                 items: list.map<DropdownMenuItem<String>>(
//                                     (String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: Text(value),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 5),
//                         child: Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Mô tả nguồn thu (nếu có):",
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black),
//                               ),
//                             ),
//                             Container(
//                               height: 55,
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                   isDense: true,
//                                   hintText: 'Dslalhlcas',
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   filled: true,
//                                   fillColor: Color.fromARGB(255, 255, 255, 255),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 5),
//                         child: Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Số tiền",
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black),
//                               ),
//                             ),
//                             Container(
//                               height: 55,
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                   isDense: true,
//                                   hintText: 'Dslalhlcas',
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   filled: true,
//                                   fillColor: Color.fromARGB(255, 255, 255, 255),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 5),
//                         child: Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Bằng chữ",
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black),
//                               ),
//                             ),
//                             Container(
//                               height: 55,
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                   isDense: true,
//                                   hintText: 'Dslalhlcas',
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Color.fromARGB(130, 79, 82, 78),
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   filled: true,
//                                   fillColor: Color.fromARGB(255, 255, 255, 255),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 5),
//                         child: Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Đính kèm",
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black),
//                               ),
//                             ),
//                             Container(
//                               height: 55,
//                               child: ElevatedButton(
//                                 onPressed: _pickMultipleFiles,
//                                 child: Text("Pick Multiple Files"),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ]),
//             )),
//           )
//         ],
//       ),
//     );
//   }

//   void _pickMultipleFiles() async {
//     FilePickerResult? result =
//         await FilePicker.platform.pickFiles(allowMultiple: true);

//     if (result != null) {
//       List<File> files = result.paths.map((path) => File(path!)).toList();
//       setState(() {
//         _fileText = files.toString();
//       });
//     } else {
//       // User canceled the picker
//     }
//   }
// }

import 'package:flutter/material.dart';

class ThuTienMat extends StatefulWidget {
  const ThuTienMat({super.key});

  @override
  State<ThuTienMat> createState() => _ThuTienMatState();
}

class _ThuTienMatState extends State<ThuTienMat> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
