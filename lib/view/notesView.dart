// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:noteapp/view/widgets/customSearchButton.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [const CustomSearchButton()],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text('Flutter Note'),
                  subtitle: Text('Note details'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text('${DateTime.now()}'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
