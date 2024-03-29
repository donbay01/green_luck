import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_luck/helper/snackbar.dart';
import 'package:green_luck/services/auth/index.dart';
import 'package:green_luck/theme/text_style.dart';
import 'package:green_luck/widgets/button/primary.dart';
import 'package:green_luck/widgets/form/textfield.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:zap_sizer/zap_sizer.dart';
import '../../theme/colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  resetPassword() async {
    context.loaderOverlay.show();

    try {
      await AuthService.resetPassword(email: emailController.text);
      context.loaderOverlay.hide();

      SnackbarHelper.displayToastMessage(
        context: context,
        message: 'Email Sent',
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
      child: Material(
        child: Container(
          height: 100.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/auth.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: boldText(primaryBlack),
                      children: [
                        TextSpan(text: ' Rese'),
                        TextSpan(
                          text: 't Your Pass',
                          style: boldText(primaryWhite),
                        ),
                        TextSpan(
                          text: 'word',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  controller: emailController,
                  label: 'Email Address',
                  hint: 'Enter your email address',
                  keyboardType: TextInputType.emailAddress,
                  radius: 25,
                  isEmail: true,
                ),
                const SizedBox(
                  height: 50,
                ),
                PrimaryButton(
                  onPressed: resetPassword,
                  child: Text(
                    'Reset Password',
                    style: mediumBold(primaryWhite),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.house,
                        color: darkGreen,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Return Home',
                        style: mediumText(primaryBlack),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
