import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/constValues.dart';

import '../../model/noteModel.dart';

part 'create_note_state.dart';

class CreateNotesCubit extends Cubit<CreateNoteState> {
  CreateNotesCubit() : super(CreateNoteInitial());

  List<NoteModel>? noteList = [];

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(noteBox);
    noteList = notesBox.values.toList();
    emit(CreateNoteSuccess());
  }
}
