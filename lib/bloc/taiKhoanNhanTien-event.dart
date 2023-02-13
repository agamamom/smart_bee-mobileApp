part of 'taiKhoanNhanTien-bloc.dart';

abstract class TaiKhoanNhanTienEvent extends Equatable {
  const TaiKhoanNhanTienEvent();

  @override
  List<Object> get props => [];
}

class GetTaiKhoanNhanTienList extends TaiKhoanNhanTienEvent {}
