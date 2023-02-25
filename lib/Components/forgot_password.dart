import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'header_app.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                  child: Column(
                    children: [
                      const Text(
                        'Lấy lại mật khẩu',
                        style: TextStyle(
                            fontSize: 30.0,
                            letterSpacing: 2.0,
                            color: Color.fromARGB(255, 89, 132, 62),
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 86,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16.74, horizontal: 24.34),
                            border: const OutlineInputBorder(),
                            hintText: 'Email',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black26, width: 1),
                                borderRadius: BorderRadius.circular(30))),
                        validator: (value) => EmailValidator.validate(value!)
                            ? null
                            : "Please enter a valid email",
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              // ignore: valid_regexps
                              !RegExp(r'^+$').hasMatch(value)) {
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
                                borderRadius: BorderRadius.circular(30.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black26, width: 1),
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(89, 132, 62, 1),
                              shadowColor:
                                  const Color.fromARGB(255, 125, 130, 128),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              minimumSize: const Size(400, 50)),
                          // ignore: avoid_returning_null_for_void
                          onPressed: () => null,
                          child: const Text("Gửi mã xác nhận",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600))),
                    ],
                  ))
            ],
          )),
    ));
  }
}
