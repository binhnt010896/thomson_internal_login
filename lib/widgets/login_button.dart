import 'dart:io';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:thomson_internal_login/controllers/login_controller.dart';
import 'package:thomson_internal_login/screen_router.dart';
import 'package:thomson_internal_login/widgets/button_widget.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    controller.isUserSignedIn().then((isSuccess) {
      if (isSuccess) {
        Future.wait([
          controller.fetchAccessToken(),
          controller.fetchRefreshToken()
        ]).then((tokens) {
          context.pushReplacement('${Routes.SUCCESS}?access_token=${tokens[0]}&refresh_token=${tokens[1]}');
        }).onError((error, stackTrace) {
          print(error);
        });
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
              context.pushReplacement(Routes.SUCCESS);
            }
          });
        },
      );
    },
    );
  }
}
