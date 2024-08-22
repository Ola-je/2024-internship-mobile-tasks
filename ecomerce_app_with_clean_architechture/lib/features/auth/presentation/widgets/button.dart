import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  String text;
  final VoidCallback? ontap;

  Button(this.text, this.ontap);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: ontap,
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 63, 81, 243),
          foregroundColor: Colors.white,
          minimumSize: const Size.square(57),
          side: const BorderSide(color: Color.fromARGB(255, 63, 81, 243)),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(text),
      ),
   );
  }
  
}
