part of 'tai_khoan_nhan_tien_bloc.dart';

abstract class TaiKhoanNhanTienEvent extends Equatable {
  const TaiKhoanNhanTienEvent();

  @override
  List<Object> get props => [];
}

class GetTaiKhoanNhanTienList extends TaiKhoanNhanTienEvent {}
