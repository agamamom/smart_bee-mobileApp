import 'package:flutter/material.dart';
import 'package:smart_bee/Components/co_cau_to_chuc.dart';
import 'package:smart_bee/Components/he_so_phu_cap_chuc_vu.dart';
import 'package:smart_bee/Components/list_du_an_card_list.dart';
import 'package:smart_bee/Components/list_du_an_overview.dart';
import 'package:smart_bee/Components/nhom_muc.dart';
import 'package:smart_bee/Components/setting_button.dart';

class ListDuAn extends StatefulWidget {
  const ListDuAn({super.key});

  @override
  State<ListDuAn> createState() => _ListDuAnState();
}

class _ListDuAnState extends State<ListDuAn> {
  int _currentPage = 0;
  final PageController _controller = PageController();

  final List<Widget> _pages = [
    const ListDuAnCardList(),
    const ListDuAnOverview(),
    const NhomMuc(),
    const CoCauToChuc(),
    const HeSoPhuCapChucVu()
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

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
                      const SettingButton(),
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
                    Expanded(
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List<Widget>.generate(_pages.length,
                                    (int index) {
                                  return AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      height: (index == _currentPage) ? 10 : 6,
                                      width: (index == _currentPage) ? 10 : 6,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 30),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1,
                                              color: const Color.fromRGBO(
                                                  99, 99, 100, 1)),
                                          color: (index == _currentPage)
                                              ? const Color.fromARGB(
                                                  30, 255, 255, 255)
                                              : const Color.fromRGBO(
                                                  99, 99, 100, 1)));
                                })),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Positioned(
                            left: 0,
                            top: 50,
                            child: Text(
                              "Cài đặt",
                              style: TextStyle(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(99, 99, 100, 1)),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 120),
                            child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              onPageChanged: _onchanged,
                              controller: _controller,
                              itemCount: _pages.length,
                              itemBuilder: (context, int index) {
                                return _pages[index];
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
