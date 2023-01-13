import 'package:flutter/material.dart';
import 'Components/ForgotPassword.dart';
import 'Components/FormLogin.dart';
import 'Components/HeaderApp.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
    theme: ThemeData(fontFamily: 'Poppins'),
    localizationsDelegates: [
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [Locale('en', 'US')],
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: SafeArea(child: FormLogin()));
  }
}
