import 'package:flutter/material.dart';
import 'package:tic_tac_toe/services/service.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextfield({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
          color: Colors.blueAccent,
          style: BorderStyle.solid,
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
