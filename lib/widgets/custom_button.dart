import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnText;
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.btnText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blueAccent,
          blurRadius: 4,
          spreadRadius: 0,
        )
      ]),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width, 55),
        ),
        child: Text(
          btnText,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
