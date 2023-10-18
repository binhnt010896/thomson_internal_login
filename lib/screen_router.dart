import 'package:go_router/go_router.dart';
import 'package:thomson_internal_login/screens/login_screen.dart';
import 'package:thomson_internal_login/screens/not_found_screen.dart';
import 'package:thomson_internal_login/screens/success_screen.dart';

class Routes {
  static const SUCCESS = '/success';
  static const LOGIN = '/login';
  static const NOT_FOUND = '404';
}

class RouteQueryParams {}

class RoutePathParams {}

class RouteExtra {}

GoRouter get appRoutes => GoRouter(
  routes: [
    GoRoute(
      name: Routes.LOGIN,
      path: Routes.LOGIN,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: Routes.SUCCESS,
      path: Routes.SUCCESS,
      builder: (context, state) => const SuccessScreen(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
  initialLocation: Routes.LOGIN,
);
