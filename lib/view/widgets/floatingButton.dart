import 'package:flutter/material.dart';
import 'package:noteapp/view/widgets/customBottomSheet.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black.withAlpha(150),
      onPressed: () {
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            context: context,
            builder: (context) {
              return const CustomBottomSheet();
            });
      },
      child: const Icon(
        Icons.add,
        size: 25,
        color: Colors.white,
      ),
    );
  }
}
