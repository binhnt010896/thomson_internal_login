import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:get/get.dart';
import 'package:thomson_internal_login/utilities/utilities.dart';

class LoginController extends GetxController {

  Rxn<AuthUser> currentUser = Rxn();
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    if (await isUserSignedIn()) {
      getCurrentUser().then((value) async {
        if (currentUser.value != null) {
          await fetchCurrentUserAttributes();
        }
      });
    }
    super.onInit();
  }

  Future<bool> login() async {
    bool isSignedIn = false;
    isLoading(true);
    try {
      SignInResult result = await Amplify.Auth.signInWithWebUI(
        provider: const AuthProvider.oidc("TMCAzureAD",
          "https://login.microsoftonline.com/9cde7595-2ba3-4104-993e-30d77a6905c4/v2.0"),
        options: const SignInWithWebUIOptions(
          pluginOptions: CognitoSignInWithWebUIPluginOptions(browserPackageName: 'com.android.chrome')
        )
      );
      safePrint('Sign in result: $result');
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

  Future<void> fetchCurrentUserAttributes() async {
    try {
      final result = await Amplify.Auth.fetchUserAttributes();
      for (final element in result) {
        safePrint('key: ${element.userAttributeKey}; value: ${element.value}');
      }
    } on AuthException catch (e) {
      safePrint('Error fetching user attributes: ${e.message}');
    }
  }
}
