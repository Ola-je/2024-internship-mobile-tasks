import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget{
  final String hintText;
  final TextEditingController? input;
  final bool obscureText;

  PasswordField(this.hintText, this.input, {this.obscureText = true});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: input,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        contentPadding: EdgeInsets.all(8),
      ),
      maxLines: 1,
    );
  }}