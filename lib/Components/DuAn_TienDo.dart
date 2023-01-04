import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

// class DuAn_TienDo extends StatefulWidget {
//   const DuAn_TienDo({super.key});

//   @override
//   State<DuAn_TienDo> createState() => _DuAn_TienDoState();
// }

// class _DuAn_TienDoState extends State<DuAn_TienDo> {
//    final Color color;
//   final double progress;
//   _DuAn_TienDoState({Key key, @required this.color, this.progress}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: SingleChildScrollView(
//           child: Column(
//         children: [
//           Text(
//             "Tiến độ",
//             style: TextStyle(
//                 fontSize: 28.0,
//                 fontWeight: FontWeight.w700,
//                 color: Color.fromRGBO(99, 99, 100, 1)),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   "DA đang thực hiện",
//                   style: TextStyle(
//                       color: Color.fromRGBO(99, 99, 100, 1),
//                       fontWeight: FontWeight.w700,
//                       fontSize: 20),
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               Container(
//                 width: 70,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text(
//                       'àHkasfhhA',
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: Color.fromRGBO(167, 167, 167, 1)),
//                     ),
//                     Text(
//                       'àHkasfhhA',
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: Color.fromRGBO(167, 167, 167, 1)),
//                     ),
//                     Text(
//                       'àHkasfhhA',
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: Color.fromRGBO(167, 167, 167, 1)),
//                     ),
//                     Text(
//                       'àHkasfhhA',
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: Color.fromRGBO(167, 167, 167, 1)),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                   child: Container(
//                 width: 70,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text(
//                       'àHkasfhhA',
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: Color.fromRGBO(167, 167, 167, 1)),
//                     ),
//                     Text(
//                       'àHkasfhhA',
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: Color.fromRGBO(167, 167, 167, 1)),
//                     ),
//                     Text(
//                       'àHkasfhhA',
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: Color.fromRGBO(167, 167, 167, 1)),
//                     ),
//                     Text(
//                       'àHkasfhhA',
//                       style: TextStyle(
//                           fontSize: 12,
//                           color: Color.fromRGBO(167, 167, 167, 1)),
//                     ),
//                   ],
//                 ),
//               ))
//             ],
//           )
//         ],
//       )),
//     );
//   }
// }

class DuAn_TienDo extends StatelessWidget {
  const DuAn_TienDo({
    super.key,
    required this.color,
  });
  final Color color;
  final double progress = 0.7;

  @override
  Widget build(BuildContext context) {
    double totalWidth = ((MediaQuery.of(context).size.width / 2) - 20);
    return Container(
        child: Column(
      children: [
        Transform.translate(
          offset: Offset((totalWidth * 2 * 0.7) - totalWidth, -5),
          child: Container(
              padding: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: color,
              ),
              child: Image.asset(
                'assets/images/Polygon15.png',
                fit: BoxFit.cover,
              )),
        ),
        LinearPercentIndicator(
          padding: EdgeInsets.zero,
          lineHeight: 15,
          backgroundColor: Color.fromARGB(31, 211, 208, 208),
          percent: 0.7,
          progressColor: color,
        ),
      ],
    ));
  }
}
