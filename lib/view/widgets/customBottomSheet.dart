// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:noteapp/cubits/addNoteCubit/add_note_cubits.dart';
import 'package:noteapp/cubits/createNoteCubit/create_note_cubits.dart';

import 'addNoteForm.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: BlocConsumer<AddNotesCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            debugPrint('operation failed, ${state.errorMsg}');
          }

          if (state is AddNoteSuccess) {
            BlocProvider.of<CreateNotesCubit>(context).fetchAllNotes();
            debugPrint('operation success, ${state.toString()}');
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: ModalProgressHUD(
              opacity: 0.15,
              blur: 2,
              inAsyncCall: state is AddNoteLoading ? true : false,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 5,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const FormNote(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
