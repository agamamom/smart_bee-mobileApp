import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:smart_bee/widget/snackbar.dart';
import '../Components/HeaderApp.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late String name;
  late String email;
  late String password;
  late String repeatpassword;
  late String phone;
  late String cccd;
  late String noicap;
  late String _uid;
  var _isObscure = true;
  TextEditingController dateinput = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  bool processing = false;
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Do you want to exit app?'),
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('No')),
            ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Yes')),
          ],
        ),
      );

  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');

  void signUp() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        _uid = FirebaseAuth.instance.currentUser!.uid;

        await customers.doc(_uid).set({
          'name': name,
          'email': email,
          'phone': phone,
          'cccd': cccd,
          'noicap': noicap,
          'cid': _uid
        });
        _formKey.currentState!.reset();

        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/login_screen');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          setState(() {
            processing = false;
          });
          MyMessageHandler.showSnackBar(
              _scaffoldKey, 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          setState(() {
            processing = false;
          });
          MyMessageHandler.showSnackBar(
              _scaffoldKey, 'The account already exists for that email.');
        }
      }
    } else {
      setState(() {
        processing = false;
      });
      MyMessageHandler.showSnackBar(_scaffoldKey, 'please fill all fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: ScaffoldMessenger(
        key: _scaffoldKey,
        child: Scaffold(
            body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 89, 132, 62),
                    height: 130,
                    child: const HeaderApp(),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 37.0, vertical: 40.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const Text(
                              'Tạo tài khoản',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  letterSpacing: 2.0,
                                  color: Color.fromARGB(255, 89, 132, 62),
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                name = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Hãy nhập Họ và tên của bạn.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16.74, horizontal: 24.34),
                                  border: const OutlineInputBorder(),
                                  hintText: 'Họ và tên',
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black26, width: 1),
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                email = value;
                              },
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16.74, horizontal: 24.34),
                                  border: const OutlineInputBorder(),
                                  hintText: 'Email',
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black26, width: 1),
                                      borderRadius: BorderRadius.circular(30))),
                              validator: (value) =>
                                  EmailValidator.validate(value!)
                                      ? null
                                      : "Please enter a valid email",
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                phone = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
                                        .hasMatch(value)) {
                                  return "Enter correct phone number";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16.74, horizontal: 24.34),
                                  border: const OutlineInputBorder(),
                                  hintText: 'Số điện thoại',
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black26, width: 1),
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                cccd = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'(^[0-9]{6,12}$)')
                                        .hasMatch(value)) {
                                  return "Không được để chống CCCD";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16.74, horizontal: 24.34),
                                  border: const OutlineInputBorder(),
                                  hintText: 'Số CCCD',
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black26, width: 1),
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Không được để chống Ngày cấp.';
                                }
                                return null;
                              },

                              controller:
                                  dateinput, //editing controller of this TextField
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.calendar_today),
                                    onPressed: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2100));

                                      if (pickedDate != null) {
                                        print(
                                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                        print(
                                            formattedDate); //formatted date output using intl package =>  2021-03-16
                                        //you can implement different kind of Date Format here according to your requirement
                                        setState(() {
                                          dateinput.text =
                                              formattedDate; //set output date to TextField value.
                                        });
                                      } else {
                                        print("Date is not selected");
                                      }
                                    },
                                  ),
                                  //icon of text field
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16.74, horizontal: 24.34),
                                  border: const OutlineInputBorder(),
                                  hintText: 'Ngày cấp',
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black26, width: 1),
                                      borderRadius: BorderRadius.circular(
                                          30)) //label text of field
                                  ),
                              readOnly:
                                  true, //set it true, so that user will not able to edit text
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                  //you can implement different kind of Date Format here according to your requirement
                                  setState(() {
                                    dateinput.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                noicap = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Không được để chống nơi cấp.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16.74, horizontal: 24.34),
                                  border: const OutlineInputBorder(),
                                  hintText: 'Nơi cấp',
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black26, width: 1),
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                password = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Hãy nhập mật khẩu của bạn.';
                                }
                                return null;
                              },
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16.74, horizontal: 24.34),
                                  border: OutlineInputBorder(),
                                  hintText: 'Mật khẩu',
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black26, width: 1),
                                      borderRadius: BorderRadius.circular(30)),

                                  // this button is used to toggle the password visibility
                                  suffixIcon: IconButton(
                                      icon: Icon(_isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      })),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                repeatpassword = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Hãy nhập lại mật khẩu của bạn.';
                                }
                                return null;
                              },
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16.74, horizontal: 24.34),
                                  border: const OutlineInputBorder(),
                                  hintText: 'Nhập lại mật khẩu',
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black26, width: 1),
                                      borderRadius: BorderRadius.circular(30)),

                                  // this button is used to toggle the password visibility
                                  suffixIcon: IconButton(
                                      icon: Icon(_isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      })),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            processing == true
                                ? const CircularProgressIndicator(
                                    color: Colors.purple,
                                  )
                                : GestureDetector(
                                    child: ElevatedButton(
                                      child: Text("Đăng ký",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600)),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              89, 132, 62, 1),
                                          shadowColor: const Color.fromARGB(
                                              255, 125, 130, 128),
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32.0)),
                                          minimumSize: const Size(400, 50)),
                                      onPressed: () {
                                        signUp();
                                      },
                                    ),
                                  )
                          ],
                        ),
                      ))
                ],
              )),
        )),
      ),
      onWillPop: () async {
        // final isEditedPage = editedUser != savedUser;
        // if(isEditedPage){
        //   final shouldPop = await showWarningDialog()
        // }
        print("Back Button pressed!");
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
    );
  }
}
