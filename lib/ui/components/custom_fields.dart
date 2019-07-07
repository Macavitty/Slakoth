import 'package:flutter/material.dart';
import 'package:flutter_arch/res/colors.dart';

class CustomInputField extends StatelessWidget {
  CustomInputField({@required this.hint, this.controller});

  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: TextField(
          controller: controller,
          decoration: new InputDecoration(
            hintText: hint,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
          style: new TextStyle(
            fontSize: 20.0,
            color: textDefaultColor,
          ),
      ),
    );
  }
}
