// ignore_for_file: file_names

import 'package:flutter/material.dart';
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
    return Scaffold(
      floatingActionButton: const FloatingButton(),
      appBar: AppBar(
        title: const Text('NotePad'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        // actions: [
        //   CustomSearchButton(
        //     icon: const Icon(Icons.search),
        //   ),
        // ],
      ),
      body: const NotesListView(),
    );
  }
}
