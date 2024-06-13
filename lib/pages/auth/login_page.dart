import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_luck/helper/snackbar.dart';
import 'package:green_luck/pages/auth/register_page.dart';
import 'package:green_luck/pages/homePage/homepage.dart';
import 'package:green_luck/services/auth/index.dart';
import 'package:green_luck/theme/colors.dart';
import 'package:green_luck/widgets/button/google.dart';
import 'package:green_luck/widgets/button/primary.dart';
import 'package:green_luck/widgets/form/textfield.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:zap_sizer/zap_sizer.dart';
import '../../theme/text_style.dart';
import '../../widgets/button/apple.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var key = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  login() async {
    var valid = key.currentState!.validate();
    if (!valid) {
      return SnackbarHelper.displayToastMessage(
        context: context,
        message: 'Fill all required fields',
      );
    }

    context.loaderOverlay.show();

    try {
      await AuthService.login(
        email: emailController.text,
        password: passwordController.text,
      );
      context.loaderOverlay.hide();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const Homepage()),
            (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      context.loaderOverlay.hide();
      SnackbarHelper.displayToastMessage(
        context: context,
        message: e.message!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 100.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/auth.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: key,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          FontAwesomeIcons.arrowLeftLong,
                          size: 20,
                          color: primaryWhite,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          style: veryBoldText(primaryBlack),
                          children: [
                            TextSpan(text: ' Wel'),
                            TextSpan(
                              text: 'come',
                              style: veryBoldText(primaryWhite),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: veryBoldText(primaryBlack),
                          children: [
                            TextSpan(text: ' Bac'),
                            TextSpan(
                              text: 'k!',
                              style: veryBoldText(primaryWhite),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomTextField(
                        controller: emailController,
                        label: 'Email Address',
                        hint: 'Enter your email address',
                        keyboardType: TextInputType.emailAddress,
                        radius: 25,
                        prefixIcon: const Icon(Icons.email_outlined),
                        isEmail: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: passwordController,
                        label: 'Password*',
                        hint: 'xxxxxxxxxx',
                        prefixIcon: const Icon(Icons.lock),
                        isPassword: true,
                        radius: 25,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgotPassword(),
                                ),
                              );
                            },
                            child: Text(
                              'Forgot Password?',
                              style: small(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PrimaryButton(
                        onPressed: () => login(),
                        child: Text(
                          'Login',
                          style: mediumBold(primaryWhite),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'or continue with',
                          style: mediumText(primaryBlack),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Platform.isIOS ? AppleButton(): Text(''),
                      const SizedBox(
                        height: 20,
                      ),
                      GoogleButton(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account ?",
                            style: smallText(primaryBlack),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const RegisterPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Register',
                              style: medium(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
