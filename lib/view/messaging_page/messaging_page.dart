import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:flutter/material.dart';

import 'components/message_card.dart';

class MessagingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            labelColor: kPurpleColor,
            dividerColor: kPurpleColor,
            indicatorColor: kPurpleColor,
            tabs: [
              Tab(
                text: 'Tümü',
              ),
              Tab(
                text: 'İlanlarım',
              ),
              Tab(
                text: 'Tekliflerim',
              ),
            ],
          ),
          title: const Text(
            'Gelen Kutusu',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          centerTitle: true,
        ),
        backgroundColor: kBackgroundColor,
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 89,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const MessageCard(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Divider(
                                thickness: 0.2,
                                color: kPurpleColor.withOpacity(0.5),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.directions_transit),
            const Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
