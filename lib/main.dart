import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/Views/constants.dart';
import 'package:notes/Views/notes_view.dart';
import 'package:notes/models/note_model.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: "Poppins"),
      home: const NotesView(),
    );
  }
}
