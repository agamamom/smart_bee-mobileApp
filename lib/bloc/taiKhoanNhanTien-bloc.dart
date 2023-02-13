import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_bee/model/taiKhoanNhanTien-model.dart';
import 'package:smart_bee/resources/api-repository.dart';
part 'taiKhoanNhanTien-event.dart';
part 'taiKhoanNhanTien-state.dart';

class CovidBloc extends Bloc<TaiKhoanNhanTienEvent, TaiKhoanNhanTienState> {
  CovidBloc() : super(TaiKhoanNhanTienInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetTaiKhoanNhanTienList>((event, emit) async {
      emit(TaiKhoanNhanTienLoading());
      try {
        final mList = await _apiRepository.fetchTaiKhoanNhanTien();
        emit(TaiKhoanNhanTienLoaded(mList));
      } on NetworkError {
        emit(const TaiKhoanNhanTienError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }
}
