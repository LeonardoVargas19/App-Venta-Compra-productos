import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration autInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.purple.shade300),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.purple.shade400, width: 2)),
        hintText: hintText,
        labelText: labelText,
        labelStyle:const TextStyle(color: Colors.grey),
        // ignore: unrelated_type_equality_checks
        prefixIcon:prefixIcon != Null ? Icon(prefixIcon,color: Colors.purple.shade100,):null);
  }
}
