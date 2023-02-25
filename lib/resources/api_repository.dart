import 'package:smart_bee/model/tai_khoan_nhan_tien_model.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<TaiKhoanNhanTienModel> fetchTaiKhoanNhanTien() {
    return _provider.fetchTaiKhoanNhanTien();
  }
}

class NetworkError extends Error {}
