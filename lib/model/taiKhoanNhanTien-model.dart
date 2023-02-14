class TaiKhoanNhanTienModel {
  List<Result>? result;
  bool? success;
  int? statusCode;
  Null? message;

  TaiKhoanNhanTienModel(
      {this.result, this.success, this.statusCode, this.message});

  TaiKhoanNhanTienModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['soTaiKhoanCapTren'] = this.soTaiKhoanCapTren;
    data['soTaiKhoan'] = this.soTaiKhoan;
    data['ten'] = this.ten;
    data['lv'] = this.lv;
    data['moTa'] = this.moTa;
    data['idNguoiTao'] = this.idNguoiTao;
    data['parentId'] = this.parentId;
    data['soTenTaiKhoan'] = this.soTenTaiKhoan;
    return data;
  }
}
