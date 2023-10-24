import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:thomson_internal_login/utilities/consts.dart';
import 'package:thomson_internal_login/utilities/images.dart';
import 'package:thomson_internal_login/utilities/text_styles.dart';
import 'package:thomson_internal_login/widgets/login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
            const LoginButton()
          ],
        ),
      )
    ];
    return Scaffold(
      body: Center(
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
      ),
    );
  }
}
