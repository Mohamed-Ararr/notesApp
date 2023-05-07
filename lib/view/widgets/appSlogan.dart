// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppSlogan extends StatelessWidget {
  const AppSlogan({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: const Text(
        "Write it down, remember it forever!",
        style: TextStyle(
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
