import 'package:flutter/material.dart';
import 'Components/ForgotPassword.dart';
import 'Components/FormLogin.dart';
import 'Components/HeaderApp.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
    theme: ThemeData(fontFamily: 'Poppins'),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 89, 132, 62),
                  height: 130,
                  child: HeaderApp(),
                ),
                Container(child: FormLogin()),
              ],
            ),
          )),
    );
  }
}
