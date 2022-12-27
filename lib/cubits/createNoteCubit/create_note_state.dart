part of 'create_note_cubits.dart';

abstract class CreateNoteState {}

class CreateNoteInitial extends CreateNoteState {}

class CreateNoteLoading extends CreateNoteState {}

class CreateNoteSuccess extends CreateNoteState {
  final List<NoteModel> noteList;

  CreateNoteSuccess(this.noteList);
}

class CreateNoteFailure extends CreateNoteState {
  final String errorMsg;

  CreateNoteFailure(this.errorMsg);
}
