import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:smart_bee/Components/FormLogin.dart';
import '../Components/HeaderApp.dart';
import 'package:intl/intl.dart';

class registerpage extends StatefulWidget {
  const registerpage({super.key});

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  var _isObscure = true;
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Do you want to exit app?'),
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('No')),
            ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text('Yes')),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 89, 132, 62),
                  height: 130,
                  child: HeaderApp(),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 37.0, vertical: 40.0),
                    child: Column(
                      children: [
                        Text(
                          'Tạo tài khoản',
                          style: TextStyle(
                              fontSize: 30.0,
                              letterSpacing: 2.0,
                              color: Color.fromARGB(255, 89, 132, 62),
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16.74, horizontal: 24.34),
                              border: OutlineInputBorder(),
                              hintText: 'Họ và tên',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black26, width: 1),
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16.74, horizontal: 24.34),
                              border: OutlineInputBorder(),
                              hintText: 'Email',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black26, width: 1),
                                  borderRadius: BorderRadius.circular(30))),
                          validator: (value) => EmailValidator.validate(value!)
                              ? null
                              : "Please enter a valid email",
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^+$').hasMatch(value!)) {
                              return "Enter correct phone number";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16.74, horizontal: 24.34),
                              border: OutlineInputBorder(),
                              hintText: 'Số điện thoại',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black26, width: 1),
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^+$').hasMatch(value!)) {
                              return "Enter correct phone number";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16.74, horizontal: 24.34),
                              border: OutlineInputBorder(),
                              hintText: 'Số CCCD',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black26, width: 1),
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextField(
                          controller:
                              dateinput, //editing controller of this TextField
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(
                                          2000), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101));
                                },
                              ),
                              //icon of text field
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16.74, horizontal: 24.34),
                              border: OutlineInputBorder(),
                              hintText: 'Ngày cấp',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
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
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
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
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16.74, horizontal: 24.34),
                              border: OutlineInputBorder(),
                              hintText: 'Nơi cấp',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black26, width: 1),
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextField(
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16.74, horizontal: 24.34),
                              border: OutlineInputBorder(),
                              hintText: 'Mật khẩu',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
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
                        SizedBox(
                          height: 12,
                        ),
                        TextField(
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16.74, horizontal: 24.34),
                              border: OutlineInputBorder(),
                              hintText: 'Nhập lại mật khẩu',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
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
                        SizedBox(
                          height: 16.0,
                        ),
                        GestureDetector(
                          // onTap: () => {
                          //   Navigator.of(context).pushReplacement(
                          //       MaterialPageRoute(
                          //           builder: (BuildContext context) =>
                          //               FormLogin()))
                          // },
                          child: ElevatedButton(
                            child: Text("Đăng ký",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(89, 132, 62, 1),
                                shadowColor: Color.fromARGB(255, 125, 130, 128),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0)),
                                minimumSize: Size(400, 50)),
                            onPressed: () => {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          FormLogin()))
                            },
                          ),
                        )
                      ],
                    ))
              ],
            )),
      )),
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
