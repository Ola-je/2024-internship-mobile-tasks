import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double logoHeight; 
  final double logoWidth; 

  Logo({super.key, this.logoHeight = 0.06, this.logoWidth = 0.3}); 

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * logoHeight,
      width: screenWidth * logoWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 63, 81, 243)),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            offset: Offset(0, 0),
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'ECOM',
          style: TextStyle(
            // fontFamily: 'CaveatBrush',
            fontWeight: FontWeight.w400,
            fontSize: 35,
            color: Color.fromARGB(255, 63, 81,243)
          ),
        ),
      ),
    );
  }
}
