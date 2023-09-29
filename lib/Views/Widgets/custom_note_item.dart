import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/Views/edit_notes_view.dart';
import 'package:notes/models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const EditNotesView();
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          bottom: 24,
          top: 24,
        ),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          ListTile(
            title: Text(
              note.title,
              style: const TextStyle(color: Colors.black, fontSize: 26),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(note.content,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.5), fontSize: 18)),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 25,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
              top: 24,
            ),
            child: Text(note.date,
                style: TextStyle(color: Colors.black.withOpacity(.4))),
          )
        ]),
      ),
    );
  }
}
