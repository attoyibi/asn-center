import 'package:asn_center/latihan.dart';
import 'package:asn_center/main.dart';
import 'package:asn_center/viewmodel/UserDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    required this.primaryColor,
    required this.onPrimary,
  });

  final MaterialColor primaryColor;
  final Color onPrimary;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<void> _loadUserData() async {
    final userDataProvider =
        Provider.of<UserDataProvider>(context, listen: false);
    await userDataProvider.loadUserData();
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final userDataProvider = Provider.of<UserDataProvider>(context);
    final name = userDataProvider.userData?.name ?? 'Selamat Datang';
    final email = userDataProvider.userData?.email ??
        'Klik daftar untuk mendapatkan fitur tambahan';
    print("$name - $email");

    // final name = '';
    // final email = '';
    // print('$name - $email');
    return Builder(builder: (context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                // height: 150.0, // Set the height to 40 pixels
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      widget.primaryColor,
                      widget.primaryColor,
                      Colors.transparent,
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.8, 0.5, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      HeaderText(onPrimary: widget.onPrimary),
                      HomeCard(name: name, email: email),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    // Align(
                    //   alignment: Alignment
                    //       .centerLeft, // Mengatur teks ke awal atau sebelah kiri container
                    //   child: Container(
                    //       child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Container(
                    //           margin: EdgeInsets.only(left: 20, right: 20),
                    //           child: Text('Berita Terbaru')),
                    //       SizedBox(height: 10),
                    //       MyCarousel(),
                    //     ],
                    //   )),
                    // ),
                  ],
                ),
              ),
              Column(
                children: [
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => const Latihan(
                  //             app: 'Tes Wawasan Kebangsaan (TWK)'),
                  //       ),
                  //     );
                  //     print('Widget latihan ditekan');
                  //   },
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Image.asset(
                  //         'assets/icons/reading.png',
                  //         width: 100, // Lebar gambar 100px
                  //         height: 100, // Tinggi gambar 100px
                  //       ),
                  //       Text(
                  //         'Tes Wawasan Kebangsaan (TWK)',
                  //         style: TextStyle(
                  //           fontWeight:
                  //               FontWeight.bold, // Atur weight menjadi bold
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Material(
                    elevation: 2,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/reading.png',
                            width: 100, // Lebar gambar 100px
                            height: 100, // Tinggi gambar 100px
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Latihan(
                                      app: 'Tes Intelegensi Umum (TIU)'),
                                ),
                              );
                            },
                            child: Text(
                              'Tes Intelegensi Umum (TIU)',
                              style: TextStyle(
                                fontWeight:
                                    FontWeight.bold, // Atur weight menjadi bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) =>
                  //             const Latihan(app: 'Tes Karakteristik Pribadi'),
                  //       ),
                  //     );
                  //     print('Widget latihan ditekan');
                  //   },
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Image.asset(
                  //         'assets/icons/reading.png',
                  //         width: 100, // Lebar gambar 100px
                  //         height: 100, // Tinggi gambar 100px
                  //       ),
                  //       Text(
                  //         'Tes Karakteristik Pribadi',
                  //         style: TextStyle(
                  //           fontWeight:
                  //               FontWeight.bold, // Atur weight menjadi bold
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => const TyrOut(),
                  //       ),
                  //     );
                  //     print('Widget Try Out ditekan');
                  //   },
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Image.asset(
                  //         'assets/icons/archives.png',
                  //         width: 100, // Lebar gambar 50px
                  //         height: 100, // Tinggi gambar 50px
                  //       ),
                  //       Text(
                  //         'Try Out',
                  //         style: TextStyle(
                  //           fontWeight:
                  //               FontWeight.bold, // Atur weight menjadi bold
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

final Uri _url = Uri.parse(
    'https://docs.google.com/forms/d/e/1FAIpQLSdefdEOO9zWGx2waSjVW0r21R4SHg06A43T8SklQ8bTBX-wyQ/viewform');

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.name,
    required this.email,
  });
  final String name;
  final String email;
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.white,
        elevation: 2.0, // Sesuaikan ketinggian sesuai kebutuhan
        borderRadius: BorderRadius.circular(10),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Sesuaikan sesuai kebutuhan
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Tambahkan widget-widget dalam Row di sini
                  Row(
                    children: [
                      // Image.asset(
                      //   '/asn_center/assets/images/logo_sinau_tech.png]',
                      //   height: 30,
                      //   width: 50,
                      // ),
                      SizedBox(
                        width: 10,
                      ),
                      SingleChildScrollView(
                        child: Container(
                          height: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('$name'),
                              Text('$email', style: TextStyle(fontSize: 9)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print("buttoin");
                        _launchUrl();
                      },
                      child: Text('Fitur Gratis')),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Menyisipkan ruang antara widget dalam Row
                children: [
                  // Text(
                  // 'Aplikasi masih masa pengembangan, minta masukan temen-temen fitur apa yang harus di tambahkan')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  final Color onPrimary;
  const HeaderText({Key? key, required this.onPrimary}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Center(
        child: Column(
          children: [
            Text('ASN Center',
                style: TextStyle(
                    fontSize: 40, color: onPrimary, fontFamily: 'Mulish')),
            Text('Sinau Tech',
                style: TextStyle(
                    fontSize: 14,
                    color: onPrimary,
                    fontWeight: FontWeight.w100,
                    fontStyle: FontStyle.normal)),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class MyCarousel extends StatefulWidget {
  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  final List<String> imgList = [
    'https://cdn.idntimes.com/content-images/post/20200414/cover-artikel-0ec0e8f5f3d38952e5f427c826b4f936_600x400.jpg',
    'https://cdn.idntimes.com/content-images/post/20200414/cover-artikel-0ec0e8f5f3d38952e5f427c826b4f936_600x400.jpg',
    'https://cdn.idntimes.com/content-images/post/20200414/cover-artikel-0ec0e8f5f3d38952e5f427c826b4f936_600x400.jpg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            height: 100.0,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index; // Ubah _currentIndex saat gambar berubah
              });
            },
          ),
          items: imgList.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        20.0), // Atur nilai sesuai keinginan Anda
                    // color: Colors.grey,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 5, top: 3),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            int index = entry.key;
            bool isBlue = index ==
                _currentIndex; // Warna biru hanya untuk indeks yang aktif
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isBlue ? Colors.blueAccent : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
