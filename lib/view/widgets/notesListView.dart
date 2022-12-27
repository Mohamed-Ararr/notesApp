import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/createNoteCubit/create_note_cubits.dart';
import 'package:noteapp/model/noteModel.dart';
import 'package:noteapp/view/widgets/emptyNoteList.dart';
import 'package:noteapp/view/widgets/noteCard.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNotesCubit, CreateNoteState>(
        builder: (context, state) {
      List<NoteModel> notes =
          BlocProvider.of<CreateNotesCubit>(context).noteList ?? [];
      return notes.isEmpty
          ? const EmptyNotes()
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return const NoteCard();
              },
            );
    });
  }
}
