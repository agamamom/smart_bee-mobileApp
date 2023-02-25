// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_bee/model/tai_khoan_nhan_tien_model.dart';
import 'package:smart_bee/resources/api_repository.dart';
part 'tai_khoan_nhan_tien_event.dart';
part 'tai_khoan_nhan_tien_state.dart';

class TaiKhoanNhanTienBloc
    extends Bloc<TaiKhoanNhanTienEvent, TaiKhoanNhanTienState> {
  TaiKhoanNhanTienBloc() : super(TaiKhoanNhanTienInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetTaiKhoanNhanTienList>((event, emit) async {
      emit(TaiKhoanNhanTienLoading());
      try {
        final mList = await apiRepository.fetchTaiKhoanNhanTien();

        emit(TaiKhoanNhanTienLoaded(mList));
      } on NetworkError {
        emit(const TaiKhoanNhanTienError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }
}
