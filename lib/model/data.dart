class CongViec {
  List<Result>? result;
  bool? success;
  int? statusCode;
  Null? message;

  CongViec({this.result, this.success, this.statusCode, this.message});

  CongViec.fromJson(Map<String, dynamic> json) {
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
  String? idCongviec;
  String? ngaybatdau;
  String? ngayketthuc;
  String? mota;
  String? idNguoichutri;
  String? idNguoiphancong;
  String? loaicv;

  Result(
      {this.id,
      this.idCongviec,
      this.ngaybatdau,
      this.ngayketthuc,
      this.mota,
      this.idNguoichutri,
      this.idNguoiphancong,
      this.loaicv});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCongviec = json['idCongviec'];
    ngaybatdau = json['ngaybatdau'];
    ngayketthuc = json['ngayketthuc'];
    mota = json['mota'];
    idNguoichutri = json['idNguoichutri'];
    idNguoiphancong = json['idNguoiphancong'];
    loaicv = json['loaicv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idCongviec'] = this.idCongviec;
    data['ngaybatdau'] = this.ngaybatdau;
    data['ngayketthuc'] = this.ngayketthuc;
    data['mota'] = this.mota;
    data['idNguoichutri'] = this.idNguoichutri;
    data['idNguoiphancong'] = this.idNguoiphancong;
    data['loaicv'] = this.loaicv;
    return data;
  }
}
