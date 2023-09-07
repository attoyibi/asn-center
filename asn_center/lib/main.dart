import 'package:flutter/material.dart';
import 'package:flutter/src/painting/decoration.dart';

//referensi : https://drive.google.com/drive/u/0/folders/1uJHI-DCXXi7ZFM1ziSdQWVF70q3uzRoT
void main() {
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
      home: Scaffold(
        body: Column(
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
                  stops: [0.0, 0.65, 0.5, 1.0],
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
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment
                                .centerLeft, // Mengatur teks ke awal atau sebelah kiri container
                            child: Text('Berita Terbaru'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
        elevation: 8.0, // Sesuaikan ketinggian sesuai kebutuhan
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
