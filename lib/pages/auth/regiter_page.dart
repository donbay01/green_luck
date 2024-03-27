import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../theme/colors.dart';
import '../../theme/text_style.dart';
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

  bool _obscureText = true;
  bool hasInternet = false;
  bool termsAndCondition = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _changeTerms(bool newValue) =>
      setState(() => termsAndCondition = newValue);

  @override
  void initState() {
    super.initState();
    emailController.addListener(onListen);
    userNameController.addListener(onListen);
  }

  @override
  void dispose() {
    emailController.removeListener(onListen);
    userNameController.removeListener(onListen);
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onListen() => setState(() {});

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
                    "Let's get\nStarted",
                    style: TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: smallText(primaryBlack),
                    controller: userNameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: const TextStyle(color: primaryBlack),
                      hintText: 'Enter your username',
                      hintStyle: smallText(primaryBlack),
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: userNameController.text.isEmpty
                          ? Container(
                        width: 0,
                      )
                          : IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          userNameController.clear();
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: smallText(primaryBlack),
                    controller: emailController,
                    autofillHints: const [AutofillHints.email],
                    onEditingComplete: () => [
                      // TextInput.finishAutofillContext(),
                      FocusScope.of(context).unfocus(),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: const TextStyle(color: primaryBlack),
                      hintText: 'Enter your email address',
                      hintStyle: smallText(primaryBlack),
                      prefixIcon: Icon(Icons.email_outlined),
                      suffixIcon: emailController.text.isEmpty
                          ? Container(
                        width: 0,
                      )
                          : IconButton(
                        icon: const Icon(Icons.close),
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
                    autofillHints: [AutofillHints.password],
                    onEditingComplete: () => [
                      // TextInput.finishAutofillContext(),
                      FocusScope.of(context).unfocus(),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Password*',
                      hintText: 'xxxxxxxxxx',
                      labelStyle: const TextStyle(color: primaryBlack),
                      hintStyle: smallText(primaryBlack),
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
                          color: Colors.black,
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
                          color: darkGreen,
                          width: 1.0,
                        ),
                      ),
                    ),
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
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        'Register',
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
    );
  }
}
