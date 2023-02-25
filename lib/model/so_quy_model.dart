class SoQuyModel {
  List<Result>? result;
  bool? success;
  int? statusCode;
  // ignore: prefer_void_to_null
  Null message;

  SoQuyModel({this.result, this.success, this.statusCode, this.message});

  SoQuyModel.fromJson(Map<String, dynamic> json) {
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
  String? soTien;
  String? chungtu;
  String? taiKhoanNhanTien;
  String? noidung;
  String? mota;
  String? loai;
  String? soKiHieu;
  String? soTienChu;
  String? nguoiNhanTien;
  // ignore: prefer_void_to_null
  Null phanLoai;
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
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['soTien'] = soTien;
    data['chungtu'] = chungtu;
    data['taiKhoanNhanTien'] = taiKhoanNhanTien;
    data['noidung'] = noidung;
    data['mota'] = mota;
    data['loai'] = loai;
    data['soKiHieu'] = soKiHieu;
    data['soTienChu'] = soTienChu;
    data['nguoiNhanTien'] = nguoiNhanTien;
    data['phanLoai'] = phanLoai;
    data['idNguoiphancong'] = idNguoiphancong;
    data['idNguoichutri'] = idNguoichutri;
    data['tenDuAn'] = tenDuAn;
    data['nguoiDuyet'] = nguoiDuyet;
    data['nguoiChuTri'] = nguoiChuTri;
    data['soTenTaiKhoan'] = soTenTaiKhoan;
    data['ngay'] = ngay;
    return data;
  }
}
