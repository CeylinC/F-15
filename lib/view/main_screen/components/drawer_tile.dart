import 'package:f15_bootcamp_project/view/settings_screen/settings.dart';
import 'package:f15_bootcamp_project/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerTile extends StatelessWidget {
  IconData icon;
  String text;
  Widget page;
  DrawerTile({required this.icon, required this.text, required this.page});

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
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) => page));
      },
    );
  }
}
