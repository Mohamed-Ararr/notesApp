// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/cubits/createNoteCubit/create_note_cubits.dart';
import 'package:noteapp/model/noteModel.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../EditNote.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => EditNoteView(note: note))),
      child: Container(
        padding: const EdgeInsets.only(top: 15, right: 15, bottom: 15),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffffcc80),
          // color: Color(note.color),
          // color: Color.fromARGB(255, 219, 171, 126),
        ),
        child: Column(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(note.title,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              subtitle: Text(
                note.content,
                style: const TextStyle(
                  color: Color.fromARGB(192, 0, 0, 0),
                  fontSize: 15,
                ),
              ),
              trailing: InkWell(
                onTap: () {
                  showTopSnackBar(
                    Overlay.of(context),
                    const CustomSnackBar.error(
                      message: 'Note Deleted!',
                    ),
                  );
                  note.delete();
                  BlocProvider.of<CreateNotesCubit>(context).fetchAllNotes();
                },
                child: const Icon(
                  Icons.delete_outline,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                DateFormat.yMMMd().format(DateTime.parse(note.date)).toString(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
