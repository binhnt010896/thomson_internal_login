import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:thomson_internal_login/controllers/login_controller.dart';
import 'package:thomson_internal_login/screen_router.dart';
import 'package:thomson_internal_login/utilities/local_storage.dart';
import 'dart:html' as html;

class LogoutScreen extends StatefulWidget {
  final String? redirectUrl;
  const LogoutScreen({Key? key, this.redirectUrl}) : super(key: key);

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {

  LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.redirectUrl != null) {
        await local.saveString(REDIRECT_URL, widget.redirectUrl!);
      }
      await controller.logout().then((isSuccess) {
        if (isSuccess) {
          String url = local.getString(REDIRECT_URL);
          html.window.open(url, "_self");
        }
      });
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
