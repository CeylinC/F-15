import 'package:flutter/material.dart';
import 'package:f15_bootcamp_project/view/settings_screen/components/switch_item.dart';

class Preferences extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PreferencesState();
}

class _PreferencesState extends State {
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
          title: const Text("Tercihler",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w800))),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(0.05),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "  Güvenlik",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Kurtarıcı E-Posta Adresi Gir:"),
                          prefixIcon: Icon(Icons.mail_outline)),
                    ),
                    const SizedBox(height: 60),
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "  Gizlilik",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        )),
                    SwitchItems(title: "Hesabını Gizli Hesaba Çevir"),
                    const SizedBox(height: 60),
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "  Konum",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        )),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Konum Bilgisini Güncelle:"),
                          prefixIcon: Icon(Icons.location_on_outlined)),
                    ),
                    const SizedBox(height: 60),
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "  Dil",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        )),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Dil Tercihini Değiştir:"),
                          prefixIcon: Icon(Icons.person)),
                    ),
                    const SizedBox(height: 60),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/Settings");
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF6F35A5),
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text("Değişiklikleri Kaydet",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
