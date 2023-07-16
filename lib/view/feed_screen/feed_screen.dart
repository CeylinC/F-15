import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f15_bootcamp_project/controller/feed_controller.dart';
import 'package:f15_bootcamp_project/view/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../core/components/atomic_widgets/card.dart';

class FeedScreen extends StatelessWidget {
  FeedController feedController = Get.put(FeedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: StreamBuilder(
        stream: feedController.getAds(),
        builder: ((context, snapshot) {
          return !snapshot.hasData
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : snapshot.data?.size == 0
                  ? SizedBox(
                      width: Get.width,
                      height: 150,
                      child: Center(
                        child: Text('Henüz bir etkinliğe katılmadınız! '),
                      ),
                    )
                  : SizedBox(
                      width: Get.width,
                      child: SizedBox(
                        width: Get.width,
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.size,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 0.7),
                          itemBuilder: (context, index) {
                            DocumentSnapshot documentSnapshot =
                                snapshot.data!.docs[index];
                            return IlanCard(
                              creatorProfilePhoto:
                                  documentSnapshot['creatorProfilePhoto'],
                              ilanBaslik: documentSnapshot['ilanBaslik'],
                              creatorUid: documentSnapshot['uid'],
                              location: documentSnapshot['ilanSemti'] +
                                  ' /${feedController.currentUserCity.value}',
                              photoUrl: documentSnapshot['photoUrl'],
                              star: '4.4',
                            );
                          },
                        ),
                      ),
                    );
        }),
      ),
    );
  }
}
