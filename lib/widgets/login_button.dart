import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thomson_internal_login/controllers/login_controller.dart';
import 'package:thomson_internal_login/utilities/local_storage.dart';
import 'dart:html' as html;
import 'package:thomson_internal_login/widgets/button_widget.dart';

class LoginButton extends StatefulWidget {
  final String? redirectUrl;
  final bool isFromInternalApp;
  const LoginButton({Key? key, this.redirectUrl, this.isFromInternalApp = false}) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.isUserSignedIn().then((isSuccess) {
        if (isSuccess) {
          _getTokenAndRedirect();
        } else {
          if (widget.isFromInternalApp) {
            _login();
          }
        }
      });
    });
  }

  _getTokenAndRedirect() {
    controller.fetchTokens().then((tokens) async {
      String url = '${local.getString(REDIRECT_URL)}?token=${tokens['token']}&digest=${tokens['digest']}';
      html.window.open(url, "_self");
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  _login() {
    controller.login().then((isSuccess) {
      if (isSuccess) {
        _getTokenAndRedirect();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ButtonWidget(
        title: 'AD Login',
        isLoading: controller.isLoading.isTrue,
        enabled: controller.isLoading.isFalse,
        padding: EdgeInsets.zero,
        onPressed: () {
          controller.login().then((isSuccess) {
            if (isSuccess) {
              _getTokenAndRedirect();
            }
          });
        },
      );
    },
    );
  }
}
