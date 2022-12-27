// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/model/noteModel.dart';

import '../EditNote.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, EditNoteView.id),
      child: Container(
        padding: const EdgeInsets.only(top: 15, right: 15, bottom: 15),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: const Color(0xffffcc80),
          color: Color(widget.note.color),
          // color: Color.fromARGB(255, 219, 171, 126),
        ),
        child: Column(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(widget.note.title,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
              ),
              subtitle: Text(
                widget.note.content,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              trailing: InkWell(
                onTap: () {
                  widget.note.delete();
                  setState(() {});
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
                DateFormat.yMMMd().format(DateTime.now()).toString(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
