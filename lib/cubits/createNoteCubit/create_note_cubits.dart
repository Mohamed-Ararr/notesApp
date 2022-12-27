import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/constValues.dart';

import '../../model/noteModel.dart';

part 'create_note_state.dart';

class CreateNotesCubit extends Cubit<CreateNoteState> {
  CreateNotesCubit() : super(CreateNoteInitial());

  fetchAllNotes() async {
    try {
      var notesBox = Hive.box<NoteModel>(noteBox);
      emit(CreateNoteSuccess(notesBox.values.toList()));
    } catch (e) {
      emit(CreateNoteFailure(e.toString()));
    }
  }
}
