import 'package:flutter/material.dart';
import 'package:f15_bootcamp_project/view/settings_screen/components/switch_item.dart';

class NotificationPref extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationPrefState();
}

class _NotificationPrefState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/Settings");
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined,
                  color: Colors.black),
            ),
            title: const Text("Bildirim Ayarları",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800))),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(0.05),
            child: Column(
              children: [
                SwitchItems(title: "Mesajlar"),
                SwitchItems(
                  title: "Belirlenen Kritlerlere Uygun İlanlar",
                ),
                SwitchItems(
                  title: "Favori İlanlara Dair Güncellemeler",
                ),
                SwitchItems(
                  title: "Yorumlar",
                ),
              ],
            ),
          ),
        ));
  }
}
