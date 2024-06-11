import 'package:flutter/cupertino.dart';

import '../../theme/colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: darkGreen,
      ),
    );
  }
}
