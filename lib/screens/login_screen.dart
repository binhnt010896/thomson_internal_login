import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:thomson_internal_login/controllers/login_controller.dart';
import 'package:thomson_internal_login/utilities/consts.dart';
import 'package:thomson_internal_login/utilities/images.dart';
import 'package:thomson_internal_login/utilities/local_storage.dart';
import 'package:thomson_internal_login/utilities/text_styles.dart';
import 'package:thomson_internal_login/widgets/login_button.dart';

class LoginScreen extends StatefulWidget {
  final String? redirectUrl;
  final bool isFromInternalApp;
  const LoginScreen({Key? key, this.redirectUrl, this.isFromInternalApp = false}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.redirectUrl != null) {
        await local.saveString(REDIRECT_URL, widget.redirectUrl!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPCView = (context.width) > MAX_TABLET_WIDTH;
    List<Widget> sections = [
      Image.asset(AssetImages.loginIllustration),
      Container(
        constraints: const BoxConstraints(maxWidth: 300),
        padding: EdgeInsets.symmetric(horizontal: isPCView ? context.width/8 : 0),
        child: Column(
          crossAxisAlignment: isPCView ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          mainAxisAlignment: isPCView ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            if (isPCView)
              Image.asset(
                AssetImages.fullLogo,
                width: 120,
              ),
            const SizedBox(height: 24),
            Text('Thomson Employee\nService Portal',
                style: TextStyles.headlineM, textAlign: isPCView ? TextAlign.start : TextAlign.center),
            const SizedBox(height: 24),
            LoginButton(
              redirectUrl: widget.redirectUrl,
              isFromInternalApp: widget.isFromInternalApp
            )
          ],
        ),
      )
    ];
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.isTrue) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: isPCView
                ? Row(
              children: [
                for (Widget section in sections)
                  Expanded(
                    child: section,
                  )
              ],
            ) : Column(
              children: [
                for (Widget section in sections)
                  Expanded(
                    child: section,
                  )
              ],
            ),
          ),
        );
      }),
    );
  }
}
