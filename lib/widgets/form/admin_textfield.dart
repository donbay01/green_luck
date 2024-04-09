import 'package:flutter/material.dart';
import 'package:green_luck/theme/colors.dart';
import 'package:green_luck/widgets/form/textfield.dart';

class AdminTextField extends StatefulWidget {
  const AdminTextField({super.key});

  @override
  State<AdminTextField> createState() => _AdminTextFieldState();
}

class _AdminTextFieldState extends State<AdminTextField> {
  var text = TextEditingController();

  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: text,
      label: 'Code',
      hint: 'Enter code',
      keyboardType: TextInputType.text,
    );
  }
}
