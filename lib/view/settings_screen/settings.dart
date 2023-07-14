import 'package:flutter/material.dart';
import 'package:f15_bootcamp_project/view/settings_screen/components/setting_menu.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.black),
        ),
        title: const Text("Ayarlar",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w800)),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.dark_mode_outlined, color: Colors.black),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(0.05),
          child: Column(
            children: [
              Stack(children: [
                SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage("assets/images/foto.png")),
                    )),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF6F35A5)),
                    child:
                    const Icon(Icons.edit, color: Colors.white, size: 22),
                  ),
                )
              ]),
              const SizedBox(height: 10),
              const Text('John Doe'),
              const Text('@johndoe'),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/UpdateAccount");
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6F35A5),
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text("Hesap Ayarları",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              SettingsMenuWidget(
                  title: "Tercihler",
                  subtitle: "Güvenlik, Gizlilik, Dil",
                  icon: Icons.security,
                  onPress: () {
                    Navigator.pushNamed(context, "/Preferences");
                  }),
              SettingsMenuWidget(
                  title: "Bildirim Ayarları",
                  subtitle:
                  "Mesajlar, Belirlenen Kritlerlere Uygun İlanlar, Favori İlanlara Dair Güncellemeler, Yorumlar",
                  icon: Icons.notifications_none,
                  onPress: () {
                    Navigator.pushNamed(context, "/NotificationPref");
                  }),
              SettingsMenuWidget(
                  title: "Hesabı Sil",
                  subtitle: " ",
                  endIcon: false,
                  icon: Icons.delete,
                  onPress: () {}),
              const Divider(),
              SettingsMenuWidget(
                  title: "Sorun Bildir",
                  subtitle: " ",
                  endIcon: false,
                  icon: Icons.bug_report,
                  onPress: () {}),
              SettingsMenuWidget(
                  title: "Geri Bildirim Gönder",
                  subtitle: " ",
                  endIcon: false,
                  icon: Icons.thumb_up_alt,
                  onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
