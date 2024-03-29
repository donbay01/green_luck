import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_luck/pages/auth/login_page.dart';
import 'package:green_luck/pages/auth/register_page.dart';
import 'package:green_luck/theme/colors.dart';

import '../../theme/text_style.dart';
import '../auth/forgot_password.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/onboard.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Image(image: AssetImage('assets/whiteLogo.png'))),
            SizedBox(
              height: 10,
            ),
            Text(
              'Let The Four Leaf Clover\nGuide Your Path',
              style: GoogleFonts.montaguSlab(
                  textStyle: TextStyle(color: primaryWhite, fontSize: 25)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RegisterPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryWhite,
                      side: BorderSide(color: primaryBlack, width: 2)),
                  child: Text(
                    'Get Started',
                    style: mediumBold(primaryBlack),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
