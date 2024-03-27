import 'package:flutter/material.dart';
import 'package:green_luck/pages/homePage/homepage.dart';
import 'package:green_luck/pages/splashScreen/splash_screen.dart';

class GreenLuck extends StatelessWidget {
  const GreenLuck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
