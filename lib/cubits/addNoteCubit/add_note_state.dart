part of 'add_note_cubits.dart';

abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  final String errorMsg;

  AddNoteFailure(this.errorMsg);
}
