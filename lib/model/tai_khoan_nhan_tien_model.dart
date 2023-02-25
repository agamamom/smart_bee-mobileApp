class TaiKhoanNhanTienModel {
  List<Result>? result;
  bool? success;
  int? statusCode;
  // ignore: prefer_void_to_null
  Null message;

  TaiKhoanNhanTienModel(
      {this.result, this.success, this.statusCode, this.message});

  TaiKhoanNhanTienModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    data['statusCode'] = statusCode;
    data['message'] = message;
    return data;
  }
}

class Result {
  String? id;
  String? soTaiKhoanCapTren;
  String? soTaiKhoan;
  String? ten;
  String? lv;
  String? moTa;
  String? idNguoiTao;
  String? parentId;
  String? soTenTaiKhoan;

  Result(
      {this.id,
      this.soTaiKhoanCapTren,
      this.soTaiKhoan,
      this.ten,
      this.lv,
      this.moTa,
      this.idNguoiTao,
      this.parentId,
      this.soTenTaiKhoan});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    soTaiKhoanCapTren = json['soTaiKhoanCapTren'];
    soTaiKhoan = json['soTaiKhoan'];
    ten = json['ten'];
    lv = json['lv'];
    moTa = json['moTa'];
    idNguoiTao = json['idNguoiTao'];
    parentId = json['parentId'];
    soTenTaiKhoan = json['soTenTaiKhoan'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['soTaiKhoanCapTren'] = soTaiKhoanCapTren;
    data['soTaiKhoan'] = soTaiKhoan;
    data['ten'] = ten;
    data['lv'] = lv;
    data['moTa'] = moTa;
    data['idNguoiTao'] = idNguoiTao;
    data['parentId'] = parentId;
    data['soTenTaiKhoan'] = soTenTaiKhoan;
    return data;
  }
}
