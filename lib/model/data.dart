class CongViec {
  List<Result>? result;
  bool? success;
  int? statusCode;
  // ignore: prefer_void_to_null
  Null message;

  CongViec({this.result, this.success, this.statusCode, this.message});

  CongViec.fromJson(Map<String, dynamic> json) {
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
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['idCongviec'] = idCongviec;
    data['ngaybatdau'] = ngaybatdau;
    data['ngayketthuc'] = ngayketthuc;
    data['mota'] = mota;
    data['idNguoichutri'] = idNguoichutri;
    data['idNguoiphancong'] = idNguoiphancong;
    data['loaicv'] = loaicv;
    return data;
  }
}
