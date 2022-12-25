// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'CustomButton.dart';
import 'customTextField.dart';

class FormNote extends StatefulWidget {
  const FormNote({Key? key}) : super(key: key);

  @override
  State<FormNote> createState() => _FormNoteState();
}

class _FormNoteState extends State<FormNote> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? title, content;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
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
          const SizedBox(height: 15),
          CustomTextField(
            hint: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 15),
          CustomTextField(
            hint: 'Content',
            maxL: 5,
            onSaved: (value) {
              content = value;
            },
          ),
          const SizedBox(height: 15),
          CustomButton(
            buttonTitle: 'Save',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
