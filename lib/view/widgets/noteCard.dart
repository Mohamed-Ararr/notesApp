import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black38,
      ),
      child: Column(
        children: [
          ListTile(
            title: const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text('Flutter Note',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            subtitle: const Text(
              'Note details, flutter is a framework used to build mobile application for both android and ios',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete_outline),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(DateFormat.yMMMd().format(DateTime.now()).toString()),
          ),
        ],
      ),
    );
  }
}
