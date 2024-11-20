import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prj_reqres/bloc/detail/detail_cubit.dart';
import 'package:prj_reqres/bloc/home/home_cubit.dart';
import 'package:prj_reqres/common/app_colors.dart';
import 'package:prj_reqres/common/navigation.dart';
import 'package:prj_reqres/service_locator/locator.dart';

void main() {
  setupLocator();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.primaryColor,
    ),
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<DetailCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Reqres Test Project',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: AppColors.primaryColor,
          fontFamily: 'CircularStd',
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: Navigation.router,
      ),
    );
  }
}
