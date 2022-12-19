import 'package:flutter/material.dart';
import 'package:noteapp/constValues.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.buttonTitle}) : super(key: key);

  String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: mainColor,
        minimumSize: Size(MediaQuery.of(context).size.width, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {},
      child: Text(buttonTitle),
    );
  }
}
