import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:smart_bee/Components/FilePicker.dart';
import 'package:quickalert/quickalert.dart';
import 'package:smart_bee/Components/SettingButton.dart';
import 'package:smart_bee/pages/Curved_navigation_page.dart';
import 'package:smart_bee/widget/snackbar.dart';
import 'package:path/path.dart' as path;
import 'package:readmore/readmore.dart';

import '../pages/TaiChinh.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class ThuTienMat extends StatefulWidget {
  const ThuTienMat({super.key});

  @override
  State<ThuTienMat> createState() => _ThuTienMatState();
}

class _ThuTienMatState extends State<ThuTienMat> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  String dropdownValue = list.first;
  String _fileText = "";
  String? _fileName;
  String? _saveAsFileName;
  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _isLoading = false;
  bool _userAborted = false;
  final bool _multiPick = true;
  final FileType _pickingType = FileType.any;
  final TextEditingController _controller = TextEditingController();

  late double _price;
  late String _donVi;
  late String _noiDungThu;
  late String _moTaNguonThu;
  late String _priceByString;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _pickFiles() async {
    _resetState();
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
      //  for (var file in _paths!) {
      //   String fileExtension = file.path!.split('.').last;
      //   print('File type: $fileExtension');
      // }
    } on PlatformException catch (e) {
      _logException('Unsupported operation$e');
    } catch (e) {
      _logException(e.toString());
    }
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _fileName =
          _paths != null ? _paths!.map((e) => e.name).toString() : '...';
      _userAborted = _paths == null;
    });
  }

  void _clearCachedFiles() async {
    // _resetState();
    // try {
    //   bool? result = await FilePicker.platform.clearTemporaryFiles();
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       backgroundColor: result! ? Colors.green : Colors.red,
    //       content: Text((result
    //           ? 'Temporary files removed with success.'
    //           : 'Failed to clean temporary files')),
    //     ),
    //   );
    // } on PlatformException catch (e) {
    //   _logException('Unsupported operation' + e.toString());
    // } catch (e) {
    //   _logException(e.toString());
    // } finally {
    //   setState(() => _isLoading = false);
    // }

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

  void _selectFolder() async {
    _resetState();
    try {
      String? path = await FilePicker.platform.getDirectoryPath();
      setState(() {
        _directoryPath = path;
        _userAborted = path == null;
      });
    } on PlatformException catch (e) {
      _logException('Unsupported operation$e');
    } catch (e) {
      _logException(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveFile() async {
    _resetState();
    try {
      String? fileName = await FilePicker.platform.saveFile(
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
        type: _pickingType,
      );
      setState(() {
        _saveAsFileName = fileName;
        _userAborted = fileName == null;
      });
    } on PlatformException catch (e) {
      _logException('Unsupported operation$e');
    } catch (e) {
      _logException('Lỗi chưa chọn tệp!');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _logException(String message) {
    print(message);
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _resetState() {
    if (!mounted) {
      return;
    }
    setState(() {
      _isLoading = true;
      _directoryPath = null;
      _fileName = null;
      _paths = null;
      _saveAsFileName = null;
      _userAborted = false;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.cover)),
                child: SingleChildScrollView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
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
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                const Text(
                                  "Thu tiền mặt",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Today",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromRGBO(120, 116, 134, 1)),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "02/02/2022",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromRGBO(120, 116, 134, 1)),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "17h00",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromRGBO(120, 116, 134, 1)),
                                    ),
                                  ],
                                ),
                                Wrap(
                                  spacing: 4.0,
                                  direction: Axis.horizontal,
                                  children: [
                                    const FractionallySizedBox(
                                      widthFactor: 0.47,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color.fromRGBO(
                                                179, 179, 179, 1),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 14.74,
                                                    horizontal: 24.34),
                                            border: OutlineInputBorder(),
                                            hintText: 'Số:',
                                            hintStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      179, 179, 179, 1),
                                                  width: 1),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      179, 179, 179, 1),
                                                  width: 1),
                                            )),
                                      ),
                                    ),
                                    FractionallySizedBox(
                                      widthFactor: 0.47,
                                      child: DropdownButtonFormField(
                                        isExpanded: true,
                                        elevation: 16,
                                        iconEnabledColor: Colors.white,
                                        iconSize: 20,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        icon: const Icon(
                                            Icons.arrow_drop_down_outlined),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 14.74,
                                                  horizontal: 24.34),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1),
                                                width: 1),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          filled: true,
                                          fillColor: const Color.fromRGBO(
                                              72, 181, 69, 1),
                                        ),
                                        dropdownColor: const Color.fromRGBO(
                                            72, 181, 69, 1),
                                        value: dropdownValue,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        },
                                        items: list
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Người/đơn vị nộp:",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                      DropdownButtonFormField(
                                        isExpanded: true,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16.74,
                                                  horizontal: 24.34),
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
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
                                        dropdownColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        value: dropdownValue,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        },
                                        items: list
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Ngày chứng từ:",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                      DropdownButtonFormField(
                                        isExpanded: true,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16.74,
                                                  horizontal: 24.34),
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
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
                                        dropdownColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        value: dropdownValue,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        },
                                        items: list
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Phân loại (tiểu mục):",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                      DropdownButtonFormField(
                                        isExpanded: true,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16.74,
                                                  horizontal: 24.34),
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
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
                                        dropdownColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        value: dropdownValue,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        },
                                        items: list
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Nội dung thư:",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                      TextFormField(
                                        onChanged: (value) {
                                          _noiDungThu = value;
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Không được bỏ trống';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Dslalhlcas',
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16.74,
                                                  horizontal: 24.34),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
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
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Tên Dự Án:",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                      DropdownButtonFormField(
                                        isExpanded: true,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16.74,
                                                  horizontal: 24.34),
                                          isDense: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
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
                                        dropdownColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        value: dropdownValue,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        },
                                        items: list
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Mô tả nguồn thu (nếu có):",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                      TextFormField(
                                        onChanged: (value) {
                                          _moTaNguonThu = value;
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Không được bỏ trống';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Dslalhlcas',
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16.74,
                                                  horizontal: 24.34),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
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
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Số tiền:",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Không được bỏ trống';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _price = double.parse(value!);
                                        },
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Dslalhlcas',
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16.74,
                                                  horizontal: 24.34),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          filled: true,
                                          fillColor: const Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Bằng chữ:",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                      TextFormField(
                                        onChanged: (value) {
                                          _priceByString = value;
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Không được bỏ trống';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Dslalhlcas',
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16.74,
                                                  horizontal: 24.34),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    130, 79, 82, 78),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          filled: true,
                                          fillColor: const Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Đính kèm",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Container(
                                          child: Column(
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional
                                                .centerStart,
                                            child: ElevatedButton.icon(
                                              onPressed: () => _pickFiles(),
                                              icon: const Icon(
                                                Icons.add,
                                                color: Color.fromRGBO(
                                                    120, 116, 134, 1),
                                              ),
                                              label: Text(
                                                _multiPick
                                                    ? 'Thêm files'
                                                    : 'Thêm file',
                                                style: const TextStyle(
                                                    color: Color.fromRGBO(
                                                        120, 116, 134, 1)),
                                              ),
                                              style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Color.fromRGBO(
                                                            254, 251, 251, 1)),
                                              ),
                                            ),
                                          ),

                                          // Builder(builder: (BuildContext context) =>_isLoading ?  ),
                                          Container(
                                            child: Builder(
                                              builder: (BuildContext context) =>
                                                  _isLoading
                                                      ? Container(
                                                          child:
                                                              const CircularProgressIndicator(),
                                                        )
                                                      : _userAborted
                                                          ? Container(
                                                              child: const Text(
                                                                'User has aborted the dialog',
                                                              ),
                                                            )
                                                          : _directoryPath !=
                                                                  null
                                                              ? ListTile(
                                                                  title: const Text(
                                                                      'Directory path'),
                                                                  subtitle: Text(
                                                                      _directoryPath!),
                                                                )
                                                              : _paths != null
                                                                  ? SizedBox(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.20,
                                                                      child:
                                                                          Scrollbar(
                                                                              child:
                                                                                  Wrap(
                                                                        children:
                                                                            _buildList(_paths!),
                                                                      )))
                                                                  : _saveAsFileName !=
                                                                          null
                                                                      ? ListTile(
                                                                          title:
                                                                              const Text('Save file'),
                                                                          subtitle:
                                                                              Text(_saveAsFileName!),
                                                                        )
                                                                      : const SizedBox(),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional.center,
                                            child: Column(children: [
                                              SizedBox(
                                                height: 47,
                                                width: 175,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      _formKey.currentState!
                                                          .save();
                                                      _saveFile();
                                                    } else {
                                                      MyMessageHandler.showSnackBar(
                                                          _scaffoldMessengerKey,
                                                          "Hãy điền đầy đủ thông tin!");
                                                    }
                                                  },
                                                  style: const ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Color.fromRGBO(89,
                                                                132, 62, 1)),
                                                  ),
                                                  child: const Text('Save',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              TextButton(
                                                onPressed: () =>
                                                    _clearCachedFiles(),
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            ]),
                                          )
                                        ],
                                      )),
                                    ],
                                  ),
                                )
                              ],
                            ),
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

extension PriceValidator on String {
  bool isValidPrice() {
    return RegExp(r'^((([1-9][0-9]*[\.]*)||([0][\.]*))([0-9]{1,2}))$')
        .hasMatch(this);
  }
}

List<Widget> _buildList(List<PlatformFile> items) {
  Widget icon;

  return items.map((item) {
    String fileExtension = item!.path!.split('.').last;
    if (fileExtension == 'txt') {
      icon = Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color.fromARGB(159, 184, 182, 182)),
                child: const Icon(
                  Icons.description,
                  size: 40,
                  color: Colors.black54,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(item!.name.toString()),
        ],
      );
    } else if (fileExtension == 'pdf') {
      icon = Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color.fromARGB(159, 184, 182, 182)),
                child: const Icon(
                  Icons.picture_as_pdf,
                  size: 40,
                  color: Colors.black54,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(item!.name.toString()),
        ],
      );
    } else if (fileExtension == 'png' || fileExtension == 'jpg') {
      icon = Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Container(
                height: 70,
                width: 70,
                child: Image(
                  image: FileImage(File(item.path.toString())),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(item!.name.toString()),
        ],
      );
    } else {
      icon = Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color.fromARGB(159, 184, 182, 182)),
                child: const Icon(
                  Icons.insert_drive_file,
                  size: 40,
                  color: Colors.black54,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          ReadMoreText(
            item!.name.toString(),
            trimLines: 1,
            trimMode: TrimMode.Line,
            moreStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      );
    }
    return icon;
  }).toList();
}
