part of 'tai_khoan_nhan_tien_bloc.dart';

abstract class TaiKhoanNhanTienState extends Equatable {
  const TaiKhoanNhanTienState();

  @override
  List<Object?> get props => [];
}

class TaiKhoanNhanTienInitial extends TaiKhoanNhanTienState {}

class TaiKhoanNhanTienLoading extends TaiKhoanNhanTienState {}

class TaiKhoanNhanTienLoaded extends TaiKhoanNhanTienState {
  final TaiKhoanNhanTienModel taiKhoanNhanTienModel;
  const TaiKhoanNhanTienLoaded(this.taiKhoanNhanTienModel);
}

class TaiKhoanNhanTienError extends TaiKhoanNhanTienState {
  final String? message;
  const TaiKhoanNhanTienError(this.message);
  @override
  List<Object?> get props => [message];
}
