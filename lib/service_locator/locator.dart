import 'package:get_it/get_it.dart';
import 'package:prj_reqres/data/api/api_service.dart';

import '../bloc/detail/detail_cubit.dart';
import '../bloc/home/home_cubit.dart';
import '../data/api/dio_config.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<DioConfig>(() => DioConfig());
  locator.registerLazySingleton<ApiService>(() => ApiService());

  locator.registerFactory<HomeCubit>(() => HomeCubit(locator<ApiService>()));
  locator
      .registerFactory<DetailCubit>(() => DetailCubit(locator<ApiService>()));
}
