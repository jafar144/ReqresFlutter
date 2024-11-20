import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prj_reqres/data/api/api_service.dart';

import '../state.dart';

class HomeCubit extends Cubit<CommonState> {
  final ApiService apiService;

  HomeCubit(this.apiService) : super(Loading()) {
    _initDataHome();
  }

  void _initDataHome() async {
    try {
      final result = await apiService.getAllUser();
      result.fold((left) {
        emit(Error(message: left));
      }, (right) {
        emit(Success(data: right));
      });
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
