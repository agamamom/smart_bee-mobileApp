import 'package:dio/dio.dart';
import 'package:smart_bee/model/taiKhoanNhanTien-model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url =
      'http://115.75.13.14:2603/api/SmartBee/TaiKhoanNhanTien?PageIndex=0&PageSize=10';

  Future<TaiKhoanNhanTienModel> fetchTaiKhoanNhanTien() async {
    Response response = await _dio.post(_url);
    if (response.statusCode == 200) {
      return TaiKhoanNhanTienModel.fromJson(response.data);
    } else {
      throw Exception('Failed to get the data');
    }
  }
}
