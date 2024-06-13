import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../theme/colors.dart';
import '../../theme/text_style.dart';


class AccountHeader extends StatelessWidget {
  final UserModel? user;

  const AccountHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          user?.displayName ?? 'Guest',
          style: mediumBold(primaryWhite),
        ),
        const SizedBox(
          width: 10,
        ),
        const CircleAvatar(backgroundImage: AssetImage('assets/logo.png')),
      ],
    );
  }
}
