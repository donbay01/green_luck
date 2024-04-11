import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterflow_paginate_firestore/paginate_firestore.dart';
import 'package:green_luck/providers/auth.dart';
import 'package:green_luck/theme/text_style.dart';
import 'package:green_luck/widgets/card/game.dart';
import 'package:zap_sizer/zap_sizer.dart';

import '../../helper/snackbar.dart';
import '../../models/code.dart';
import '../../services/code/index.dart';
import '../../theme/colors.dart';
import '../drawer/help_support.dart';
import '../drawer/premium_page.dart';

class PremiumTips extends ConsumerWidget {
  const PremiumTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(userProvider);

    var height = 100.h;
    var width = 100.w;

    if (user == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (user.role != 'Paid' && user.role != 'admin') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Are your ready to level up?',
            style: mediumSemiBold(primaryWhite),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if (Platform.isIOS) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SupportPage(),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PremiumPage(),
                  ),
                );
              }
            },
            child: Text('WE MOVE'),
          ),
        ],
      );
    }

    return PaginateFirestore(
      shrinkWrap: true,
      isLive: true,
      onEmpty: const Center(
        child: Text(
          'No codes here....',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      itemBuilder: (context, snapshots, index) {
        var snap = snapshots[index];
        var code = Code.fromSnapshot(
          snap.id,
          snap.data() as dynamic,
        );

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                GameCard(
                  code: code,
                  user: user!,
                ),
              ],
            ),
          ),
        );
      },
      query: CodeService.getCodes('premium'),
      itemBuilderType: PaginateBuilderType.listView,
    );
  }
}
