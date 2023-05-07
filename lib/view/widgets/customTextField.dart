// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    this.maxL = 1,
    this.onSaved,
    this.onChanged,
    this.maxLength,
    this.isAddNote = true,
  }) : super(key: key);

  final String hint;
  final int maxL;

  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final int? maxLength;
  final bool isAddNote;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      textCapitalization: TextCapitalization.sentences,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (isAddNote) {
          if (value == null || value.isEmpty) {
            return 'Field required!';
          } else {
            return null;
          }
        }
        return null;
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
