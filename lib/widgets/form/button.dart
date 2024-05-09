import 'package:flutter/material.dart';
import 'package:green_luck/theme/colors.dart';
import 'package:zap_sizer/zap_sizer.dart';


class CustomButton extends StatelessWidget {
  final Function? function;
  final Color color;
  final Widget child;

  const CustomButton({
    super.key,
    required this.child,
    this.function,
    this.color = darkGreen,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          function!();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: color,
        ),
        child: child,
      ),
    );
  }
}
