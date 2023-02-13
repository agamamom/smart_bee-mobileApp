import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DuAn_TienDo extends StatelessWidget {
  const DuAn_TienDo({
    super.key,
    required this.color,
  });
  final Color color;
  final double progress = 0.9;

  @override
  Widget build(BuildContext context) {
    double totalWidth = ((MediaQuery.of(context).size.width / 2) - 59);
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Tiến độ",
            style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(99, 99, 100, 1)),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "DA đang thực hiện",
                  style: TextStyle(
                      color: Color.fromRGBO(99, 99, 100, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 70,
                  height: 14,
                  child: Text(
                    'àHkasfhhA',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(167, 167, 167, 1)),
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(children: [
                    Transform.translate(
                      offset: Offset((totalWidth * 2 * 0.9) - totalWidth, 0),
                      child: Container(
                          child: Image.asset(
                        'assets/images/Polygon15.png',
                        fit: BoxFit.cover,
                      )),
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 9,
                      barRadius: const Radius.circular(16),
                      backgroundColor: Color.fromARGB(255, 205, 53, 53),
                      percent: 0.9,
                      progressColor: Color.fromRGBO(0, 219, 153, 1),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 70,
                  height: 14,
                  child: Text(
                    'àHkasfhhA',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(167, 167, 167, 1)),
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(children: [
                    Transform.translate(
                      offset: Offset((totalWidth * 2 * 0.9) - totalWidth, 0),
                      child: Container(
                          child: Image.asset(
                        'assets/images/Polygon15.png',
                        fit: BoxFit.cover,
                      )),
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 9,
                      barRadius: const Radius.circular(16),
                      backgroundColor: Color.fromARGB(255, 205, 53, 53),
                      percent: 0.9,
                      progressColor: Color.fromRGBO(0, 219, 153, 1),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 70,
                  height: 14,
                  child: Text(
                    'àHkasfhhA',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(167, 167, 167, 1)),
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(children: [
                    Transform.translate(
                      offset: Offset((totalWidth * 2 * 0.9) - totalWidth, 0),
                      child: Container(
                          child: Image.asset(
                        'assets/images/Polygon15.png',
                        fit: BoxFit.cover,
                      )),
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 9,
                      barRadius: const Radius.circular(16),
                      backgroundColor: Color.fromRGBO(240, 187, 0, 1),
                      percent: 0.9,
                      progressColor: Color.fromRGBO(0, 219, 153, 1),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 70,
                  height: 14,
                  child: Text(
                    'àHkasfhhA',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(167, 167, 167, 1)),
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(children: [
                    Transform.translate(
                      offset: Offset((totalWidth * 2 * 0.9) - totalWidth, 0),
                      child: Container(
                          child: Image.asset(
                        'assets/images/Polygon15.png',
                        fit: BoxFit.cover,
                      )),
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 9,
                      barRadius: const Radius.circular(16),
                      backgroundColor: Color.fromRGBO(133, 245, 212, 1),
                      percent: 0.9,
                      progressColor: Color.fromRGBO(0, 219, 153, 1),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 70,
                  height: 14,
                  child: Text(
                    'àHkasfhhA',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(167, 167, 167, 1)),
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(children: [
                    Transform.translate(
                      offset: Offset((totalWidth * 2 * 0.9) - totalWidth, 0),
                      child: Container(
                          child: Image.asset(
                        'assets/images/Polygon15.png',
                        fit: BoxFit.cover,
                      )),
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 9,
                      barRadius: const Radius.circular(16),
                      backgroundColor: Color.fromRGBO(133, 245, 212, 1),
                      percent: 0.9,
                      progressColor: Color.fromRGBO(0, 219, 153, 1),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "DA đang duy trì",
                  style: TextStyle(
                      color: Color.fromRGBO(99, 99, 100, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 70,
                  height: 14,
                  child: Text(
                    'àHkasfhhA',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(167, 167, 167, 1)),
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(children: [
                    Transform.translate(
                      offset: Offset((totalWidth * 2 * 0.9) - totalWidth, 0),
                      child: Container(
                          child: Image.asset(
                        'assets/images/Polygon15.png',
                        fit: BoxFit.cover,
                      )),
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 9,
                      barRadius: const Radius.circular(16),
                      backgroundColor: Color.fromARGB(255, 205, 53, 53),
                      percent: 0.9,
                      progressColor: Color.fromRGBO(167, 167, 167, 1),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 70,
                  height: 14,
                  child: Text(
                    'àHkasfhhA',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(167, 167, 167, 1)),
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(children: [
                    Transform.translate(
                      offset: Offset((totalWidth * 2 * 0.9) - totalWidth, 0),
                      child: Container(
                          child: Image.asset(
                        'assets/images/Polygon15.png',
                        fit: BoxFit.cover,
                      )),
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 9,
                      barRadius: const Radius.circular(16),
                      backgroundColor: Color.fromARGB(255, 205, 53, 53),
                      percent: 0.9,
                      progressColor: Color.fromRGBO(167, 167, 167, 1),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 70,
                  height: 14,
                  child: Text(
                    'àHkasfhhA',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(167, 167, 167, 1)),
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(children: [
                    Transform.translate(
                      offset: Offset((totalWidth * 2 * 0.9) - totalWidth, 0),
                      child: Container(
                          child: Image.asset(
                        'assets/images/Polygon15.png',
                        fit: BoxFit.cover,
                      )),
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 9,
                      barRadius: const Radius.circular(16),
                      backgroundColor: Color.fromRGBO(240, 187, 0, 1),
                      percent: 0.9,
                      progressColor: Color.fromRGBO(167, 167, 167, 1),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 70,
                  height: 14,
                  child: Text(
                    'àHkasfhhA',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(167, 167, 167, 1)),
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(children: [
                    Transform.translate(
                      offset: Offset((totalWidth * 2 * 0.9) - totalWidth, 0),
                      child: Container(
                          child: Image.asset(
                        'assets/images/Polygon15.png',
                        fit: BoxFit.cover,
                      )),
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 9,
                      barRadius: const Radius.circular(16),
                      backgroundColor: Color.fromRGBO(133, 245, 212, 1),
                      percent: 0.9,
                      progressColor: Color.fromRGBO(167, 167, 167, 1),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 70,
                  height: 14,
                  child: Text(
                    'àHkasfhhA',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(167, 167, 167, 1)),
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(children: [
                    Transform.translate(
                      offset: Offset((totalWidth * 2 * 0.9) - totalWidth, 0),
                      child: Container(
                          child: Image.asset(
                        'assets/images/Polygon15.png',
                        fit: BoxFit.cover,
                      )),
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 9,
                      barRadius: const Radius.circular(16),
                      backgroundColor: Color.fromRGBO(133, 245, 212, 1),
                      percent: 0.9,
                      progressColor: Color.fromRGBO(167, 167, 167, 1),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Cá nhân",
                  style: TextStyle(
                      color: Color.fromRGBO(99, 99, 100, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                  width: 70,
                  height: 14,
                  child: Text(
                    'àHkasfhhA',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(167, 167, 167, 1)),
                  )),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(children: [
                    Transform.translate(
                      offset: Offset((totalWidth * 2 * 0.9) - totalWidth, 0),
                      child: Image.asset(
                        'assets/images/Polygon15.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 9,
                      barRadius: const Radius.circular(16),
                      backgroundColor: const Color.fromARGB(255, 205, 53, 53),
                      percent: 0.9,
                      progressColor: const Color.fromRGBO(0, 219, 153, 1),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 70,
                  height: 14,
                  child: const Text(
                    'àHkasfhhA',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(167, 167, 167, 1)),
                  )),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(children: [
                    Transform.translate(
                      offset: Offset((totalWidth * 2 * 0.9) - totalWidth, 0),
                      child: Container(
                          child: Image.asset(
                        'assets/images/Polygon15.png',
                        fit: BoxFit.cover,
                      )),
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 9,
                      barRadius: const Radius.circular(16),
                      backgroundColor: const Color.fromARGB(255, 205, 53, 53),
                      percent: 0.9,
                      progressColor: const Color.fromRGBO(0, 219, 153, 1),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 70,
                  height: 14,
                  child: const Text(
                    'àHkasfhhA',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(167, 167, 167, 1)),
                  )),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  child: Column(children: [
                    Transform.translate(
                      offset: Offset((totalWidth * 2 * 0.9) - totalWidth, 0),
                      child: Image.asset(
                        'assets/images/Polygon15.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 9,
                      barRadius: const Radius.circular(16),
                      backgroundColor: const Color.fromARGB(255, 205, 53, 53),
                      percent: 0.9,
                      progressColor: const Color.fromRGBO(0, 219, 153, 1),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    ));
  }
}
