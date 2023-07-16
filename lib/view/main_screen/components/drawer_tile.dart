import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerTile extends StatelessWidget {
  IconData icon;
  String text;
  DrawerTile({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FaIcon(
        icon,
        size: 20,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
