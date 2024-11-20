import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:prj_reqres/common/app_colors.dart';
import 'package:prj_reqres/common/app_vectors.dart';
import 'package:prj_reqres/common/constants.dart';
import 'package:prj_reqres/common/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: Constants.DURATION_SPLASH), () {
      if (!mounted) return;
      context.goNamed(Navigation.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SvgPicture.asset(
          AppVectors.LOGO_APP_PATH,
          width: 125,
          height: 125,
        ),
      ),
    );
  }
}
