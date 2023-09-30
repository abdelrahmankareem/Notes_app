import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Views/Widgets/custom_app_bar.dart';
import 'package:notes/Views/custom_text_field.dart';
import 'package:notes/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();
              Navigator.pop(context);
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            },
            title: "Edit Notes",
            icon: Icons.check,
          ),
          const SizedBox(height: 50),
          CustomTextField(
            onChanged: (value) {
              title = value;
            },
            hint: widget.note.title,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            hint: widget.note.content,
            maxline: 5,
          )
        ],
      ),
    );
  }
}
