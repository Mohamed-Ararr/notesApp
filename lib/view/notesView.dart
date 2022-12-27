// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/createNoteCubit/create_note_cubits.dart';
import 'package:noteapp/view/widgets/customSearchButton.dart';
import 'package:noteapp/view/widgets/floatingButton.dart';
import 'package:noteapp/view/widgets/notesListView.dart';

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNotesCubit(),
      child: Scaffold(
        floatingActionButton: const FloatingButton(),
        appBar: AppBar(
          title: const Text('Notes'),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            CustomSearchButton(
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: const NotesListView(),
      ),
    );
  }
}
