import 'package:flutter/material.dart';

class CommonStyles {
  static textFormFieldStyle(String label, String hint) {
    return InputDecoration(
      errorStyle: TextStyle(fontSize: 17),
      labelText: label,
      hintText: hint,
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 5),
      labelStyle: const TextStyle(color: Colors.black, fontSize: 21),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2),
      ),
    );
  }
}
