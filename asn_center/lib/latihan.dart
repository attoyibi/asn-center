import 'dart:convert';

import 'package:asn_center/component/grid_list.dart';
import 'package:asn_center/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

// Fungsi async untuk mengambil data dari aset
Future<String> loadAssetData(String path) async {
  try {
    return await rootBundle.loadString(path);
  } catch (e) {
    print('Error loading asset: $path');
    return '';
  }
}

class Latihan extends StatefulWidget {
  final String app; // Tambahkan parameter konstruktor
  const Latihan({super.key, required this.app});

  @override
  State<Latihan> createState() => _LatihanState();
}

class _LatihanState extends State<Latihan> {
  List<dynamic> jsonData = [];
  // print(app);
  @override
  void initState() {
    super.initState();
    fetchDataFromAsset(); // Panggil fungsi untuk mengambil data saat widget diinisialisasi
  }

  Future<void> fetchDataFromAsset() async {
    // List<Map<String, dynamic>> data = [];
    String data = await loadAssetData('assets/data/my_data_file.json');

    jsonData = json.decode(data);

    // print(jsonData);

    setState(() {
      jsonData = json.decode(data);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.app),
        // actions: <Widget>[
        //   // Ini adalah bagian pencarian dalam AppBar
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     onPressed: () {
        //       // Tampilkan dialog pencarian atau navigasi ke layar pencarian.
        //       showSearch(context: context, delegate: CustomSearchDelegate());
        //     },
        //   ),
        // ],
      ),
      body: jsonData.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridList(jsonData: jsonData),
    );
  }

//   Center backButton(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.pop(context);
//         },
//         child: const Text('Go back!'),
//       ),
//     );
//   }
// }

// class BackFloatingActionButton extends StatelessWidget {
//   const BackFloatingActionButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       onPressed: () {
//         Navigator.pop(context);
//       },
//       backgroundColor: Colors.blue,
//       splashColor: Colors.grey,
//       child: const Icon(Icons.arrow_back_rounded, color: Colors.white),
//       mini: true,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//       isExtended: false,
//     );
//   }
// }

// class ButtonBottomLeft extends StatelessWidget {
//   const ButtonBottomLeft({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Positioned(
//         left: 16.0, // Jarak dari kiri
//         bottom: 16.0, // Jarak dari bawah
//         child: GestureDetector(
//           onTap: () {
//             // Tindakan yang akan dilakukan ketika tombol ditekan
//             print('Tombol Lingkaran Ditekan');
//           },
//           child: Container(
//             width: 60.0, // Lebar tombol
//             height: 60.0, // Tinggi tombol
//             decoration: BoxDecoration(
//               shape: BoxShape.circle, // Membuat tombol berbentuk lingkaran
//               color: Colors.red, // Warna tombol
//             ),
//             child: Center(
//               child: Icon(
//                 Icons.add,
//                 color: Colors.white,
//                 size: 36.0,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Kelas CustomSearchDelegate untuk menangani pencarian
// class CustomSearchDelegate extends SearchDelegate<String> {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     // Tambahkan tombol "Batal" di sebelah kanan TextField pencarian.
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     // Tambahkan tombol "Kembali" di sebelah kiri TextField pencarian.
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // Tampilkan hasil pencarian atau tampilan lain sesuai kebutuhan.
//     return Center(
//       child: Text('Hasil Pencarian: $query'),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // Tampilkan saran-saran pencarian yang mungkin sesuai dengan query pengguna.
//     // Anda dapat mengisi dengan daftar saran pencarian berdasarkan query.
//     return Center(
//       child: Text('Saran Pencarian'),
//     );
//   }
}
