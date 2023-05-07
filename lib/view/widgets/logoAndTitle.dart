// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LogoAndTitle extends StatelessWidget {
  const LogoAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/notepad.png",
          scale: 7,
        ),
        const SizedBox(width: 10),
        const Text(
          "NotePad",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}
