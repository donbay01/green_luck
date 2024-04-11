import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../helper/codeCollection.dart';
import '../../helper/snackbar.dart';
import '../../services/code/index.dart';
import 'textfield.dart';

class AdminTextField extends StatefulWidget {
  final int index;

  const AdminTextField({
    super.key,
    required this.index,
  });

  @override
  State<AdminTextField> createState() => _AdminTextFieldState();
}

class _AdminTextFieldState extends State<AdminTextField> {
  var text = TextEditingController();

  send() async {
    if (text.text.isEmpty) {
      return;
    }

    var collection = getCodeCollection(widget.index);
    try {
      await CodeService.sendCode(collection, text.text);
      text.clear();
    } on FirebaseException catch (e) {
      SnackbarHelper.displayToastMessage(
        context: context,
        message: e.message!,
      );
    }
  }

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
      suffixIcon: IconButton(
        onPressed: send,
        icon: const Icon(
          Icons.send,
        ),
      ),
    );
  }
}
