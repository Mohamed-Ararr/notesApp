import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/constValues.dart';

import '../../model/noteModel.dart';

part 'add_note_state.dart';

class AddNotesCubit extends Cubit<AddNoteState> {
  AddNotesCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box(noteBox);
      emit(AddNoteSuccess());
      await notesBox.add(note);
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
