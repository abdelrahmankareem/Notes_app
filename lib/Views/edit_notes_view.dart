import 'package:flutter/material.dart';
import 'package:notes/Views/Widgets/custom_app_bar.dart';
import 'package:notes/Views/Widgets/edit_notes_view_body.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNotesViewBody(),
    );
  }
}
