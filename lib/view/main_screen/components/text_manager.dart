import 'package:flutter/material.dart';

class TextManager extends StatelessWidget {
  String text;
  TextManager({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins',
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
