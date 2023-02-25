import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DuAnDangThucHien extends StatelessWidget {
  const DuAnDangThucHien({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 0.0),
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              const Text(
                "Dự án",
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(99, 99, 100, 1)),
              ),
              Row(
                children: [
                  Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(68, 131, 247, 1)),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const Text(
                    "Đang thực hiện",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(68, 131, 247, 1)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 11.0),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 183, 180, 180),
                          blurRadius: 1.0,
                          spreadRadius: -2,
                          offset: Offset(0, 6)),
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color.fromARGB(255, 252, 252, 252)),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Pm Quản lý vi bằng",
                        style: TextStyle(
                            color: Color.fromRGBO(60, 85, 122, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0),
                      ),
                      Row(children: [
                        Image.asset(
                          'assets/images/pencil.png',
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 28.0,
                        ),
                        Image.asset(
                          'assets/images/three-dot.png',
                          fit: BoxFit.cover,
                        ),
                      ])
                    ],
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
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
                      const SizedBox(
                        width: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
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
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Thành viên",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                                color: Color.fromRGBO(113, 121, 134, 1)),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 28,
                                height: 29,
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        48), // Image radius
                                    child: Image.asset(
                                        'assets/images/Ellipse 3.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              SizedBox(
                                width: 28,
                                height: 29,
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        48), // Image radius
                                    child: Image.asset(
                                        'assets/images/Ellipse 5.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              SizedBox(
                                width: 28,
                                height: 29,
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        48), // Image radius
                                    child: Image.asset(
                                        'assets/images/Ellipse 4.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 28,
                                height: 29,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(48),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                            253, 63, 62, 62))),
                                child: const Icon(Icons.add_sharp),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Leader",
                            style: TextStyle(
                                color: Color.fromRGBO(68, 131, 247, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          SizedBox(
                            width: 28,
                            height: 29,
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(48), // Image radius
                                child: Image.asset(
                                    'assets/images/Ellipse 5.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "60/72 chức năng",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(113, 121, 134, 1)),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 26.0,
                      child: Stack(
                        children: [
                          Positioned(
                              top: 1,
                              left: -10,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: LinearPercentIndicator(
                                  width: MediaQuery.of(context).size.width - 60,
                                  animation: true,
                                  lineHeight: 15.36,
                                  center: const Text(
                                    "83%",
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  animationDuration: 2500,
                                  percent: 0.8,
                                  barRadius: const Radius.circular(16),
                                  backgroundColor:
                                      const Color.fromARGB(126, 220, 217, 217),
                                  progressColor:
                                      const Color.fromRGBO(68, 131, 247, 1),
                                ),
                              ))
                        ],
                      )),
                ]),
              ),
              Row(
                children: [
                  Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(255, 165, 0, 1)),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const Text(
                    "Đang thực hiện",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(255, 165, 0, 1)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 11.0),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 183, 180, 180),
                          blurRadius: 1.0,
                          spreadRadius: -2,
                          offset: Offset(0, 6)),
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color.fromARGB(255, 252, 252, 252)),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Pm Quản lý vi bằng",
                        style: TextStyle(
                            color: Color.fromRGBO(60, 85, 122, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0),
                      ),
                      Row(children: [
                        Image.asset(
                          'assets/images/pencil.png',
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 28.0,
                        ),
                        Image.asset(
                          'assets/images/three-dot.png',
                          fit: BoxFit.cover,
                        ),
                      ])
                    ],
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
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
                      const SizedBox(
                        width: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
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
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Thành viên",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                                color: Color.fromRGBO(113, 121, 134, 1)),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 28,
                                height: 29,
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        48), // Image radius
                                    child: Image.asset(
                                        'assets/images/Ellipse 3.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              SizedBox(
                                width: 28,
                                height: 29,
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        48), // Image radius
                                    child: Image.asset(
                                        'assets/images/Ellipse 5.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              SizedBox(
                                width: 28,
                                height: 29,
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        48), // Image radius
                                    child: Image.asset(
                                        'assets/images/Ellipse 4.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 28,
                                height: 29,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(48),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                            253, 63, 62, 62))),
                                child: const Icon(Icons.add_sharp),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Leader",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 165, 0, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          SizedBox(
                            width: 28,
                            height: 29,
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(48), // Image radius
                                child: Image.asset(
                                    'assets/images/Ellipse 5.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "60/72 chức năng",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(113, 121, 134, 1)),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 26.0,
                      child: Stack(
                        children: [
                          Positioned(
                              top: 1,
                              left: -10,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: LinearPercentIndicator(
                                  width: MediaQuery.of(context).size.width - 60,
                                  animation: true,
                                  lineHeight: 15.36,
                                  center: const Text(
                                    "83%",
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  animationDuration: 2500,
                                  percent: 0.8,
                                  barRadius: const Radius.circular(16),
                                  backgroundColor:
                                      const Color.fromARGB(126, 220, 217, 217),
                                  progressColor:
                                      const Color.fromRGBO(255, 165, 0, 1),
                                ),
                              ))
                        ],
                      )),
                ]),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 11.0),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 183, 180, 180),
                          blurRadius: 1.0,
                          spreadRadius: -2,
                          offset: Offset(0, 6)),
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color.fromARGB(255, 252, 252, 252)),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Pm Quản lý vi bằng",
                        style: TextStyle(
                            color: Color.fromRGBO(60, 85, 122, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0),
                      ),
                      Row(children: [
                        Image.asset(
                          'assets/images/pencil.png',
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 28.0,
                        ),
                        Image.asset(
                          'assets/images/three-dot.png',
                          fit: BoxFit.cover,
                        ),
                      ])
                    ],
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
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
                      const SizedBox(
                        width: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
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
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Thành viên",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                                color: Color.fromRGBO(113, 121, 134, 1)),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 28,
                                height: 29,
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        48), // Image radius
                                    child: Image.asset(
                                        'assets/images/Ellipse 3.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              SizedBox(
                                width: 28,
                                height: 29,
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        48), // Image radius
                                    child: Image.asset(
                                        'assets/images/Ellipse 5.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              SizedBox(
                                width: 28,
                                height: 29,
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        48), // Image radius
                                    child: Image.asset(
                                        'assets/images/Ellipse 4.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 28,
                                height: 29,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(48),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                            253, 63, 62, 62))),
                                child: const Icon(Icons.add_sharp),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Leader",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 165, 0, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          SizedBox(
                            width: 28,
                            height: 29,
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(48), // Image radius
                                child: Image.asset(
                                    'assets/images/Ellipse 5.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "60/72 chức năng",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(113, 121, 134, 1)),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 26.0,
                      child: Stack(
                        children: [
                          Positioned(
                              top: 1,
                              left: -10,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: LinearPercentIndicator(
                                  width: MediaQuery.of(context).size.width - 60,
                                  animation: true,
                                  lineHeight: 15.36,
                                  center: const Text(
                                    "83%",
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  animationDuration: 2500,
                                  percent: 0.8,
                                  barRadius: const Radius.circular(16),
                                  backgroundColor:
                                      const Color.fromARGB(126, 220, 217, 217),
                                  progressColor:
                                      const Color.fromRGBO(255, 165, 0, 1),
                                ),
                              ))
                        ],
                      )),
                ]),
              ),
              Row(
                children: [
                  Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(214, 7, 7, 1)),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const Text(
                    "Hoàn thành",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(214, 7, 7, 1)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 11.0),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 183, 180, 180),
                          blurRadius: 1.0,
                          spreadRadius: -2,
                          offset: Offset(0, 6)),
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color.fromARGB(255, 252, 252, 252)),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Pm Quản lý vi bằng",
                        style: TextStyle(
                            color: Color.fromRGBO(60, 85, 122, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0),
                      ),
                      Row(children: [
                        Image.asset(
                          'assets/images/pencil.png',
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 28.0,
                        ),
                        Image.asset(
                          'assets/images/three-dot.png',
                          fit: BoxFit.cover,
                        ),
                      ])
                    ],
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
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
                      const SizedBox(
                        width: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
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
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Thành viên",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                                color: Color.fromRGBO(113, 121, 134, 1)),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 28,
                                height: 29,
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        48), // Image radius
                                    child: Image.asset(
                                        'assets/images/Ellipse 3.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              SizedBox(
                                width: 28,
                                height: 29,
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        48), // Image radius
                                    child: Image.asset(
                                        'assets/images/Ellipse 5.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              SizedBox(
                                width: 28,
                                height: 29,
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        48), // Image radius
                                    child: Image.asset(
                                        'assets/images/Ellipse 4.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 28,
                                height: 29,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(48),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                            253, 63, 62, 62))),
                                child: const Icon(Icons.add_sharp),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Leader",
                            style: TextStyle(
                                color: Color.fromRGBO(214, 7, 7, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          SizedBox(
                            width: 28,
                            height: 29,
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(48), // Image radius
                                child: Image.asset(
                                    'assets/images/Ellipse 5.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "60/72 chức năng",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(113, 121, 134, 1)),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 26.0,
                      child: Stack(
                        children: [
                          Positioned(
                              top: 1,
                              left: -10,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: LinearPercentIndicator(
                                  width: MediaQuery.of(context).size.width - 60,
                                  animation: true,
                                  lineHeight: 15.36,
                                  center: const Text(
                                    "83%",
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  animationDuration: 2500,
                                  percent: 0.8,
                                  barRadius: const Radius.circular(16),
                                  backgroundColor:
                                      const Color.fromARGB(126, 220, 217, 217),
                                  progressColor:
                                      const Color.fromRGBO(214, 7, 7, 1),
                                ),
                              ))
                        ],
                      )),
                ]),
              ),
            ])));
  }
}