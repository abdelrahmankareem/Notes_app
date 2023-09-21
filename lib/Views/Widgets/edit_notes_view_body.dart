import 'package:flutter/material.dart';
import 'package:notes/Views/Widgets/custom_app_bar.dart';

class EditNotesViewBody extends StatelessWidget {
  const EditNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(
            title: "Edit Notes",
            icon: Icons.check,
          ),
        ],
      ),
    );
  }
}
