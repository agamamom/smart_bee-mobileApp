import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:smart_bee/Components/SettingButton.dart';
import 'package:smart_bee/pages/Curved_navigation_page.dart';
import 'package:smart_bee/widget/snackbar.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:readmore/readmore.dart';
import 'package:uuid/uuid.dart';
import 'package:smart_bee/utilities/categ_list.dart';

import '../bloc/taiKhoanNhanTien-bloc.dart';
import 'package:smart_bee/model/taiKhoanNhanTien-model.dart';

List<String> listNguoiDuyet = nguoiDuyet;
List<String> listDonViNop = donViNop;
List<String> listPhanLoai = phanLoai;
List<String> listDuAn = tenDuAn;
List<String> listTaiKhoan = taiKhoanNhanTien;

class ThuChuyenKhoan extends StatefulWidget {
  const ThuChuyenKhoan({super.key});

  @override
  State<ThuChuyenKhoan> createState() => _ThuChuyenKhoanState();
}

class _ThuChuyenKhoanState extends State<ThuChuyenKhoan> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  String dropdownNguoiDuyet = listNguoiDuyet.first;
  String? dropdownDonViNop;
  String? dropdownPhanLoai;
  String? dropdownDuAn;
  String? dropdownTaiKhoan;

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
  // final TextEditingController _controller = TextEditingController();
  TextEditingController _soController = TextEditingController();
  bool processing = false;
  late String proId;

  late double _price;
  late String _ngayChungTu;
  late String _noiDungThu;
  late String _moTaNguonThu;
  late String _priceByString;

  final TaiKhoanNhanTienBloc _taiKhoanNhanTienBloc = TaiKhoanNhanTienBloc();

  @override
  void dispose() {
    _soController.dispose();

    super.dispose();
  }

  List<String> filesUrlList = [];
  @override
  void initState() {
    _taiKhoanNhanTienBloc.add(GetTaiKhoanNhanTienList());
    super.initState();
  }

  Future<void> uploadImages() async {
    print(_soController.text);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_paths!.isNotEmpty) {
        setState(() {
          processing = true;
        });
        try {
          for (var image in _paths!) {
            firebase_storage.Reference ref = firebase_storage
                .FirebaseStorage.instance
                .ref('products/${path.basename(image.path!)}');

            await ref.putFile(File(image.path!)).whenComplete(() async {
              await ref.getDownloadURL().then((value) {
                filesUrlList.add(value);
                print("filesUrlList $filesUrlList");
              });
            });
          }
        } catch (e) {
          print(e);
        }
      } else {
        MyMessageHandler.showSnackBar(_scaffoldKey, 'Lỗi chưa chọn tệp!');
      }
    } else {
      MyMessageHandler.showSnackBar(_scaffoldKey, 'Hãy điền đầy đủ thông tin');
    }
  }

  void uploadData() async {
    if (filesUrlList.isNotEmpty) {
      CollectionReference productRef =
          FirebaseFirestore.instance.collection('ThuChuyenKhoan');

      proId = const Uuid().v4();

      await productRef.doc(proId).set({
        'proid': proId,
        'giaTien': _price,
        'ngayChungTu': _ngayChungTu,
        'noiDungThu': _noiDungThu,
        'moTaNguonThu': _moTaNguonThu,
        'giaTienBangChu': _priceByString,
        'sid': FirebaseAuth.instance.currentUser!.uid,
        'relatedFiles': filesUrlList,
        'NguoiDuyet': dropdownNguoiDuyet,
        'DonViNop': dropdownDonViNop,
        'PhanLoai': dropdownPhanLoai,
        'TaiKhoan': dropdownTaiKhoan,
        'DuAn': dropdownDuAn,
        'So': _soController.text,
      }).whenComplete(() {
        setState(() {
          processing = false;
          _paths = [];
          filesUrlList = [];
        });
        _formKey.currentState!.reset();
      });
    } else {
      setState(() {
        processing = false;
      });
      print('no images');
    }
  }

  void uploadProduct() async {
    await uploadImages().whenComplete(() => uploadData());
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
      print("_paths  $_paths");
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
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE  MM/dd/yyyy  hh:mm a').format(now);
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
                                  "Thu chuyển khoản",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Text(
                                          formattedDate,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  120, 116, 134, 1)),
                                        ),
                                      ),
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
                                        controller: _soController,
                                        decoration: const InputDecoration(
                                            filled: true,
                                            fillColor: Color.fromRGBO(
                                                179, 179, 179, 1),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 14.74,
                                                    horizontal: 10.34),
                                            border: OutlineInputBorder(),
                                            hintText: 'Số:',
                                            hintStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromRGBO(
                                                      179, 179, 179, 1),
                                                  width: 1),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
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
                                                  horizontal: 10.34),
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
                                            borderSide: BorderSide(
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
                                        value: dropdownNguoiDuyet,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownNguoiDuyet = newValue!;
                                          });
                                        },
                                        items: listNguoiDuyet
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
                                        dropdownColor: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        value: dropdownDonViNop,
                                        onChanged: (String? value) {
                                          setState(() {
                                            dropdownDonViNop = value!;
                                          });
                                        },
                                        items: listDonViNop
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
                                      TextFormField(
                                        onSaved: (value) {
                                          _ngayChungTu = value!;
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
                                        dropdownColor: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        value: dropdownPhanLoai,
                                        onChanged: (String? value) {
                                          setState(() {
                                            dropdownPhanLoai = value!;
                                          });
                                        },
                                        items: listPhanLoai
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
                                          "Chọn tài khoản nhận tiền:",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                      _buildDropdownTaiKhoanNhanTien(),
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
                                        onSaved: (value) {
                                          _noiDungThu = value!;
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
                                        dropdownColor: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        value: dropdownDuAn,
                                        onChanged: (String? value) {
                                          setState(() {
                                            dropdownDuAn = value!;
                                          });
                                        },
                                        items: listDuAn
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
                                          "Mô tả nguồn thu (nếu có):",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                      TextFormField(
                                        onSaved: (value) {
                                          _moTaNguonThu = value!;
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
                                        onSaved: (value) {
                                          _priceByString = value!;
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
                                          "Đính kèm",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Column(
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
                                          Builder(
                                            builder: (BuildContext context) =>
                                                _isLoading
                                                    ? Container(
                                                        child:
                                                            const CircularProgressIndicator(),
                                                      )
                                                    : _userAborted
                                                        ? const Text(
                                                            'User has aborted the dialog',
                                                          )
                                                        : _directoryPath != null
                                                            ? ListTile(
                                                                title: const Text(
                                                                    'Directory path'),
                                                                subtitle: Text(
                                                                    _directoryPath!),
                                                              )
                                                            : _paths != null
                                                                ? SingleChildScrollView(
                                                                    child: Wrap(
                                                                      children:
                                                                          _buildList(
                                                                              _paths!),
                                                                    ),
                                                                  )
                                                                : _saveAsFileName !=
                                                                        null
                                                                    ? ListTile(
                                                                        title: const Text(
                                                                            'Save file'),
                                                                        subtitle:
                                                                            Text(_saveAsFileName!),
                                                                      )
                                                                    : const SizedBox(),
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional.center,
                                            child: Column(children: [
                                              processing == true
                                                  ? const CircularProgressIndicator(
                                                      color: Colors.purple,
                                                    )
                                                  : SizedBox(
                                                      height: 47,
                                                      width: 175,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          uploadProduct();
                                                        },
                                                        style:
                                                            const ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                                  Color
                                                                      .fromRGBO(
                                                                          89,
                                                                          132,
                                                                          62,
                                                                          1)),
                                                        ),
                                                        child: const Text(
                                                            'Save',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
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
                                      ),
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

  Widget _buildDropdownTaiKhoanNhanTien() {
    return BlocProvider(
      create: (_) => _taiKhoanNhanTienBloc,
      child: BlocListener<TaiKhoanNhanTienBloc, TaiKhoanNhanTienState>(
        listener: (context, state) {
          if (state is TaiKhoanNhanTienError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: BlocBuilder<TaiKhoanNhanTienBloc, TaiKhoanNhanTienState>(
            builder: (context, state) {
          if (state is TaiKhoanNhanTienInitial) {
            return _buildLoading();
          } else if (state is TaiKhoanNhanTienLoading) {
            return _buildLoading();
          } else if (state is TaiKhoanNhanTienLoaded) {
            return _buildCard(context, state.taiKhoanNhanTienModel);
          } else if (state is TaiKhoanNhanTienError) {
            return Container();
          } else {
            return Container();
          }
        }),
      ),
    );
  }

  Widget _buildCard(BuildContext context, TaiKhoanNhanTienModel model) {
    List<String?> myItems = [];
    model.result!.forEach((element) {
      myItems.add(element.soTenTaiKhoan);
    });
    return DropdownButtonFormField(
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16.74, horizontal: 24.34),
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(130, 79, 82, 78), width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(130, 79, 82, 78), width: 1),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(130, 79, 82, 78), width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        dropdownColor: const Color.fromARGB(255, 255, 255, 255),
        value: dropdownTaiKhoan,
        elevation: 19,
        onChanged: (String? value) {
          setState(() {
            dropdownTaiKhoan = value as String;
          });
        },
        items: myItems.map((String? value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value ?? ''),
          );
        }).toList());
  }

  List<Widget> _buildList(List<PlatformFile> items) {
    Widget icon;

    void _delete(int ref) {
      // remove the element at the passed index
      _paths!.removeAt(ref);
      setState(() {});
    }

    return items.asMap().entries.map((item) {
      var value = item.value;
      var key = item.key;
      String? fileDelete = value.path;
      String fileExtension = value.path!.split('.').last;
      if (fileExtension == 'txt') {
        icon = Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                Positioned(
                    top: -10,
                    right: -10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        _delete(key);
                        setState(() {});
                      },
                    ))
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
              width: 90,
              child: ReadMoreText(
                value.name.toString(),
                trimCollapsedText: '',
                trimLines: 1,
                textAlign: TextAlign.center,
                trimMode: TrimMode.Line,
                trimLength: 100,
                moreStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      } else if (fileExtension == 'pdf') {
        icon = Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                Positioned(
                    top: -10,
                    right: -10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        _delete(key);
                        setState(() {});
                      },
                    ))
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
              width: 90,
              child: ReadMoreText(
                value.name.toString(),
                trimCollapsedText: '',
                trimLines: 1,
                textAlign: TextAlign.center,
                trimMode: TrimMode.Line,
                trimLength: 100,
                moreStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      } else if (fileExtension == 'png' || fileExtension == 'jpg') {
        icon = Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                Positioned(
                    top: -10,
                    right: -10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        _delete(key);
                        setState(() {});
                      },
                    ))
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
              width: 90,
              child: ReadMoreText(
                value.name.toString(),
                trimCollapsedText: '',
                trimLines: 1,
                textAlign: TextAlign.center,
                trimMode: TrimMode.Line,
                trimLength: 100,
                moreStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      } else {
        icon = Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                Positioned(
                    top: -10,
                    right: -10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        _delete(key);
                        setState(() {});
                      },
                    ))
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
              width: 90,
              child: ReadMoreText(
                value.name.toString(),
                trimCollapsedText: '',
                trimLines: 1,
                textAlign: TextAlign.center,
                trimMode: TrimMode.Line,
                trimLength: 100,
                moreStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      }
      return icon;
    }).toList();
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}

extension PriceValidator on String {
  bool isValidPrice() {
    return RegExp(r'^((([1-9][0-9]*[\.]*)||([0][\.]*))([0-9]{1,2}))$')
        .hasMatch(this);
  }
}
