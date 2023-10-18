import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:thomson_internal_login/controllers/login_controller.dart';
import 'package:thomson_internal_login/screen_router.dart';
import 'package:thomson_internal_login/widgets/button_widget.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
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
