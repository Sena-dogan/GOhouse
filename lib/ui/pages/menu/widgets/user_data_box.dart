import 'package:flutter/material.dart';
import 'package:gohouse/constants/colors.dart';

class UserDataBoxWidget extends StatelessWidget {
  const UserDataBoxWidget({
    required this.title,
    required this.icon,
    super.key});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        cursorColor: MenuColors.midnightGreenEagleGreen,
        decoration: InputDecoration(
          label: Text(title),
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
