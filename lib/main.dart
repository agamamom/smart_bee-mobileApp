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
    return Container(child: FormLogin());
  }
}
