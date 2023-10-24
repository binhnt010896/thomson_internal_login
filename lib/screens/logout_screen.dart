import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:thomson_internal_login/controllers/login_controller.dart';
import 'package:thomson_internal_login/screen_router.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {

  LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    controller.logout().then((isSuccess) {
      if (isSuccess) {
        context.pushReplacement(Routes.LOGIN);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Signing out. Please wait...'),
      ),
    );
  }
}
