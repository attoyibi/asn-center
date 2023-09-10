import 'package:asn_center/latihan.dart';
import 'package:asn_center/try_out.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'latihan.dart';

//referensi : https://drive.google.com/drive/u/0/folders/1uJHI-DCXXi7ZFM1ziSdQWVF70q3uzRoT
// Future<void> main() async {
void main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final brightness = Brightness
        .light; // Anda dapat mengganti dengan Brightness.dark jika Anda menginginkan tema gelap.

    final primaryColor = Colors.blue; // Primary color menjadi biru
    final onPrimary = Colors.white; // Text on primary color menjadi putih

    final secondaryColor = Colors.yellow; // Secondary color menjadi kuning
    final onSecondary = Colors.black; // Text on secondary color menjadi hitam

    final errorColor = Colors.red; // Error color menjadi merah
    final onError = Colors.white; // Text on error color menjadi putih

    final backgroundColor = Colors.white; // Background color menjadi putih
    final onBackgroundColor =
        Colors.black; // Text on background color menjadi hitam

    final surfaceColor =
        Colors.grey; // Surface color (misalnya card) menjadi warna abu-abu
    final onSurfaceColor = Colors.black; // Text on surface color menjadi hitam

    return MaterialApp(
      navigatorKey: GlobalKey<NavigatorState>(),
      theme: ThemeData(
        fontFamily: 'Mulish', // Menentukan fontFamily menjadi 'Mulish'
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: primaryColor,
          onPrimary: onPrimary,
          secondary: secondaryColor,
          onSecondary: onSecondary,
          error: errorColor,
          onError: onError,
          background: backgroundColor,
          onBackground: onBackgroundColor,
          surface: surfaceColor,
          onSurface: onSurfaceColor,
        ),
      ),
      home: Builder(builder: (context) {
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
                        primaryColor,
                        primaryColor,
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
                        HeaderText(onPrimary: onPrimary),
                        HomeCard(),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment
                            .centerLeft, // Mengatur teks ke awal atau sebelah kiri container
                        child: Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: Text('Berita Terbaru')),
                            SizedBox(height: 10),
                            MyCarousel(),
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Latihan(),
                          ),
                        );
                        print('Widget latihan ditekan');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/reading.png',
                            width: 100, // Lebar gambar 100px
                            height: 100, // Tinggi gambar 100px
                          ),
                          Text(
                            'Tes Wawasan Kebangsaan (TWK)',
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold, // Atur weight menjadi bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Latihan(),
                          ),
                        );
                        print('Widget latihan ditekan');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/reading.png',
                            width: 100, // Lebar gambar 100px
                            height: 100, // Tinggi gambar 100px
                          ),
                          Text(
                            'Tes Intelegensi Umum (TIU)',
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold, // Atur weight menjadi bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Latihan(),
                          ),
                        );
                        print('Widget latihan ditekan');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/reading.png',
                            width: 100, // Lebar gambar 100px
                            height: 100, // Tinggi gambar 100px
                          ),
                          Text(
                            'Tes Karakteristik Pribadi',
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold, // Atur weight menjadi bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TyrOut(),
                          ),
                        );
                        print('Widget Try Out ditekan');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/archives.png',
                            width: 100, // Lebar gambar 50px
                            height: 100, // Tinggi gambar 50px
                          ),
                          Text(
                            'Try Out',
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold, // Atur weight menjadi bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
  });

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
                      Image.network(
                        'https://cdn.idntimes.com/content-images/post/20200414/cover-artikel-0ec0e8f5f3d38952e5f427c826b4f936_600x400.jpg',
                        height: 30,
                        width: 50,
                      ),
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
                              Text('Muhammad Muchson'),
                              Text('Muhammadmuchson@gmail.com',
                                  style: TextStyle(fontSize: 9)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Beli')),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Menyisipkan ruang antara widget dalam Row
                children: [Text('data'), Text('data'), Text('data')],
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
            Text('By Muhammad Muchson Attoyibi',
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

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
