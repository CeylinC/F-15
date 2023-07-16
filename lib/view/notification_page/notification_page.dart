import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'notification_card.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Bildirimler',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                "Daha Eski",
                style: TextStyle(color: kPurpleColor, fontSize: 24),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const NotificationCard(),
                    Divider(
                      thickness: 0.2,
                      color: kPurpleColor.withOpacity(0.5),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 5),
              child: Text(
                "Dün",
                style: TextStyle(color: kPurpleColor, fontSize: 24),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const NotificationCard(),
                    Divider(
                      thickness: 0.2,
                      color: kPurpleColor.withOpacity(0.5),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 5),
              child: Text(
                "Daha Eski",
                style: TextStyle(color: kPurpleColor, fontSize: 24),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const NotificationCard(),
                    Divider(
                      thickness: 0.2,
                      color: kPurpleColor.withOpacity(0.5),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      )),
    );
    ;
  }
}
