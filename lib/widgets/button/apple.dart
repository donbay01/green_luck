import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_luck/helper/snackbar.dart';
import 'package:green_luck/pages/homePage/homepage.dart';
import 'package:green_luck/services/auth/index.dart';
import 'package:zap_sizer/zap_sizer.dart';
import '../../theme/colors.dart';
import '../../theme/text_style.dart';

class AppleButton extends StatelessWidget {
  const AppleButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 6.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          try {
            var cred = await AuthService.appleAuth();

            if (cred.additionalUserInfo!.isNewUser) {
              await AuthService.createAccount(
                credential: cred,
                displayName: cred.user!.displayName,
              );
            }

            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const Homepage()),
              (route) => false,
            );
          } on FirebaseAuthException catch (e) {
            SnackbarHelper.displayToastMessage(
              context: context,
              message: e.message!,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryWhite,
          side: const BorderSide(color: darkGreen, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.apple,
              color: primaryBlack,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Apple',
              style: mediumBold(primaryBlack),
            ),
          ],
        ),
      ),
    );
  }
}
