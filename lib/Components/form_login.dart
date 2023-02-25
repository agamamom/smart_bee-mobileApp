import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_bee/Components/forgot_password.dart';
import 'package:smart_bee/pages/register_page.dart';

import 'header_app.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  bool isPasswordVisible = false;
  bool isChecked = false;
  final taiKhoanController = TextEditingController();
  final matKhauController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Do you want to exit app?'),
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('No')),
            ElevatedButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Yes')),
          ],
        ),
      );

  @override
  void dispose() {
    taiKhoanController.dispose();
    matKhauController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                Container(
                  color: const Color.fromARGB(255, 89, 132, 62),
                  height: 130,
                  child: const HeaderApp(),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 38.0),
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
                                const Text('Tài khoản',
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
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 16.74,
                                              horizontal: 24.34),
                                      border: const OutlineInputBorder(),
                                      hintText: 'Tên tài khoản',
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.black26, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  controller: taiKhoanController,
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: const Text('Mật khẩu',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500))),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Hãy nhập mật khẩu của bạn.';
                                    }
                                    return null;
                                  },
                                  controller: matKhauController,
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 16.74,
                                              horizontal: 24.34),
                                      border: const OutlineInputBorder(),
                                      hintText: 'Mật khẩu',
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.black26, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 40.0),
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                            shape: const CircleBorder(),
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            }),
                                        const Text(
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
                                      onPressed: () => {
                                        if (_formKey.currentState!.validate())
                                          {signIn()}
                                        else
                                          // ignore: avoid_print
                                          {print('not valid')}
                                      },
                                      child: const Text("Đăng nhập",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    const SizedBox(
                                      height: 12.0,
                                    ),
                                    OutlinedButton(
                                      // ignore: sort_child_properties_last
                                      child: const Text("Đăng nhập bằng Gmail",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  190, 0, 0, 0))),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32.0)),
                                          minimumSize: const Size(400, 50)),
                                      onPressed: () {
                                        signInWithGoogle();
                                      },
                                    ),
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
                                            child: const Text(
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
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
    );
  }

  launchUrl(Uri parse) {}
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: taiKhoanController.text.trim(),
      password: matKhauController.text.trim(),
    );
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/main_screen');
  }

  Future signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    // ignore: unused_local_variable
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/main_screen');
  }
}
