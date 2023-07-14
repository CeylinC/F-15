import 'package:flutter/material.dart';

class SettingsMenuWidget extends StatelessWidget {
  const SettingsMenuWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final String? subtitle;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color(0xFF6b52f4).withOpacity(0.1),
        ),
        child: Icon(icon, color: Color(0xFF6b52f4)),
      ),
      title: Text(title, style: TextStyle(color: Colors.black)),
      subtitle: Text(subtitle!, style: TextStyle(color: Colors.grey)),
      trailing: endIcon
          ? Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey.withOpacity(0.1)),
          child: const Icon(Icons.arrow_forward_ios_outlined,
              size: 18.0, color: Colors.grey))
          : null,
    );
  }
}
