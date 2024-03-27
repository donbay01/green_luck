import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_luck/pages/auth/regiter_page.dart';
import 'package:green_luck/theme/colors.dart';


import '../../theme/text_style.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;
  bool termsAndCondition = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Material(
        child: SingleChildScrollView(
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
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.longArrowLeft,
                      size: 20,
                      color: primaryWhite,
                    ),
                  ),

                  Text(
                    'Welcome\nBack',
                    style: TextStyle(
                      fontSize: 40,fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    style: smallText(primaryBlack),
                    controller: emailController,
                    autofillHints: const [AutofillHints.email],
                    onEditingComplete: () => [
                      FocusScope.of(context).unfocus(),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'Enter your email address',
                      hintStyle: smallText(primaryBlack),
                      labelStyle: const TextStyle(color: primaryBlack),
                      prefixIcon: Icon(Icons.email_outlined),
                      suffixIcon: emailController.text.isEmpty
                          ? Container(
                        width: 0,
                      )
                          : IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          emailController.clear();
                        },
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: darkGreen,
                          width: 1.0,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: smallText(primaryBlack),
                    controller: passwordController,
                    obscureText: _obscureText,
                    autofillHints: const [AutofillHints.password],
                    onEditingComplete: () => [
                      FocusScope.of(context).unfocus(),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Password*',
                      hintText: 'xxxxxxxxxx',
                      hintStyle: smallText(primaryBlack),
                      labelStyle: const TextStyle(color: primaryBlack),
                      filled: true,
                      fillColor: Colors.transparent,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _toggle();
                        },
                        icon: _obscureText
                            ? const Icon(
                          FontAwesomeIcons.eyeSlash,
                          color: Colors.black,
                          size: 15,
                        )
                            : const Icon(
                          Icons.remove_red_eye,
                          color: darkGreen,
                          size: 20,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color:darkGreen,
                          width: 1.0,
                        ),
                      ),
                    ),
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
                  SizedBox(
                    height: height * 0.06,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (_)=> HomePage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: mediumBold(primaryWhite),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(child: Text('or continue with',style: mediumText(primaryBlack),)),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: height * 0.06,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryWhite,
                        side: BorderSide(
                            color: darkGreen,width: 2
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.squareGooglePlus,color: primaryBlack,),
                          SizedBox(width: 10,),
                          Text(
                            'Google',
                            style: mediumBold(primaryBlack),
                          ),
                        ],
                      ),
                    ),
                  ),
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
    );
  }
}
