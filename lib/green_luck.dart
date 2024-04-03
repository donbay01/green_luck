import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_luck/constants/name.dart';
import 'package:green_luck/pages/homePage/homepage.dart';
import 'package:green_luck/pages/splashScreen/splash_screen.dart';
import 'package:green_luck/services/auth/index.dart';
import 'package:green_luck/theme/colors.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:zap_sizer/zap_sizer.dart';

import 'providers/auth.dart';

class GreenLuck extends ConsumerStatefulWidget {
  const GreenLuck({Key? key}) : super(key: key);

  @override
  ConsumerState<GreenLuck> createState() => _GreenLuckState();
}

class _GreenLuckState extends ConsumerState<GreenLuck> {
  late StreamSubscription<User?> stream;

  @override
  void initState() {
    stream = AuthService.listen().listen((user) async {
      if (user != null) {
        var model = await AuthService.getUser();
        ref.read(userProvider.notifier).state = model;
      } else {
        ref.read(userProvider.notifier).state = null;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    stream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ZapSizer(
      builder: (context, constraints) => GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidgetBuilder: (progress) => const Center(
          child: CupertinoActivityIndicator(
            color: darkGreen,
            radius: 16,
          ),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: appName,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          home: AuthService.getCurrentUser() == null
              ? const SplashScreen()
              : const Homepage(),
        ),
      ),
    );
  }
}
