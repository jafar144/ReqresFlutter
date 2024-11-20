import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prj_reqres/bloc/detail/detail_state.dart';
import 'package:prj_reqres/data/api/api_service.dart';

class DetailCubit extends Cubit<DetailState> {
  final ApiService apiService;
  DetailCubit(this.apiService) : super(Idle());

  void getDetailUser(int userId) async {
    emit(Loading());
    try {
      final result = await apiService.getDetailUser(userId);
      result.fold(
        (left) {
          emit(Error(message: left));
        },
        (right) {
          emit(Success(data: right.user));
        },
      );
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
