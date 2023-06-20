import 'package:flutter/material.dart';

class QuickMessage extends StatelessWidget {
  String message;
  Function() onTap;
  Color backgroundColor;
  QuickMessage({
    required this.backgroundColor,
    required this.message,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
