import 'package:flutter/material.dart';
import 'package:smart_bee/pages/ListDuAn.dart';

import '../Components/HeaderApp.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover)),
          child: Column(children: [
            Container(
              color: Color.fromARGB(255, 89, 132, 62),
              height: 130,
              child: HeaderApp(),
            ),
            Expanded(
                child: Container(
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/bee.png',
                  fit: BoxFit.contain,
                ),
              ),
            )),
            Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            child: Text(
                          'Chào Hiền Tài khoản của bạn đã được tạo',
                          style: TextStyle(
                              color: Color.fromRGBO(89, 132, 62, 1),
                              fontSize: 34.0,
                              fontWeight: FontWeight.w700),
                        )),
                        SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(250, 181, 18, 1),
                              shadowColor: Color.fromARGB(255, 125, 130, 128),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                            ),
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ListDuAn()),
                              )
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
