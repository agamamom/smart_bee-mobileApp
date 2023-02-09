import 'package:flutter/material.dart';

import 'ForgotPassword.dart';

class ListDuAnCardList extends StatelessWidget {
  const ListDuAnCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Align(
      alignment: AlignmentDirectional.topStart,
      child: Wrap(spacing: 20.0, runSpacing: 20.0, children: [
        GestureDetector(
          onTap: () => {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const ForgotPassword()))
          },
          child: Container(
            width: 163,
            height: 134,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1.0, color: const Color.fromARGB(255, 48, 200, 73)),
              borderRadius: BorderRadius.circular(15),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 67,
                height: 67,
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromRGBO(72, 181, 69, 1)),
                child: const Icon(
                  Icons.add_box_outlined,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 50.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: const Text(
                      "Dự án",
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(72, 181, 69, 1)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Color.fromRGBO(72, 181, 69, 1),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
        GestureDetector(
          onTap: () => {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const ForgotPassword()))
          },
          child: Container(
            width: 163,
            height: 134,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1.0, color: const Color.fromARGB(255, 48, 200, 73)),
              borderRadius: BorderRadius.circular(15),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 67,
                height: 67,
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromRGBO(72, 181, 69, 1)),
                child: const Icon(
                  Icons.add_box_outlined,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 50.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: const Text(
                      "Dự án",
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(72, 181, 69, 1)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Color.fromRGBO(72, 181, 69, 1),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
        GestureDetector(
          onTap: () => {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const ForgotPassword()))
          },
          child: Container(
            width: 163,
            height: 134,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1.0, color: const Color.fromARGB(255, 48, 200, 73)),
              borderRadius: BorderRadius.circular(15),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 67,
                height: 67,
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromRGBO(72, 181, 69, 1)),
                child: const Icon(
                  Icons.add_box_outlined,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 50.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: const Text(
                      "Dự án",
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(72, 181, 69, 1)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Color.fromRGBO(72, 181, 69, 1),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ]),
    ));
  }
}
