import 'package:flutter/material.dart';

class CheckBoxClass extends StatefulWidget {
  final ValueChanged<bool?> onChanged;
  final bool initialValue;

  const CheckBoxClass({
    required this.onChanged,
    this.initialValue = false,
    super.key,
  });

  @override
  _CheckBoxClassState createState() => _CheckBoxClassState();
}

class _CheckBoxClassState extends State<CheckBoxClass> {
  late bool isTermsAccepted;

  @override
  void initState() {
    super.initState();
    isTermsAccepted = widget.initialValue;
  }

  void _toggleCheckBox() {
    setState(() {
      isTermsAccepted = !isTermsAccepted;
    });
    widget.onChanged(isTermsAccepted);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isTermsAccepted,
          activeColor: Colors.blue,
          
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          onChanged: (value) {
            setState(() {
              isTermsAccepted = value ?? false;
            });
            widget.onChanged(isTermsAccepted);
          },
        ),
        GestureDetector(
          onTap: _toggleCheckBox,
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'I understood the',
                  style: TextStyle(
                    color: Colors.black,
                    // : 'Poppins',
                  ),
                ),
                TextSpan(
                  text: ' terms & policy',
                  style: TextStyle(
                    color: Color.fromARGB(255, 63, 81, 243),
                    // : 'Poppins',
                  ),
                ),
                TextSpan(
                  text: '.',
                  style: TextStyle(
                    color: Colors.black,
                    // : 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
