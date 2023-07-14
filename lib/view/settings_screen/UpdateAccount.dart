import 'package:flutter/material.dart';

class UpdateAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State {
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
          title: const Text("Hesap Ayarları",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w800))),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(0.05),
          child: Column(
            children: [
              Stack(
                children: [
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
                      child: const Icon(Icons.camera_alt_outlined,
                          color: Colors.white, size: 22),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Ad Soyad"),
                          prefixIcon: Icon(Icons.person)),
                    ),
                    const SizedBox(height: 60),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("E-Posta Adresi"),
                          prefixIcon: Icon(Icons.mail_outline)),
                    ),
                    const SizedBox(height: 60),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Telefon Numarası"),
                          prefixIcon: Icon(Icons.phone)),
                    ),
                    const SizedBox(height: 60),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: const Text("Yeni Parola"),
                        prefixIcon: const Icon(Icons.fingerprint),
                        suffixIcon: IconButton(
                            icon: const Icon(Icons.visibility),
                            onPressed: () {}),
                      ),
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
                    const SizedBox(height: 40),
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
