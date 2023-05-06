// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomSearchButton extends StatelessWidget {
  const CustomSearchButton({Key? key, required this.icon}) : super(key: key);

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 40,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(70, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        child: icon,
      ),
    );
  }
}
