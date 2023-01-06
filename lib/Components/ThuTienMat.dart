// import 'package:flutter/material.dart';

// class ThuTienMat extends StatefulWidget {
//   const ThuTienMat({super.key});

//   @override
//   State<ThuTienMat> createState() => _ThuTienMatState();
// }

// class _ThuTienMatState extends State<ThuTienMat> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:smart_bee/Components/FilePicker.dart';

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
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();
  @override
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
    } on PlatformException catch (e) {
      _logException('Unsupported operation' + e.toString());
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
    _resetState();
    try {
      bool? result = await FilePicker.platform.clearTemporaryFiles();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: result! ? Colors.green : Colors.red,
          content: Text((result
              ? 'Temporary files removed with success.'
              : 'Failed to clean temporary files')),
        ),
      );
    } on PlatformException catch (e) {
      _logException('Unsupported operation' + e.toString());
    } catch (e) {
      _logException(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
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
      _logException('Unsupported operation' + e.toString());
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
      _logException('Unsupported operation' + e.toString());
    } catch (e) {
      _logException(e.toString());
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

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
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
                  Image.asset(
                    'assets/images/bee-icon.png',
                    fit: BoxFit.contain,
                  ),
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
                  Image.asset(
                    'assets/images/setting-icon.png',
                    fit: BoxFit.contain,
                  )
                ]),
                SizedBox(
                  height: 14.0,
                ),
                Text(
                  'Welcome, hienltt',
                  style: TextStyle(
                      fontSize: 15.0, color: Color.fromRGBO(99, 99, 100, 1)),
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
                        "Thu tiền mặt",
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
                      Wrap(
                        spacing: 4.0,
                        direction: Axis.horizontal,
                        children: [
                          FractionallySizedBox(
                            widthFactor: 0.47,
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromRGBO(179, 179, 179, 1),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 14.74, horizontal: 24.34),
                                  border: OutlineInputBorder(),
                                  hintText: 'Số:',
                                  hintStyle: TextStyle(
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
                              child: Container(
                                height: 55,
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  elevation: 16,
                                  iconEnabledColor: Colors.white,
                                  iconSize: 20,
                                  style: TextStyle(color: Colors.white),
                                  icon: Icon(Icons.arrow_drop_down_outlined),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(72, 181, 69, 1),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(72, 181, 69, 1),
                                          width: 1),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(72, 181, 69, 1),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    filled: true,
                                    fillColor: Color.fromRGBO(72, 181, 69, 1),
                                  ),
                                  dropdownColor: Color.fromRGBO(72, 181, 69, 1),
                                  value: dropdownValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: list.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Người/đơn vị nộp:",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              height: 55,
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                ),
                                dropdownColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                value: dropdownValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>(
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
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Ngày chứng từ:",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              height: 55,
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                ),
                                dropdownColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                value: dropdownValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>(
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
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Phân loại (tiểu mục):",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              height: 55,
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                ),
                                dropdownColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                value: dropdownValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>(
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
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Nội dung thu:",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              height: 55,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Dslalhlcas',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
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
                            Container(
                              height: 55,
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                ),
                                dropdownColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                value: dropdownValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>(
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
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
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
                            Container(
                              height: 55,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Dslalhlcas',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Số tiền",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              height: 55,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Dslalhlcas',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Bằng chữ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              height: 55,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Dslalhlcas',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(130, 79, 82, 78),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [
                            Align(
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
                                  alignment: AlignmentDirectional.centerStart,
                                  child: ElevatedButton.icon(
                                    onPressed: () => _pickFiles(),
                                    icon: Icon(
                                      Icons.add,
                                      color: Color.fromRGBO(120, 116, 134, 1),
                                    ),
                                    label: Text(
                                      _multiPick ? 'Thêm files' : 'Thêm file',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(120, 116, 134, 1)),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color.fromRGBO(254, 251, 251, 1)),
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
                                                : _directoryPath != null
                                                    ? ListTile(
                                                        title: const Text(
                                                            'Directory path'),
                                                        subtitle: Text(
                                                            _directoryPath!),
                                                      )
                                                    : _paths != null
                                                        ? Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.20,
                                                            child: Scrollbar(
                                                                child: ListView
                                                                    .separated(
                                                              itemCount: _paths !=
                                                                          null &&
                                                                      _paths!
                                                                          .isNotEmpty
                                                                  ? _paths!
                                                                      .length
                                                                  : 1,
                                                              itemBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      int index) {
                                                                final bool
                                                                    isMultiPath =
                                                                    _paths !=
                                                                            null &&
                                                                        _paths!
                                                                            .isNotEmpty;
                                                                final String name = 'File $index: ' +
                                                                    (isMultiPath
                                                                        ? _paths!.map((e) => e.name).toList()[
                                                                            index]
                                                                        : _fileName ??
                                                                            '...');
                                                                final path = kIsWeb
                                                                    ? null
                                                                    : _paths!
                                                                        .map((e) => e
                                                                            .path)
                                                                        .toList()[
                                                                            index]
                                                                        .toString();

                                                                return ListTile(
                                                                  title: Text(
                                                                    name,
                                                                  ),
                                                                  subtitle: Text(
                                                                      path ??
                                                                          ''),
                                                                );
                                                              },
                                                              separatorBuilder:
                                                                  (BuildContext
                                                                              context,
                                                                          int index) =>
                                                                      const Divider(),
                                                            )),
                                                          )
                                                        : _saveAsFileName !=
                                                                null
                                                            ? ListTile(
                                                                title: const Text(
                                                                    'Save file'),
                                                                subtitle: Text(
                                                                    _saveAsFileName!),
                                                              )
                                                            : const SizedBox(),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Align(
                                  alignment: AlignmentDirectional.center,
                                  child: Column(children: [
                                    SizedBox(
                                      height: 47,
                                      width: 175,
                                      child: ElevatedButton(
                                        onPressed: () => _saveFile(),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromRGBO(
                                                      89, 132, 62, 1)),
                                        ),
                                        child: const Text('Save',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextButton(
                                      onPressed: () => _clearCachedFiles(),
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
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
                )
              ]),
            )),
          )
        ],
      ),
    );
  }
}
