import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:notes/Views/constants.dart';
import 'package:notes/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotes() async {
    try {
      var notesbox = await Hive.openBox<NoteModel>(kNotesBox);

      List<NoteModel> notes = notesbox.values.toList();
      emit(NotesSuccess(notes));
    } on Exception catch (e) {
      emit(NotesFailure(errmessage: e.toString()));
    }
  }
}
