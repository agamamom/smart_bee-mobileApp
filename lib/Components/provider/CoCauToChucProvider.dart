// import 'dart:convert';

// import 'package:flutter/widgets.dart';
// import 'package:smart_bee/model/data.dart';

// class CoCauToChucProvider extends ChangeNotifier {
//   CongViec data;

//   Future getData(context) async {
//     var response = await DefaultAssetBundle.of(context).loadString(
//         'http://115.75.13.14:2602/api/SmartBee?PageIndex=0&PageSize=10');

//     var mJson = json.decode(response);

//     this.data = CongViec.fromJson(mJson);
//     this.notifyListeners(); // for callback to view
//   }
// }
