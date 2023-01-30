import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'HeaderApp.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var _isObscure = true;
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Lấy lại mật khẩu',
                        style: TextStyle(
                            fontSize: 30.0,
                            letterSpacing: 2.0,
                            color: Color.fromARGB(255, 89, 132, 62),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 86,
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
                                borderSide:
                                    BorderSide(color: Colors.black26, width: 1),
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
                              !RegExp(r'^+$').hasMatch(value)) {
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
                                borderSide:
                                    BorderSide(color: Colors.black26, width: 1),
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      ElevatedButton(
                          child: Text("Gửi mã xác nhận",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(89, 132, 62, 1),
                              shadowColor: Color.fromARGB(255, 125, 130, 128),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              minimumSize: Size(400, 50)),
                          onPressed: () => null),
                    ],
                  ))
            ],
          )),
    ));
  }
}
