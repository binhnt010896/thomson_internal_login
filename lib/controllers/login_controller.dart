import 'dart:convert';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:encrypt/encrypt.dart' as ec;
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:thomson_internal_login/utilities/consts.dart';
import 'package:thomson_internal_login/utilities/utilities.dart';

class LoginController extends GetxController {

  Rxn<AuthUser> currentUser = Rxn();
  RxBool isLoading = false.obs;

  Future<bool> login() async {
    bool isSignedIn = await isUserSignedIn();
    if (isSignedIn) {
      await getCurrentUser();
      return true;
    }
    isLoading(true);
    try {
      SignInResult result = await Amplify.Auth.signInWithWebUI(
        provider: const AuthProvider.oidc("TMCAzureAD",
          "https://login.microsoftonline.com/9cde7595-2ba3-4104-993e-30d77a6905c4/v2.0"),
        options: const SignInWithWebUIOptions(
          pluginOptions: CognitoSignInWithWebUIPluginOptions(browserPackageName: !kIsWeb ? 'com.android.chrome' : null)
        )
      );
      print('Sign in result: $result');
      isSignedIn = result.isSignedIn;
    } on UserCancelledException catch (e) {
      isLoading(false);
      showToast(e.message, ToastType.error);
      return false;
    } catch (e) {
      isLoading(false);
      showToast(e.toString(), ToastType.error);
      return false;
    }
    isLoading(false);
    return isSignedIn;
  }

  Future<bool> isUserSignedIn() async {
    final result = await Amplify.Auth.fetchAuthSession();
    return result.isSignedIn;
  }

  Future<void> getCurrentUser() async {
    final user = await Amplify.Auth.getCurrentUser();
    currentUser(user);
  }

  Future<Map<String, dynamic>> fetchTokens() async {
    final cognitoPlugin = Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
    final result = await cognitoPlugin.fetchAuthSession();
    String accessToken = result.userPoolTokensResult.value.accessToken.toJson();
    String refreshToken = result.userPoolTokensResult.value.refreshToken;
    String idToken = result.userPoolTokensResult.value.idToken.toJson();

    /// Encrypt tokens
    ec.Encrypter encrypter = ec.Encrypter(ec.AES(ec.Key.fromUtf8(ENCRYPTION_SECRET_KEY), mode: ec.AESMode.cbc));
    ec.Encrypted encrypted = encrypter.encrypt(json.encode({
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'id_token': idToken
    }), iv: ec.IV.fromUtf8(ENCRYPTION_SECRET_IV));
    Hmac hmacSha256 = Hmac(sha256, utf8.encode(MAC_SECRET_KEY));
    Digest digest = hmacSha256.convert(encrypted.bytes);

    return {
      'digest': Uri.encodeComponent(base64Encode(digest.bytes)),
      'token': Uri.encodeComponent(encrypted.base64)
    };
  }

  Future<bool> logout() async {
    bool isSuccess = false;
    try {
      await Amplify.Auth.signOut();
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
    }
    return isSuccess;
  }
}
