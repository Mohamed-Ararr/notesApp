import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black.withAlpha(150),
      onPressed: () {},
      child: const Icon(
        Icons.add,
        size: 25,
        color: Colors.white,
      ),
    );
  }
}
