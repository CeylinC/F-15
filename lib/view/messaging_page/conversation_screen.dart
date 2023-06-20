import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:flutter/material.dart';

import 'components/quick_message_card.dart';

class ConversationPage extends StatelessWidget {
  List allMessages = [];
  TextEditingController _controller = TextEditingController(text: '1000');
  Widget widget = Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Row(
          children: [
            SizedBox(
              width: 55,
              height: 55,
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
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: CircleAvatar(
                        radius: 12.0,
                        backgroundImage: NetworkImage(
                            'https://www.okuryazar.com.tr/image/muzisyen/cem-kismet-524.jpg'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Emrecan Er',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Merkezi Konumda Öğrenci Evi',
                          style: TextStyle(fontSize: 12, color: Colors.black87),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Ücret : 1000 ₺',
                          style: TextStyle(fontSize: 12, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Süre : 2 Gün',
                          style: TextStyle(fontSize: 12, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 150,
                  height: 500,
                  alignment: Alignment.centerRight,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(color: Colors.grey),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Container(
                          width: 60,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: kDarkColor.withOpacity(0.9),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Teklif',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white54),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '750 ₺',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Wrap(
            runSpacing: 7,
            spacing: 7,
            children: [
              QuickMessage(
                backgroundColor: Colors.transparent,
                onTap: () {},
                message: 'Merhaba',
              ),
              QuickMessage(
                backgroundColor: Colors.transparent,
                onTap: () {},
                message: 'Ev tutuldu mu ?',
              ),
              QuickMessage(
                backgroundColor: Colors.transparent,
                onTap: () {},
                message: 'Teşekkürler',
              ),
              QuickMessage(
                backgroundColor: Colors.transparent,
                onTap: () {},
                message: 'Anlaştık',
              ),
              QuickMessage(
                backgroundColor: Colors.transparent,
                onTap: () {},
                message: 'İlgilenmiyorum',
              ),
              QuickMessage(
                backgroundColor: kPurpleColor,
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Container(
                              color: kBackgroundColor,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'TEKLİF VER',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      onChanged: (value) {
                                        getContainer(double.parse(value));
                                      },
                                      controller: _controller,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        suffixText: '₺',
                                        labelStyle: TextStyle(
                                            fontSize: 20, color: kDarkColor),
                                        hintText: 'Teklifinizi Giriniz',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  widget,
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: kPurpleColor,
                                          width: 0.4,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white,
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Image.asset(
                                              'assets/trade.png',
                                              width: 100,
                                              height: 100,
                                            ),
                                          ),
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                'Teklifinize dönüş olması için dikkatli\nteklif verin!',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                message: 'Teklif Ver',
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: kPurpleColor, width: 0.4),
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Mesajınızı girin',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
                  ),
                ),
                const SizedBox(width: 8.0),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send_rounded,
                      size: 19,
                      color: kPurpleColor,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getContainer(double satisFiyat) {
    double lowerBound = 1000 / 1.7;
    double upperBound1 = 1000 / 1.3;
    double upperBound2 = 1000 / 1;

    if (satisFiyat < lowerBound) {
      widget = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.thumb_down,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Kötü Teklif!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Kullanıcının yanıt verme olasılığı düşük.',
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDarkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  allMessages.add(
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: kDarkColor,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Teklif',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const Text(
                            '750 ₺',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Text('Gönder'),
              ),
            ),
          ],
        ),
      );
    } else if (satisFiyat >= lowerBound && satisFiyat < upperBound1) {
      widget = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Ortalama Teklif!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Kullanıcının yanıt verme olasılığı var.',
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDarkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  allMessages.add(
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: kDarkColor,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Teklif',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const Text(
                            '750 ₺',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Text('Gönder'),
              ),
            ),
          ],
        ),
      );
    } else if (satisFiyat >= upperBound1 && satisFiyat <= upperBound2) {
      widget = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.thumb_up,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'İyi Teklif!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Kullanıcının yanıt verme olasılığı yüksek.',
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDarkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  allMessages.add(
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: kDarkColor,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Teklif',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const Text(
                            '750 ₺',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Text('Gönder'),
              ),
            ),
          ],
        ),
      );
    }
  }
}
