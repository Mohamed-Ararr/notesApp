import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key, required this.hint, this.maxL = 1, this.onSaved})
      : super(key: key);

  final String hint;
  final int maxL;

  void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field required!';
        } else {
          return null;
        }
      },
      maxLines: maxL,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xffffcc80),
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: hint,
      ),
    );
  }
}
