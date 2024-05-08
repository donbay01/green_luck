import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterflow_paginate_firestore/paginate_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_luck/theme/colors.dart';
import 'package:green_luck/widgets/card/game.dart';
import 'package:zap_sizer/zap_sizer.dart';
import '../../helper/snackbar.dart';
import '../../models/code.dart';
import '../../providers/auth.dart';
import '../../services/code/index.dart';
import '../../theme/text_style.dart';

class FreeTips extends ConsumerWidget {
  const FreeTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(userProvider);

    if (user == null) {
      return const Center(
        child: CircularProgressIndicator(),
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
          Text('No Free Code Posted Yet!',style: mediumBold(primaryBlack),),
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
      query: CodeService.getCodes('free'),
      itemBuilderType: PaginateBuilderType.listView,
    );
  }
}
