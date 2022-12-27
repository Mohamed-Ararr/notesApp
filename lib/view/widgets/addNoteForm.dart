// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/addNoteCubit/add_note_cubits.dart';
import 'package:noteapp/model/noteModel.dart';

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
          const SizedBox(height: 15),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomTextField(
              hint: 'Title',
              onSaved: (value) {
                title = value;
              },
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomTextField(
              hint: 'Content',
              maxL: 5,
              onSaved: (value) {
                content = value;
              },
            ),
          ),
          const SizedBox(height: 15),
          CustomButton(
            buttonTitle: 'Save',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                var noteModel = NoteModel(
                  title: title!,
                  content: content!,
                  date: DateTime.now().toIso8601String(),
                  color: Colors.blue.value,
                );

                BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
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
