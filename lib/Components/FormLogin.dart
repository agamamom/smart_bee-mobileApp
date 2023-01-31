import 'package:flutter/material.dart';
import 'package:smart_bee/Components/ForgotPassword.dart';
import 'package:smart_bee/pages/WelcomePage.dart';
import 'package:smart_bee/pages/RegisterPage.dart';

import 'HeaderApp.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  bool isPasswordVisible = false;
  bool isChecked = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
          body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 89, 132, 62),
                  height: 130,
                  child: HeaderApp(),
                ),
                Container(
                    margin: EdgeInsets.only(top: 38.0),
                    child: Column(children: <Widget>[
                      const Text(
                        'SMARTBEE',
                        style: TextStyle(
                            fontSize: 30.0,
                            letterSpacing: 2.0,
                            color: Color.fromARGB(255, 89, 132, 62),
                            fontWeight: FontWeight.w500),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                              'Chào mừng trở lại! Hãy nhập thông tin chi tiết.')),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 37.0, vertical: 40.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Tài khoản',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Hãy nhập tài khoản của bạn.';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 16.74, horizontal: 24.34),
                                      border: OutlineInputBorder(),
                                      hintText: 'Tên tài khoản',
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black26, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: Text('Mật khẩu',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500))),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Hãy nhập mật khẩu của bạn.';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 16.74, horizontal: 24.34),
                                      border: OutlineInputBorder(),
                                      hintText: 'Mật khẩu',
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black26, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 40.0),
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                            shape: CircleBorder(),
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            }),
                                        Text(
                                          "Ghi nhớ tôi",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.0,
                                              letterSpacing: 1,
                                              color: Color.fromARGB(
                                                  209, 24, 24, 1)),
                                        )
                                      ],
                                    ),
                                    ElevatedButton(
                                      child: Text("Đăng nhập",
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
                                          minimumSize: Size(400, 50)),
                                      onPressed: () => {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           const WelcomePage()),
                                        // )
                                        if (_formKey.currentState!.validate())
                                          {print("valid")}
                                        else
                                          {print('not valid')}
                                      },
                                    ),
                                    const SizedBox(
                                      height: 12.0,
                                    ),
                                    OutlinedButton(
                                        // ignore: sort_child_properties_last
                                        child: const Text(
                                            "Đăng nhập bằng Gmail",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    190, 0, 0, 0))),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 255, 255, 255),
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        32.0)),
                                            minimumSize: const Size(400, 50)),
                                        onPressed: () => null),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    GestureDetector(
                                      onTap: () => {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const ForgotPassword()))
                                      },
                                      child: const Text(
                                        "Quên mật khẩu",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Bạn không có tài khoản?",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(89, 89, 89, 1),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        GestureDetector(
                                            onTap: () => {
                                                  Navigator.of(context).pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              const RegisterPage()))
                                                },
                                            child: Text(
                                              "Đăng ký!",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 228, 36, 36),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  decoration:
                                                      TextDecoration.underline),
                                            )),
                                      ],
                                    )
                                  ]),
                                )
                              ]),
                        ),
                      )
                    ])),
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

  launchUrl(Uri parse) {}
}
