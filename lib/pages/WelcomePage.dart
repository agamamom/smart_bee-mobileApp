import 'package:flutter/material.dart';

import '../Components/HeaderApp.dart';
import 'Curved_navigation_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover)),
          child: Column(children: [
            Container(
              color: const Color.fromARGB(255, 89, 132, 62),
              height: 130,
              child: const HeaderApp(),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/bee.png',
                fit: BoxFit.contain,
              ),
            )),
            Expanded(
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Chào Hiền Tài khoản của bạn đã được tạo',
                          style: TextStyle(
                              color: Color.fromRGBO(89, 132, 62, 1),
                              fontSize: 34.0,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(250, 181, 18, 1),
                              shadowColor:
                                  const Color.fromARGB(255, 125, 130, 128),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                            ),
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Curved_navigation_page(
                                          indexOfScreen: 0,
                                        )),
                              )
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Bắt đầu',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Color.fromRGBO(89, 132, 62, 1),
                                  ),
                                ), // <-- Text

                                Icon(
                                  // <-- Icon
                                  Icons.arrow_circle_right,
                                  size: 24.0,
                                  color: Color.fromRGBO(89, 132, 62, 1),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )))
          ]),
        ),
      ),
      onWillPop: () async {
        return true;
      },
    );
  }
}
