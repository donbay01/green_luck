import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterflow_paginate_firestore/paginate_firestore.dart';
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
      onEmpty: Center(
        child: Text(
          'No codes here....',
          style: mediumBold(primaryWhite),
        ),
      ),
      itemBuilder: (context, snapshots, index) {
        var snap = snapshots[index];
        var code = Code.fromSnapshot(
          snap.id,
          snap.data() as dynamic,
        );

        return GameCard(
          code: code,
          user: user,
        );
      },
      query: CodeService.getCodes('free'),
      itemBuilderType: PaginateBuilderType.listView,
    );
  }
}
