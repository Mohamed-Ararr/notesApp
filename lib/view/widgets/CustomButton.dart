// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:noteapp/constValues.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.buttonTitle, this.onPressed})
      : super(key: key);

  final String buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: mainColor,
        textStyle: const TextStyle(
          fontSize: 18,
        ),
        minimumSize: Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(buttonTitle),
    );
  }
}
