import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../EditNote.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, EditNoteView.id),
      child: Container(
        padding: const EdgeInsets.only(top: 15, right: 15, bottom: 15),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffffcc80),
          // color: Color.fromARGB(255, 219, 171, 126),
        ),
        child: Column(
          children: [
            ListTile(
              title: const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('Flutter Note',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
              ),
              subtitle: const Text(
                'Note details, flutter is a framework',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              trailing: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.delete_outline,
                  color: Colors.black,
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
