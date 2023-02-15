class SoQuyModel {
  List<Result>? result;
  bool? success;
  int? statusCode;
  Null? message;

  SoQuyModel({this.result, this.success, this.statusCode, this.message});

  SoQuyModel.fromJson(Map<String, dynamic> json) {
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
  String? soTien;
  String? chungtu;
  String? taiKhoanNhanTien;
  String? noidung;
  String? mota;
  String? loai;
  String? soKiHieu;
  String? soTienChu;
  String? nguoiNhanTien;
  Null? phanLoai;
  String? idNguoiphancong;
  String? idNguoichutri;
  String? tenDuAn;
  String? nguoiDuyet;
  String? nguoiChuTri;
  String? soTenTaiKhoan;
  String? ngay;

  Result(
      {this.id,
      this.soTien,
      this.chungtu,
      this.taiKhoanNhanTien,
      this.noidung,
      this.mota,
      this.loai,
      this.soKiHieu,
      this.soTienChu,
      this.nguoiNhanTien,
      this.phanLoai,
      this.idNguoiphancong,
      this.idNguoichutri,
      this.tenDuAn,
      this.nguoiDuyet,
      this.nguoiChuTri,
      this.soTenTaiKhoan,
      this.ngay});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    soTien = json['soTien'];
    chungtu = json['chungtu'];
    taiKhoanNhanTien = json['taiKhoanNhanTien'];
    noidung = json['noidung'];
    mota = json['mota'];
    loai = json['loai'];
    soKiHieu = json['soKiHieu'];
    soTienChu = json['soTienChu'];
    nguoiNhanTien = json['nguoiNhanTien'];
    phanLoai = json['phanLoai'];
    idNguoiphancong = json['idNguoiphancong'];
    idNguoichutri = json['idNguoichutri'];
    tenDuAn = json['tenDuAn'];
    nguoiDuyet = json['nguoiDuyet'];
    nguoiChuTri = json['nguoiChuTri'];
    soTenTaiKhoan = json['soTenTaiKhoan'];
    ngay = json['ngay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['soTien'] = this.soTien;
    data['chungtu'] = this.chungtu;
    data['taiKhoanNhanTien'] = this.taiKhoanNhanTien;
    data['noidung'] = this.noidung;
    data['mota'] = this.mota;
    data['loai'] = this.loai;
    data['soKiHieu'] = this.soKiHieu;
    data['soTienChu'] = this.soTienChu;
    data['nguoiNhanTien'] = this.nguoiNhanTien;
    data['phanLoai'] = this.phanLoai;
    data['idNguoiphancong'] = this.idNguoiphancong;
    data['idNguoichutri'] = this.idNguoichutri;
    data['tenDuAn'] = this.tenDuAn;
    data['nguoiDuyet'] = this.nguoiDuyet;
    data['nguoiChuTri'] = this.nguoiChuTri;
    data['soTenTaiKhoan'] = this.soTenTaiKhoan;
    data['ngay'] = this.ngay;
    return data;
  }
}
