import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final String hintText;
  final TextEditingController? inputController;
  final Function(String)? onChanged;

  TextFields({required this.hintText, this.inputController, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Color.fromRGBO(248, 247, 247, 1),
      child: TextFormField(
        controller: inputController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color.fromRGBO(209, 208, 208, 1),  // Set the color you want here
            fontSize: 16,        // You can also adjust the font size
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none
          ),
          contentPadding: EdgeInsets.all(8),
        ),
        maxLines: 1,
        onChanged: onChanged, 
      ),
    );
  }
}
