import 'package:flutter/material.dart';
import 'package:smart_bee/Components/ChiChuyenKhoan.dart';
import 'package:smart_bee/Components/ChiTienMat.dart';
import 'package:smart_bee/Components/GhiSo.dart';
import 'package:smart_bee/Components/SettingButton.dart';
import 'package:smart_bee/Components/SoQuy.dart';
import 'package:smart_bee/Components/ThuChuyenKhoan.dart';
import 'package:smart_bee/Components/ThuTienMat.dart';
import 'package:smart_bee/Components/ThuongDuAn.dart';

class TaiChinh extends StatefulWidget {
  const TaiChinh({super.key});

  @override
  State<TaiChinh> createState() => _TaiChinhState();
}

class _TaiChinhState extends State<TaiChinh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        const SizedBox(
                          width: 15.0,
                        ),
                        Image.asset(
                          'assets/images/calendar-icon.png',
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        const SettingButton()
                      ]),
                      const SizedBox(
                        height: 14.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Welcome, hienltt',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Color.fromRGBO(99, 99, 100, 1)),
                          ),
                          Image.asset(
                            'assets/images/bee-icon.png',
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            const Center(
                              child: Text(
                                "Tài chính",
                                style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(99, 99, 100, 1)),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              bottom: 10,
                              child: InkResponse(
                                onTap: () => {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ThuongDuAn()))
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(72, 181, 69, 1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Column(
                          children: [
                            Wrap(spacing: 10.0, runSpacing: 10.0, children: [
                              GestureDetector(
                                onTap: () => {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const ThuTienMat()))
                                },
                                child: Container(
                                  width: 163,
                                  height: 134,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color.fromARGB(
                                            255, 48, 200, 73)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 67,
                                          height: 67,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 12),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: const Color.fromRGBO(
                                                  72, 181, 69, 1)),
                                          child: const Icon(
                                            Icons.add_box_outlined,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            size: 50.0,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: const Text(
                                                "Thu TM",
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        72, 181, 69, 1)),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: const Icon(
                                                Icons.arrow_forward,
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1),
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const ThuChuyenKhoan()))
                                },
                                child: Container(
                                  width: 163,
                                  height: 134,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color.fromARGB(
                                            255, 48, 200, 73)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 67,
                                            height: 67,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 10),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: const Color.fromRGBO(
                                                    72, 181, 69, 1)),
                                            child: Image.asset(
                                              "assets/images/ThuCK.png",
                                              fit: BoxFit.cover,
                                            )),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: const Text(
                                                "Thu CK",
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        72, 181, 69, 1)),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: const Icon(
                                                Icons.arrow_forward,
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1),
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const ChiTienMat()))
                                },
                                child: Container(
                                  width: 163,
                                  height: 134,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color.fromARGB(
                                            255, 48, 200, 73)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 67,
                                            height: 67,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 12),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: const Color.fromRGBO(
                                                    72, 181, 69, 1)),
                                            child: Image.asset(
                                              "assets/images/ChiTM.png",
                                              fit: BoxFit.cover,
                                            )),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: const Text(
                                                "Chi TM",
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        72, 181, 69, 1)),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: const Icon(
                                                Icons.arrow_forward,
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1),
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const ChiChuyenKhoan()))
                                },
                                child: Container(
                                  width: 163,
                                  height: 134,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color.fromARGB(
                                            255, 48, 200, 73)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 67,
                                          height: 67,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 12),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: const Color.fromRGBO(
                                                  72, 181, 69, 1)),
                                          child: Image.asset(
                                            "assets/images/ChiCK.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: const Text(
                                                "Chi CK",
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        72, 181, 69, 1)),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: const Icon(
                                                Icons.arrow_forward,
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1),
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            ]),
                            const SizedBox(
                              height: 50,
                            ),
                            Wrap(spacing: 10.0, runSpacing: 10.0, children: [
                              GestureDetector(
                                onTap: () => {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const GhiSo()))
                                },
                                child: Container(
                                  width: 163,
                                  height: 134,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color.fromARGB(
                                            255, 48, 200, 73)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 67,
                                            height: 67,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 12),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: const Color.fromRGBO(
                                                    255, 199, 39, 1)),
                                            child: Image.asset(
                                                "assets/images/GhiSo.png")),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: const Text(
                                                "Ghi sổ",
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        72, 181, 69, 1)),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: const Icon(
                                                Icons.arrow_forward,
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1),
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const SoQuy()))
                                },
                                child: Container(
                                  width: 163,
                                  height: 134,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color.fromARGB(
                                            255, 48, 200, 73)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 67,
                                            height: 67,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 10),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: const Color.fromRGBO(
                                                    255, 199, 39, 1)),
                                            child: Image.asset(
                                              "assets/images/ExchangeCurrency.png",
                                              fit: BoxFit.cover,
                                            )),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: const Text(
                                                "Số quỹ",
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        72, 181, 69, 1)),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: const Icon(
                                                Icons.arrow_forward,
                                                color: Color.fromRGBO(
                                                    72, 181, 69, 1),
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
