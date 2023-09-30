import 'package:flutter/material.dart';
import 'package:notes/Views/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxline = 1,
    this.onsaved,
    this.onChanged,
  });
  final String hint;
  final int maxline;
  final void Function(String?)? onsaved;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "the Field is required";
        } else {
          return null;
        }
      },
      maxLines: maxline,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: kPrimaryColor),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
