import 'package:flutter/material.dart';
import 'package:smart_bee/Components/ChiChuyenKhoan.dart';
import 'package:smart_bee/Components/SettingButton.dart';
import 'package:smart_bee/Components/SoQuy.dart';
import 'package:smart_bee/Components/ThemViec.dart';
import 'package:smart_bee/Components/ThuTienMat.dart';
import 'package:smart_bee/Components/duyet_viec.dart';
import 'package:smart_bee/Components/TongHopViecTheoND.dart';

class CongViec extends StatefulWidget {
  const CongViec({super.key});

  @override
  State<CongViec> createState() => _TaiChinhState();
}

class _TaiChinhState extends State<CongViec> {
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
                      const Center(
                        child: Text(
                          "Công việc",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(99, 99, 100, 1)),
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
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 18, vertical: 18),
                                            child: Image.asset(
                                              "assets/images/ViecGap.png",
                                              fit: BoxFit.contain,
                                            ),
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
                                                "Việc gấp",
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
                                              const TongHopViecTheoND()))
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
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 8),
                                              child: Image.asset(
                                                "assets/images/DangLam.png",
                                                fit: BoxFit.contain,
                                              ),
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
                                                "Đang làm",
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
                                              const DuyetViec()))
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
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 5),
                                              child: Image.asset(
                                                "assets/images/ChoDuyet.png",
                                                fit: BoxFit.cover,
                                              ),
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
                                                "Chờ duyệt",
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
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 5),
                                            child: Image.asset(
                                              "assets/images/TreHan.png",
                                              fit: BoxFit.cover,
                                            ),
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
                                                "Trễ hạn",
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
                                              const ThemViec()))
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
                                                "assets/images/ThemViec.png")),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: const Text(
                                                "Thêm việc",
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
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 5),
                                              child: Image.asset(
                                                "assets/images/DiCongTac.png",
                                                fit: BoxFit.cover,
                                              ),
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
                                                "Đi công tác",
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
                                                      horizontal: 6),
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
