import 'package:flutter/material.dart';

class CustomSerachIcon extends StatelessWidget {
  const CustomSerachIcon(
      {super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
          child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
      )),
    );
  }
}
