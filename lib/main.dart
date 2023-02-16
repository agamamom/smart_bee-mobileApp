import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_bee/pages/Curved_navigation_page.dart';
import 'package:smart_bee/pages/WelcomePage.dart';
import 'package:smart_bee/provider/google_sign_in.dart';
import 'Components/FormLogin.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        initialRoute: '/login_screen',
        routes: {
          '/login_screen': (context) => const FormLogin(),
          '/welcome': (context) => const WelcomePage(),
          '/main_screen': (context) => Curved_navigation_page(
                indexOfScreen: 0,
              ),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', 'US')],
      ),
    );
  }
}
