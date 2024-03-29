import 'package:flutter/material.dart';
import 'package:green_luck/services/auth/index.dart';
import '../../theme/colors.dart';
import '../../theme/text_style.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var user = AuthService.getCurrentUser()!;

    return Container(
      color: darkGreen,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  child: Icon(Icons.person),
                  // radius: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: mediumText(primaryWhite),
                    ),
                    Text(
                      user.displayName ?? 'Guest',
                      style: mediumBold(primaryWhite),
                    ),
                  ],
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                size: 25,
                color: primaryWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
