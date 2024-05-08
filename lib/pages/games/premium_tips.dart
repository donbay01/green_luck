import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterflow_paginate_firestore/paginate_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 100,),
          Icon(FontAwesomeIcons.rocket,size: 50,color: darkGreen,),
          SizedBox(height: 20,),
          Text(
            'Go Premium or Go Home!',
            style: mediumSemiBold(primaryBlack),
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
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("LET'S GO",style: mediumBold(darkGreen),),
            ),
          ),
        ],
      );
    }

    return PaginateFirestore(
      shrinkWrap: true,
      isLive: true,
      onEmpty:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100,),
          Icon(FontAwesomeIcons.boxOpen,size: 50,color: primaryBlack,),
          SizedBox(height: 20,),
          Text('No Code Posted Yet!',style: mediumBold(primaryBlack),),
        ],
      ),
      itemBuilder: (context, snapshots, index) {
        var snap = snapshots[index];
        var code = Code.fromSnapshot(
          snap.id,
          snap.data() as dynamic,
        );

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(height: 20,),
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
