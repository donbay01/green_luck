import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_luck/pages/auth/login_page.dart';
import 'package:green_luck/pages/drawer/premium_page.dart';
import 'package:green_luck/pages/onboardingScreen/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../helper/snackbar.dart';
import '../../models/user.dart';
import '../../services/auth/index.dart';
import '../../theme/colors.dart';
import '../../theme/text_style.dart';
import 'community.dart';
import 'help_support.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  // route(BuildContext context, UserModel? user) {
  //   if (user == null) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (_) => const LoginPage(),
  //       ),
  //     );
  //   } else {
  //     // Navigator.push(
  //     //   context,
  //     //   MaterialPageRoute(
  //     //     builder: (_) => const PremiumPage(),
  //     //   ),
  //     // );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // var prov = context.watch<AuthProvider>();
    // var user = AuthService.getCurrentUser()!;
    // var user = prov.providerId;

    return Drawer(
      backgroundColor: darkGreen,
      width: MediaQuery.of(context).size.width * 0.75,
      child: ListView(
        children: [
          const SizedBox(height: 100),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PremiumPage(),
                ),
              );
            },
            leading: Icon(
              FontAwesomeIcons.unlock,
              color: primaryWhite,
            ),
            title: Text(
              'Go Premium',
              style: mediumText(primaryWhite),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SupportPage(),
                ),
              );
            },
            leading: Icon(
              Icons.mail_lock,
              color: primaryWhite,
            ),
            title: Text(
              'Help & Support',
              style: mediumText(primaryWhite),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            onTap: () async {
              final urlLink = "www.greenluck.com";
              await Share.share(
                'Download Green Luck Sports prediction app.\n$urlLink',
              );
            },
            leading: Icon(
              FontAwesomeIcons.share,
              color: primaryWhite,
            ),
            title: Text(
              'Share the app',
              style: mediumText(primaryWhite),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CommunityPage(),
                ),
              );
            },
            leading: Icon(
              FontAwesomeIcons.peopleGroup,
              color: primaryWhite,
            ),
            title: Text(
              'Join our community',
              style: mediumText(primaryWhite),
            ),
          ),
          const SizedBox(height: 150),
          ListTile(
            onTap: () => showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) => AlertDialog(
                backgroundColor: darkGreen,
                title: Text(
                  'Are You sure you want to log out?',
                  style: mediumText(primaryWhite),
                ),
                content: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        // AuthService.logout();
                        // // PurchaseService.logOut();
                        // Navigator.pushAndRemoveUntil(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const OnboardingScreen(),
                        //   ),
                        //       (route) => false,
                        // );
                      },
                      child: Text(
                        'Yes',
                        style: mediumText(primaryWhite),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'No',
                        style: mediumText(Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            leading: const Icon(
              Icons.logout,
              color: primaryWhite,
            ),
            title: Text(
              'Log out',
              style: mediumText(primaryWhite),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            onTap: () => showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) => AlertDialog(
                backgroundColor: darkGreen,
                title: Text(
                  'Are You sure you want to delete your account?',
                  style: mediumText(primaryWhite),
                ),
                content: Row(
                  children: [
                    TextButton(
                      onPressed: () async {
                        // try {
                        //   await ProgressService.show(context);
                        //   await AuthService.deleteAccount();
                        //   await ProgressService.hide();
                        //   Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const OnboardingScreen(),
                        //     ),
                        //         (route) => false,
                        //   );
                        // } on FirebaseAuthException catch (e) {
                        //   ProgressService.hide();
                        //   SnackbarHelper.displayToastMessage(
                        //     context: context,
                        //     message: e.message!,
                        //   );
                        // }
                      },
                      child: Text(
                        'Yes',
                        style: mediumText(primaryWhite),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'No',
                        style: mediumText(Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            leading: const Icon(
              Icons.delete,
              color: primaryWhite,
            ),
            title: Text(
              'Deactivate account',
              style: mediumText(primaryWhite),
            ),
          ),
          const SizedBox(height: 50),
          Center(
            child: TextButton(
              onPressed: () async {
                const url = 'https://www.betcode.live/';
                if (await canLaunchUrlString(url)) {
                  await launchUrlString(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
              child: RichText(
                text: TextSpan(
                  text: 'Powered by ',
                  style: smallBold(primaryWhite),
                  children: [
                    TextSpan(
                      text: ' Bet Code ',
                      style: mediumBold(Colors.deepOrange),
                    ),
                    TextSpan(text: 'Limited', style: mediumBold(primaryWhite))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
