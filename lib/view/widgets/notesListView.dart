import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/createNoteCubit/create_note_cubits.dart';
import 'package:noteapp/model/noteModel.dart';
import 'package:noteapp/view/widgets/addNoteForm.dart';
import 'package:noteapp/view/widgets/emptyNoteList.dart';
import 'package:noteapp/view/widgets/noteCard.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CreateNotesCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNotesCubit, CreateNoteState>(
        builder: (context, state) {
      List<NoteModel> notesList =
          BlocProvider.of<CreateNotesCubit>(context).noteList ?? [];
      debugPrint(notesList.length.toString());
      return notesList.isEmpty
          ? const EmptyNotes()
          : ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                return NoteCard(
                  note: notesList[index],
                );
              },
            );
    });
  }
}
