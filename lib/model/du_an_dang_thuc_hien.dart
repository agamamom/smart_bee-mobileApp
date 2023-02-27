class DuAnDangThucHienModel {
  List<Result>? result;
  bool? success;
  int? statusCode;
  // ignore: prefer_void_to_null
  Null message;

  DuAnDangThucHienModel(
      {this.result, this.success, this.statusCode, this.message});

  DuAnDangThucHienModel.fromJson(Map<String, dynamic> json) {
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
  String? icon;
  String? title;
  String? hdSo;
  String? name;
  String? code;
  String? nhom;
  String? coQuan;
  String? nguoichutri;
  String? tenLoai;
  String? ngaybatdau;
  String? ngayketthuc;
  String? tong;
  String? tongGioCong;
  String? phoiHop;
  String? idda;
  String? loai;
  String? idNguoichutri;
  String? idcq;
  String? namdau;
  String? namcuoi;
  String? count;

  Result(
      {this.id,
      this.icon,
      this.title,
      this.hdSo,
      this.name,
      this.code,
      this.nhom,
      this.coQuan,
      this.nguoichutri,
      this.tenLoai,
      this.ngaybatdau,
      this.ngayketthuc,
      this.tong,
      this.tongGioCong,
      this.phoiHop,
      this.idda,
      this.loai,
      this.idNguoichutri,
      this.idcq,
      this.namdau,
      this.namcuoi,
      this.count});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    title = json['title'];
    hdSo = json['hdSo'];
    name = json['name'];
    code = json['code'];
    nhom = json['nhom'];
    coQuan = json['coQuan'];
    nguoichutri = json['nguoichutri'];
    tenLoai = json['tenLoai'];
    ngaybatdau = json['ngaybatdau'];
    ngayketthuc = json['ngayketthuc'];
    tong = json['tong'];
    tongGioCong = json['tongGioCong'];
    phoiHop = json['phoiHop'];
    idda = json['idda'];
    loai = json['loai'];
    idNguoichutri = json['idNguoichutri'];
    idcq = json['idcq'];
    namdau = json['namdau'];
    namcuoi = json['namcuoi'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['icon'] = icon;
    data['title'] = title;
    data['hdSo'] = hdSo;
    data['name'] = name;
    data['code'] = code;
    data['nhom'] = nhom;
    data['coQuan'] = coQuan;
    data['nguoichutri'] = nguoichutri;
    data['tenLoai'] = tenLoai;
    data['ngaybatdau'] = ngaybatdau;
    data['ngayketthuc'] = ngayketthuc;
    data['tong'] = tong;
    data['tongGioCong'] = tongGioCong;
    data['phoiHop'] = phoiHop;
    data['idda'] = idda;
    data['loai'] = loai;
    data['idNguoichutri'] = idNguoichutri;
    data['idcq'] = idcq;
    data['namdau'] = namdau;
    data['namcuoi'] = namcuoi;
    data['count'] = count;
    return data;
  }
}
