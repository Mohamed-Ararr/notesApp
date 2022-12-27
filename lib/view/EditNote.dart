// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/createNoteCubit/create_note_cubits.dart';
import 'package:noteapp/view/widgets/CustomButton.dart';
import 'package:noteapp/view/widgets/customSearchButton.dart';
import 'package:noteapp/view/widgets/customTextField.dart';

import '../cubits/addNoteCubit/add_note_cubits.dart';
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
      body: SingleChildScrollView(
        // child: FormNote(),
        child: Form(
          key: formKey,
          child: Column(children: [
            const SizedBox(height: 15),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomTextField(
                hint: widget.note.title,
                onChanged: (value) {
                  newTitle = value;
                },
              ),
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomTextField(
                hint: widget.note.content,
                maxL: 5,
                onChanged: (value) {
                  newContent = value;
                },
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              buttonTitle: 'Save',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  widget.note.title = newTitle ?? widget.note.title;
                  widget.note.content = newContent ?? widget.note.content;
                  widget.note.save();
                  BlocProvider.of<CreateNotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                } else {}
              },
            ),
          ]),
        ),
      ),
    );
  }
}
