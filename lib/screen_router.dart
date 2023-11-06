import 'package:go_router/go_router.dart';
import 'package:thomson_internal_login/screens/login_screen.dart';
import 'package:thomson_internal_login/screens/logout_screen.dart';
import 'package:thomson_internal_login/screens/not_found_screen.dart';
import 'package:thomson_internal_login/screens/success_screen.dart';
import 'package:thomson_internal_login/utilities/local_storage.dart';

class Routes {
  static const SUCCESS = '/success';
  static const LOGIN = '/login';
  static const LOGOUT = '/logout';
  static const NOT_FOUND = '404';
}

class RouteQueryParams {
  static const SOURCE = 'source';
  static const REDIRECT_URL = 'redirect_url';
}

class RoutePathParams {}

class RouteExtra {}

GoRouter get appRoutes => GoRouter(
  routes: [
    GoRoute(
      name: Routes.LOGIN,
      path: Routes.LOGIN,
      builder: (context, state) {
        return LoginScreen(
          redirectUrl: state.uri.queryParameters[RouteQueryParams.REDIRECT_URL],
          isFromInternalApp: state.uri.queryParameters[RouteQueryParams.SOURCE] == 'internal',
        );
      },
    ),
    GoRoute(
      name: Routes.SUCCESS,
      path: Routes.SUCCESS,
      builder: (context, state) => const SuccessScreen(),
    ),
    GoRoute(
      name: Routes.LOGOUT,
      path: Routes.LOGOUT,
      builder: (context, state) => LogoutScreen(
        redirectUrl: state.uri.queryParameters[REDIRECT_URL]
      ),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
  // initialLocation: '${Routes.LOGIN}?redirect_url=https://google.com',
  initialLocation: Routes.LOGIN,
  redirect: (context, state) {
    if (state.pathParameters.containsKey('token')) {
      return Routes.SUCCESS;
    }
    return null;
  },
);
