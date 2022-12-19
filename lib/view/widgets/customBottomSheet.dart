import 'package:flutter/material.dart';
import 'package:noteapp/view/widgets/CustomButton.dart';
import 'package:noteapp/view/widgets/customTextField.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      height: MediaQuery.of(context).size.height / 1,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 20),
            const CustomTextField(hint: 'Title'),
            const SizedBox(height: 15),
            const CustomTextField(
              hint: 'Content',
              maxL: 5,
            ),
            const SizedBox(height: 30),
            CustomButton(buttonTitle: 'Save'),
          ],
        ),
      ),
    );
  }
}
