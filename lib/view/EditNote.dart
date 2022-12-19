// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:noteapp/view/widgets/CustomButton.dart';
import 'package:noteapp/view/widgets/customSearchButton.dart';
import 'package:noteapp/view/widgets/customTextField.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key}) : super(key: key);

  static String id = "EditNoteView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          CustomSearchButton(
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(children: [
            const CustomTextField(hint: 'Edited title'),
            const SizedBox(height: 15),
            const CustomTextField(hint: 'Edited content', maxL: 5),
            const SizedBox(height: 30),
            CustomButton(buttonTitle: 'Save Edits'),
          ]),
        ),
      ),
    );
  }
}
