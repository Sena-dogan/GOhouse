import 'package:flutter/material.dart';
import 'package:gohouse/constants/colors.dart';

class DataBoxWidget extends StatelessWidget {
  DataBoxWidget({
    required this.title,
    required this.icon,
    super.key, required this.controller, this.minLine = 1, this.maxLine = 1, this.keyboardType = TextInputType.text,});

  final String title;
  final IconData icon;
  final TextEditingController controller;
  final int minLine;
  final int maxLine;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        cursorColor: MenuColors.midnightGreenEagleGreen,
        minLines: minLine,
        maxLines: maxLine,
        keyboardType: keyboardType,
        obscureText: false,
        decoration: InputDecoration(
          label: Text(title),
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
