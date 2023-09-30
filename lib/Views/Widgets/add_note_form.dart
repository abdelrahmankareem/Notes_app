import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Views/custom_button.dart';
import 'package:notes/Views/custom_text_field.dart';
import 'package:notes/cubit/add_note_cubit/add_note_cubit.dart';

import 'package:notes/models/note_model.dart';
import 'package:intl/intl.dart';

class FormAddNote extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  FormAddNote({
    super.key,
  });

  @override
  State<FormAddNote> createState() => _FormAddNoteState();
}

class _FormAddNoteState extends State<FormAddNote> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title;
  String? content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onsaved: (value) {
              title = value;
            },
            hint: "title",
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onsaved: (value) {
              content = value;
            },
            hint: "content",
            maxline: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isloading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currentDate = DateTime.now();
                    var currentDateFormatted =
                        DateFormat("yyyy-mm-dd").format(currentDate);

                    var addNote = NoteModel(
                        title: title!,
                        content: content!,
                        date: currentDateFormatted,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(addNote);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }
}
