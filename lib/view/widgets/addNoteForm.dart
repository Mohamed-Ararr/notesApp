// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/addNoteCubit/add_note_cubits.dart';
import 'package:noteapp/model/noteModel.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
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
              buttonTitle: 'Add',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  var noteModel = NoteModel(
                    title: title!,
                    content: content!,
                    date: DateTime.now().toIso8601String(),
                    color: Colors.blue.value,
                  );

                  showTopSnackBar(
                    Overlay.of(context),
                    const CustomSnackBar.success(
                      message: 'Note added successfully!',
                    ),
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
      ),
    );
  }
}
