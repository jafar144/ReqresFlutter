import 'package:go_router/go_router.dart';
import 'package:prj_reqres/screens/detail_screen.dart';
import 'package:prj_reqres/screens/home_screen.dart';
import 'package:prj_reqres/screens/splash_screen.dart';

class Navigation {
  static const splash = "splash";
  static const home = "home";
  static const detail = "detail";

  static final router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/',
        name: home,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'users/:id',
            name: detail,
            builder: (context, state) {
              final id = state.pathParameters['id'].toString();
              return DetailScreen(idUser: id);
            },
          ),
        ],
      ),
    ],
  );
}
