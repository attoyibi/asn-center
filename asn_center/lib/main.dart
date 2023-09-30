import 'package:asn_center/about_us.dart';
import 'package:asn_center/view/login_widget.dart';
import 'package:asn_center/view/main_screen.dart';
import 'package:asn_center/latihan.dart';
import 'package:asn_center/try_out.dart';
import 'package:asn_center/viewmodel/UserDataProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'latihan.dart';
// Buat class model untuk data pengguna
// Define the navigatorKey here

//referensi : https://drive.google.com/drive/u/0/folders/1uJHI-DCXXi7ZFM1ziSdQWVF70q3uzRoT
// Future<void> main() async {
void main() {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserDataProvider()),
      ],
      child: const HomePage(),
    ),
  );
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
      initialRoute: '/login',
      routes: {
        '/login': (_) => LoginWidget(),
        '/home': (_) =>
            MainScreen(primaryColor: primaryColor, onPrimary: onPrimary),
        '/aboutus': (_) => AboutUs(),
      },
    );
  }
}
