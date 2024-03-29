// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/createNoteCubit/create_note_cubits.dart';
import 'package:noteapp/view/widgets/CustomButton.dart';
import 'package:noteapp/view/widgets/customSearchButton.dart';
import 'package:noteapp/view/widgets/customTextField.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../model/noteModel.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  static String id = "EditNoteView";

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? newTitle, newContent;
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: const [
          CustomSearchButton(
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // child: FormNote(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            autovalidateMode: autovalidateMode,
            key: formKey,
            child: Column(children: [
              const SizedBox(height: 15),
              CustomTextField(
                isAddNote: false,
                maxLength: 20,
                hint: widget.note.title,
                onChanged: (value) {
                  newTitle = value;
                },
              ),
              const SizedBox(height: 15),
              CustomTextField(
                isAddNote: false,
                hint: widget.note.content,
                maxL: 5,
                onChanged: (value) {
                  newContent = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                buttonTitle: 'Save',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (newTitle != null || newContent != null) {
                      showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.info(
                          message: 'Note Edited!',
                        ),
                      );
                    }
                    widget.note.title = newTitle ?? widget.note.title;
                    widget.note.content = newContent ?? widget.note.content;
                    widget.note.date = DateTime.now().toIso8601String();
                    widget.note.save();
                    BlocProvider.of<CreateNotesCubit>(context).fetchAllNotes();
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
