import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:smart_bee/model/data.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static const String url =
      'http://115.75.13.14:2602/api/SmartBee?PageIndex=0&PageSize=10';
  static List<CongViec> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<CongViec> posts =
        list.map((model) => CongViec.fromJson(model)).toList();
    return posts;
  }

  static Future<List<CongViec>> fetchPosts({int page = 1}) async {
    final response = await http.get(Uri.parse("$url"));
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
    } else if (response.statusCode == 404) {
      throw Exception("Not found");
    } else {
      throw Exception("Cant get post");
    }
  }
}
