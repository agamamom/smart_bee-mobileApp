import 'package:flutter/material.dart';

class DuAnDangThucHien extends StatelessWidget {
  const DuAnDangThucHien({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 0.0),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Container(
                width: 7.0,
                height: 7.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromRGBO(68, 131, 247, 1)),
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "Đang thực hiện",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(68, 131, 247, 1)),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color.fromARGB(255, 252, 252, 252)),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pm Quản lý vi bằng",
                    style: TextStyle(
                        color: Color.fromRGBO(60, 85, 122, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0),
                  ),
                  Container(
                    child: Row(children: [
                      Image.asset(
                        'assets/images/pencil.png',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 28.0,
                      ),
                      Image.asset(
                        'assets/images/three-dot.png',
                        fit: BoxFit.cover,
                      ),
                    ]),
                  )
                ],
              ),
              SizedBox(
                height: 14.0,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start date',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: Color.fromRGBO(113, 121, 134, 1)),
                      ),
                      Text(
                        '12-02-2022',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: Color.fromRGBO(113, 121, 134, 1)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Stop date",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: Color.fromRGBO(113, 121, 134, 1)),
                      ),
                      Text(
                        '30-11-2022',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: Color.fromRGBO(113, 121, 134, 1)),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Thành viên",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: Color.fromRGBO(113, 121, 134, 1)),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 28,
                            height: 29,
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(48), // Image radius
                                child: Image.asset(
                                    'assets/images/Ellipse 3.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Container(
                            width: 28,
                            height: 29,
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(48), // Image radius
                                child: Image.asset(
                                    'assets/images/Ellipse 5.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Container(
                            width: 28,
                            height: 29,
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(48), // Image radius
                                child: Image.asset(
                                    'assets/images/Ellipse 4.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Container(
                            width: 28,
                            height: 29,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(48),
                                border: Border.all(
                                    width: 1,
                                    color: Color.fromARGB(253, 63, 62, 62))),
                            child: Icon(Icons.add_sharp),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Leader",
                        style: TextStyle(
                            color: Color.fromRGBO(68, 131, 247, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        width: 28,
                        height: 29,
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(48), // Image radius
                            child: Image.asset('assets/images/Ellipse 5.png',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "60/72 chức năng",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(113, 121, 134, 1)),
                  ),
                  Text(
                    "83%",
                    style: TextStyle(),
                  )
                ],
              )
            ]),
          )
        ])));
  }
}
