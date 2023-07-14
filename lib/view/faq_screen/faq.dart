import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  final List<Map<String, dynamic>> _items = [
    {
      "id": 0,
      "title": "Uygulamayı nasıl kullanabilirim?",
      "content":
      "Uygulamayı kullanmak için öncelikle indirmeniz ve bir hesap oluşturmanız gerekmektedir. Ardından, arama özelliğini kullanarak kiralık evleri veya odaları bulabilir veya kendi evinizi veya odanızı ilan verebilirsiniz."
    },
    {
      "id": 1,
      "title": "Kiralık evler veya odalar için nasıl bir arama yapabilirim?",
      "content":
      "Uygulamada bulunan arama özelliğini kullanarak bölge, fiyat aralığı, oda sayısı gibi kriterleri belirterek arama yapabilirsiniz. Ayrıca, filtreleme seçeneklerini kullanarak tercihlerinize uygun olan seçenekleri daraltabilirsiniz."
    },
    {
      "id": 2,
      "title": "Kiralık ev veya oda ilanı nasıl verebilirim?",
      "content":
      "Uygulamada ilan verebilmek için hesabınızla giriş yapmalısınız. Ardından, kiralık ev veya oda ilanı oluşturabileceğiniz bir bölüm bulunacaktır. Burada, evin veya odanın konumu, fiyatı, eşyalı olup olmadığı gibi bilgileri girmeniz gerekmektedir."
    },
    {
      "id": 3,
      "title":
      "Kiralık ev veya oda ilanı vermek için ücret ödemem gerekiyor mu?",
      "content":
      "Uygulamamızda ilan vermek ücretsizdir. Ancak, özel özellikler veya vurgulamalar gibi ek hizmetler sunabiliriz, bu durumda ilgili ücretler talep edilebilir."
    },
    {
      "id": 4,
      "title":
      "Ev veya oda kiralama sürecinde hangi güvenlik önlemleri alınmaktadır?",
      "content":
      "Uygulama olarak, kullanıcıların güvenliğine ve gizliliğine önem veriyoruz. Kullanıcılarımızın kimlik doğrulamasını yapmak için gereken adımları atarız ve kullanıcı yorumları ve derecelendirmeleri gibi bilgileri sağlarız. Ayrıca, kullanıcılarımız arasındaki iletişimi ve ödemeleri güvence altına alan bir sistemimiz vardır."
    },
    {
      "id": 5,
      "title":
      "Kiracı veya ev sahibi olarak nasıl güvenilir bir kullanıcıyı seçebilirim?",
      "content":
      "Uygulamamızda, kullanıcıların profillerine, derecelendirmelerine ve yorumlarına erişebilirsiniz. Bu bilgiler, kullanıcıların geçmiş deneyimlerini gözlemlemenize ve güvenilir bir seçim yapmanıza yardımcı olacaktır. Ayrıca, doğrudan mesajlaşma özelliğini kullanarak kullanıcılarla iletişime geçebilir ve daha fazla bilgi alabilirsiniz."
    },
    {
      "id": 6,
      "title": "Kiralık ev veya oda için anlaşma yapmam gerekiyor mu?",
      "content":
      "Kiralık ev veya oda için yapılacak anlaşmalar, kullanıcılar arasında yapılacak bir anlaşma sürecine bağlıdır. Genellikle, ev sahibi ve kiracı arasında sözleşme yapılması önerilir. Bu sözleşme, kira koşullarını, süresini ve diğer önemli ayrıntıları içerecektir. Uygulama olarak, kullanıcılara hukuki danışmanlık sağlamamaktayız, bu nedenle kullanıcıların yerel yasa ve düzenlemelere uymalarını öneririz."
    },
    {
      "id": 7,
      "title": "Uygulama destek ekibiyle nasıl iletişime geçebilirim?",
      "content":
      "Uygulama içindeki iletişim veya yardım bölümünden bizimle iletişime geçebilirsiniz. Destek ekibimiz size sorularınızı cevaplama ve yardımcı olma konusunda yardımcı olacaktır."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined,
                  color: Colors.black),
            ),
            title: const Text("Sıkça Sorulan Sorular",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800))),
        body: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (_, index) {
              final item = _items[index];
              return Card(
                key: PageStorageKey(item['id']),
                color: Color(0xFF6F35A5),
                elevation: 4,
                child: ExpansionTile(
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    childrenPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    expandedCrossAxisAlignment: CrossAxisAlignment.end,
                    title: Text(
                      item['title'],
                      style: const TextStyle(color: Colors.white),
                    ),
                    children: [
                      Text(item['content'],
                          style: const TextStyle(color: Colors.white)),
                    ]),
              );
            }));
  }
}
