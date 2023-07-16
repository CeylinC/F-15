import 'package:f15_bootcamp_project/view/splash_screen.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SplashScreen(), //düzeltilecek
              ),
            );
          },
          child: SizedBox(
              height: 64,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                          "https://static.vecteezy.com/system/resources/thumbnails/002/534/006/small/social-media-chatting-online-blank-profile-picture-head-and-body-icon-people-standing-icon-grey-background-free-vector.jpg"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("İsimsiz evini favorilerine ekledi."),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "3 gün",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                            "https://cf.bstatic.com/xdata/images/hotel/max1024x768/154450697.jpg?k=3ec6d34bf2f7ce6c1f7d4a3267223dfe1e2179d1f038125b2d5fc6422695cc1d&o=&hp=1",
                            fit: BoxFit.cover),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
