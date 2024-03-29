import 'package:flutter/material.dart';
import 'package:zap_sizer/zap_sizer.dart';
import '../../theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final Function? onPressed;

  const PrimaryButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onPressed!(),
        style: ElevatedButton.styleFrom(
          backgroundColor: darkGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: child,
      ),
    );
  }
}
