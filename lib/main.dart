import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:thomson_internal_login/screen_router.dart';
import 'package:thomson_internal_login/utilities/consts.dart';
import 'package:thomson_internal_login/utilities/theme_data.dart';
import 'package:url_strategy/url_strategy.dart';

import 'amplifyconfiguration_mobile.dart' as Config;

void main() async {
  /// Ensure initialization
  WidgetsFlutterBinding.ensureInitialized();

  /// Init date formatting
  await initializeDateFormatting();

  /// Remove hash (#) icon from url
  setPathUrlStrategy();

  /// go_router update URL
  GoRouter.optionURLReflectsImperativeAPIs = true;

  _configureAmplify();
  runApp(const MyApp());
}

Future<void> _configureAmplify() async {
  final authPlugin = AmplifyAuthCognito();
  await Amplify.addPlugin(authPlugin);
  await Amplify.configure(Config.amplifyconfig);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: MAX_MOBILE_WIDTH, name: MOBILE),
          const Breakpoint(
              start: MAX_MOBILE_WIDTH, end: MAX_TABLET_WIDTH, name: TABLET),
        ],
      ),
      title: 'Internal Portal Login',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: appRoutes,
    );
  }
}
