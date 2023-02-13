import 'package:smart_bee/model/taiKhoanNhanTien-model.dart';
import 'api-provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<TaiKhoanNhanTienModel> fetchTaiKhoanNhanTien() {
    return _provider.fetchTaiKhoanNhanTien();
  }
}

class NetworkError extends Error {}
