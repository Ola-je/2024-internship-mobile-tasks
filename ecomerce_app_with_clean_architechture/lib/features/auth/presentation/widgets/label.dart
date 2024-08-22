import 'package:flutter/material.dart';

class Label extends StatelessWidget{
  String text;
  Label({super.key, required this.text});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(text,
        style: const TextStyle(
          // fontFamily: 'Poppins',
          fontSize: 16,
          color: Colors.grey),
          ),
      ],
    );
  }}