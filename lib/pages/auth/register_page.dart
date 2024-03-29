import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_luck/helper/snackbar.dart';
import 'package:green_luck/services/auth/index.dart';
import 'package:green_luck/widgets/button/google.dart';
import 'package:green_luck/widgets/button/primary.dart';
import 'package:green_luck/widgets/form/textfield.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:zap_sizer/zap_sizer.dart';
import '../../theme/colors.dart';
import '../../theme/text_style.dart';
import '../homePage/homepage.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool termsAndCondition = false;

  var key = GlobalKey<FormState>();

  void _changeTerms(bool newValue) =>
      setState(() => termsAndCondition = newValue);

  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  register() async {
    var isValid = key.currentState!.validate();

    if (!isValid) {
      return SnackbarHelper.displayToastMessage(
        context: context,
        message: 'You need to fill in all the required fields',
      );
    }

    if (!termsAndCondition) {
      return SnackbarHelper.displayToastMessage(
        context: context,
        message: 'You need to accept the terms and conditions',
      );
    }

    context.loaderOverlay.show();

    try {
      var credential = await AuthService.signUp(
        email: emailController.text,
        password: passwordController.text,
      );

      await AuthService.createAccount(
        credential: credential,
        displayName: userNameController.text,
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
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Form(
                key: key,
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
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        style: veryBoldText(primaryBlack),
                        children: [
                          TextSpan(text: " Let'"),
                          TextSpan(
                            text: "s get",
                            style: veryBoldText(primaryWhite),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: veryBoldText(primaryBlack),
                        children: [
                          TextSpan(text: " Star"),
                          TextSpan(
                            text: 'ted',
                            style: veryBoldText(primaryWhite),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: userNameController,
                      label: 'Username',
                      hint: 'Enter your username',
                      prefixIcon: const Icon(Icons.person),
                      radius: 25,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: emailController,
                      label: 'Email Address',
                      hint: 'Enter your email address',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      radius: 25,
                      isEmail: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      label: 'Password*',
                      hint: 'xxxxxxxxxx',
                      radius: 25,
                      prefixIcon: const Icon(Icons.lock),
                      isPassword: true,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CheckboxListTile(
                      activeColor: darkGreen,
                      checkColor: primaryWhite,
                      title: Text(
                        'I accept the Terms and Conditions',
                        style: smallText(primaryBlack),
                      ),
                      value: termsAndCondition,
                      onChanged: (newValue) {
                        setState(() {
                          termsAndCondition = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    PrimaryButton(
                      onPressed: () => register(),
                      child: Text(
                        'Register',
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
                    const GoogleButton(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ?",
                          style: smallText(primaryBlack),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Login',
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
    );
  }
}
