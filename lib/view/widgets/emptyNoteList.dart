// ignore_for_file: file_names

import 'package:flutter/material.dart';

class EmptyNotes extends StatelessWidget {
  const EmptyNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'There is no note right now!',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
