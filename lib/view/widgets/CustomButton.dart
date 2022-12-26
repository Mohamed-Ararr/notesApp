import 'package:flutter/material.dart';
import 'package:noteapp/constValues.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.buttonTitle, this.onPressed})
      : super(key: key);

  final String buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: mainColor,
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
      ),
    );
  }
}
