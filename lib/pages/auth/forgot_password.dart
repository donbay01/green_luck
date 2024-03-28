import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_luck/theme/text_style.dart';

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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Material(
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/auth.png'), fit: BoxFit.cover)),
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
                          TextSpan(text: 't Your Pass',style: boldText(primaryWhite)),
                          TextSpan(text: 'word',)
                        ]
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  style: smallText(primaryBlack),
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: mediumText(primaryBlack),
                    hintText: 'Enter your email address',
                    hintStyle: smallText(primaryBlack),
                    filled: true,
                    fillColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: darkGreen,
                        width: 1.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: darkGreen),
                    child: Text(
                      'Reset Password',
                      style: mediumBold(primaryWhite),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
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
                      Text('Return Home', style: mediumText(primaryBlack)),
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
