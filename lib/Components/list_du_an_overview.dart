import 'package:flutter/material.dart';

class ListDuAnOverview extends StatelessWidget {
  const ListDuAnOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 0.0),
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
                      color: const Color.fromRGBO(68, 131, 247, 1)),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                const Text(
                  "Dự án",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(68, 131, 247, 1)),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  "(50)",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(68, 131, 247, 1)),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0),
              width: double.infinity,
              height: 73.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                      width: 2.0,
                      color: const Color.fromRGBO(208, 208, 208, 1))),
              child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "CAT",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(138, 28, 28, 1)),
                          ),
                          Text(
                            "Mã DA",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(167, 167, 167, 1)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Tên DA: Pm chỉ huy điều hành",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(167, 167, 167, 1)),
                          ),
                          Row(
                            children: const [
                              Text(
                                "Nhóm DA:",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(167, 167, 167, 1)),
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              Text(
                                "Giá trị:",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(167, 167, 167, 1)),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                "Từ ngày:",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(167, 167, 167, 1)),
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              Text(
                                "Đến ngày:",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(167, 167, 167, 1)),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/pencil.png',
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Image.asset(
                            'assets/images/trash.png',
                            fit: BoxFit.cover,
                          )
                        ],
                      )
                    ],
                  )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0),
              width: double.infinity,
              height: 73.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                      width: 2.0,
                      color: const Color.fromRGBO(208, 208, 208, 1))),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0),
              width: double.infinity,
              height: 73.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                      width: 2.0,
                      color: const Color.fromRGBO(208, 208, 208, 1))),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0),
              width: double.infinity,
              height: 73.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                      width: 2.0,
                      color: const Color.fromRGBO(208, 208, 208, 1))),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0),
              width: double.infinity,
              height: 73.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                      width: 2.0,
                      color: const Color.fromRGBO(208, 208, 208, 1))),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0),
              width: double.infinity,
              height: 73.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                      width: 2.0,
                      color: const Color.fromRGBO(208, 208, 208, 1))),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0),
              width: double.infinity,
              height: 73.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                      width: 2.0,
                      color: const Color.fromRGBO(208, 208, 208, 1))),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0),
              width: double.infinity,
              height: 73.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                      width: 2.0,
                      color: const Color.fromRGBO(208, 208, 208, 1))),
            )
          ]),
        ));
  }
}
