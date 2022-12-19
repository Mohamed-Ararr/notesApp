// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:noteapp/view/widgets/customSearchButton.dart';
import 'package:noteapp/view/widgets/floatingButton.dart';
import 'package:noteapp/view/widgets/noteCard.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingButton(),
      appBar: AppBar(
        title: const Text('Notes'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          CustomSearchButton(),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const NoteCard();
        },
      ),
    );
  }
}
