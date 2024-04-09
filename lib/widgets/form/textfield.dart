import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:string_validator/string_validator.dart';
import '../../theme/colors.dart';
import '../../theme/text_style.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final double radius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final bool isEmail;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType = TextInputType.emailAddress,
    this.radius = 10,
    this.prefixIcon,
    this.suffixIcon,
    this.labelStyle,
    this.isEmail = false,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    _obscureText = widget.isPassword;
    widget.controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(() => setState(() {}));
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field must not be empty';
        }

        if (widget.isEmail && !isEmail(value)) {
          return 'Not a valid email';
        }
      },
      keyboardType: widget.keyboardType,
      style: smallText(primaryBlack),
      controller: widget.controller,
      autofillHints: const [
        AutofillHints.email,
        AutofillHints.name,
      ],
      onEditingComplete: () => [
        // TextInput.finishAutofillContext(),
        FocusScope.of(context).unfocus(),
      ],
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: primaryBlack),
        hintText: widget.hint,
        hintStyle: smallText(primaryBlack),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  _toggle();
                },
                icon: _obscureText
                    ? const Icon(
                        FontAwesomeIcons.eyeSlash,
                        color: Colors.black,
                        size: 15,
                      )
                    : const Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                        size: 20,
                      ),
              )
            : widget.controller.text.isEmpty
                ? const SizedBox.shrink()
                : IconButton(
                    icon: const Icon(Icons.close,color: darkGreen,),
                    onPressed: () {
                      widget.controller.clear();
                    },
                  ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: darkGreen,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
