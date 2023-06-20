import 'package:flutter/material.dart';

import '../conversation_screen.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ConversationPage(),
            ),
          );
        },
        child: Container(
            height: 85,
            child: Center(
              child: Row(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  'https://listelist.com/wp-content/uploads/2013/11/ogrenci-evi-biraz-daginik.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              color: Colors.transparent,
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 15.0,
                            backgroundImage: NetworkImage(
                                'https://www.okuryazar.com.tr/image/muzisyen/cem-kismet-524.jpg'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Emrecan Er',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '20.03',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Merkezi Konumda Öğrenci Evi',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Selam 2 kişi evinde kalmak istiyoruz ancak fiyatta birazcık indirim yapar mısın',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                            overflow: TextOverflow
                                .ellipsis, // Taşan yerden sonra "..." eklemek için
                            // Taşan kısmın fade olması için
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.more_vert,
                        size: 22,
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
