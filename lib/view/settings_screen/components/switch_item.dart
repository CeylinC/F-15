import 'package:flutter/material.dart';

class SwitchItems extends StatefulWidget {
  const SwitchItems({
    Key? key,
    required this.title,
    this.isSelected = false,
  }) : super(key: key);

  final String title;
  final bool isSelected;

  @override
  _SwitchItemsState createState() => _SwitchItemsState();
}

class _SwitchItemsState extends State<SwitchItems> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      trailing: Switch(
        onChanged: (value) {
          setState(() {
            isSelected = value;
          });
        },
        value: isSelected,
        activeColor: const Color(0xFF6F35A5),
      ),
    );
  }
}
