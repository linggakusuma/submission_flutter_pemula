import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_flutter_pemula/detail_screen.dart';
import 'package:submission_flutter_pemula/model/cupang.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController editingController = TextEditingController();

  var items = List<Cupang>();

  @override
  void initState() {
    items.addAll(cupangList);
    super.initState();
  }

  void searchCupang(String query) {
    var dummySearchList = List<Cupang>();
    dummySearchList.addAll(cupangList);
    if (query.isNotEmpty) {
      var dummyList = List<Cupang>();
      dummySearchList.forEach((cupang) {
        if (cupang.name.toLowerCase().contains(query.toLowerCase())) {
          dummyList.add(cupang);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyList);
        return;
      });
    } else {
      setState(() {
        items.clear();
        items.addAll(cupangList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.25,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: size.height * 0.25 - 27,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(48),
                            bottomRight: Radius.circular(48))),
                  ),
                  SafeArea(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(16),
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'Find Cupang you want',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 53,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Colors.grey.withOpacity(0.5))
                          ]),
                      child: TextField(
                        onChanged: (value) {
                          searchCupang(value);
                        },
                        autofocus: false,
                        controller: editingController,
                        decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.black),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: EdgeInsets.all(4),
                children: items.map((cupang) {
                  return FlatButton(
                    padding: EdgeInsets.all(4),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailScreen(
                          cupang: cupang,
                        );
                      }));
                    },
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(cupang.imageUrl),
                                fit: BoxFit.fill)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5)),
                              child: Text(
                                cupang.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ));
  }

  var cupangList = [
    Cupang(
        name: "Halfmoon",
        description:
            "Seperti namanya, jenis ikan cupang halfmoon memiliki sirip dan ekor yang seolah menyatu membentuk setengah lingkaran. Ikan cupang Halfmoon ini dikenal dan dipelihara karena keindahannya.Varian warnanya juga kalah menarik, mulai dari merah menyala, kuning, bahkan putih.",
        price: "Rp.25.000",
        imageUrl:
            "https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2019/06/1.-Halfmoon.jpg"),
    Cupang(
        name: "Crown Tail",
        description:
            "Cupang crown tail menjadi mendunia karena variasi keindahannya. Disebut crown tail atau ekor mahkota, karena bila dibalik menghadap ke atas serit-serit pada ekornya terlihat seperti mahkota raja. Jenis ikan cupang ini banyak sekali dikoleksi orang banyak karena hasil breeder yang cukup langka.",
        price: "Rp.50.000",
        imageUrl:
            "https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2019/06/2.-Crown-Tail.png"),
    Cupang(
        name: "Plakat",
        description:
            "Ikan cupang plakat sering digunakan sebagai ikan adu. Namun, tidak sedikit orang yang memelihara cupang jenis plakat ini. Walaupun bentuknya indah, ikan cupang plakat mempunyai kesan sirip yang tegas dan kekar.Gerakan ikan cupang plakat juga tidak terlalu anggun tapi terlihat lebih sangar.",
        price: "Rp.30.000",
        imageUrl:
            "https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2019/06/3.-Plakat.jpg"),
    Cupang(
        name: "Double Tail",
        description:
            "Disebut double tail karena bagian ekornya terbelah dua, seperti bercagak dua. Jenis ikan cupang double tail tergolong sulit dikembangkan. Oleh karena itu, keberadaannya masih jarang dijumpai di pasaran dan terkenal langka.",
        price: "Rp.100.000",
        imageUrl:
            "https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2019/06/4.-Double-Tail.jpg"),
    Cupang(
        name: "HMPK",
        description:
            "Ikan cupang HMPK adalah hasil breeding dari ikan cupang jenis plakat dan halfmoon lalu disingkat menjadi HMPK. HMPK menuai banyak pujian karena bentuk dan warnanya yang indah nan menawan.",
        price: "Rp.55.000",
        imageUrl:
            "https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2019/06/5.-HMPK.jpg"),
    Cupang(
        name: "Giant",
        description:
            "Ikan cupang raksasa ini berhasil dikembangkan breeder dari Thailand. Ukuran terbesarnya mencapai 12 cm, jauh lebih besar dari jenis ikan cupang lainnya. Berkat ukuran tubuhnya yang besar, ikan cupang giant ini tidak bisa bergerak lincah dibandingkan jenis lainnya.",
        price: "Rp.75.000",
        imageUrl:
            "https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2019/06/6.-Giant.jpg"),
    Cupang(
        name: "Big Ear",
        description:
            "Jenis ikan cupang yang sering disebut cupang dumbo ini memiliki sirip telinga yang sangat lebar seperti sayap. Pada dasarnya ikan jenis ini adalah salah satu variasi ikan cupang yang baru dikembangkan dan sudah banyak ditemui di Indonesia.",
        price: "Rp.50.000",
        imageUrl:
            "https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2019/06/7.-Big-Ear.jpg"),
    Cupang(
        name: "Ikan Cupang Sawah",
        description:
            "Cupang alam atau cupang sawah adalah cupang yang belum mengalami persilangan, dan ikan ini jauh dari jangkauan manusia. Warna tubuhnya bergaris kuning dan biru. Harga ikan cupang sawah ini bervariasi.Jika semakin bagus dan langka maka bisa sangat mahal. Namun, sebaliknya jika sudah umum ikan cupang ini harganya bisa sangat murah bahkan gratis.",
        price: "Rp.15.000",
        imageUrl:
            "https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2019/06/8.-Ikan-Cupang-Sawah.jpg"),
    Cupang(
        name: "Ikan Cupang Paradise",
        description:
            "Cupang paradise atau ilmiahnya Marcopodus opercularis, banyak ditemukan di daerah persungaian Sumatra, Kalimantan dan Sulawesi. Ciri-ciri ikan ini adalah ekornya cabang, warnanya bergaris-garis vertikal dengan warna hijau muda.",
        price: "Rp.25.000",
        imageUrl:
            "https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2019/06/9.-Ikan-Cupang-Paradise.jpg"),
    Cupang(
        name: "Ikan Cupang Sarawak",
        description:
            "Ciri-ciri khusus dari cupang jenis ini adalah adanya semacam garis yang berada di sisi kanan kiri ikan dari kepala hingga pangkal ekor. Cupang Sarawak biasanya sangat mudah beradaptasi di alam.Cupang jenis ini juga lebih dari mampu hidup dengan sangat nyaman di daerah air dengan tekanan yang tinggi. Jenis ikan alam yang satu ini warnanya agak sederhana dan transparan.",
        price: "Rp.25.000",
        imageUrl:
            "https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2019/06/10.-Ikan-Cupang-Sarawak.jpg"),
  ];
}
