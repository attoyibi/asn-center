import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'hasil_pengerjaan.dart';

// Fungsi async untuk mengambil data dari aset
Future<String> loadAssetData(String path) async {
  try {
    return await rootBundle.loadString(path);
  } catch (e) {
    print('Error loading asset: $path');
    return '';
  }
}

class PilganRandom extends StatefulWidget {
  final String namaFile; // Tambahkan parameter index_pilgan ke konstruktor
  final String namaMateri; // Tambahkan parameter index_pilgan ke konstruktor
  PilganRandom({Key? key, required this.namaFile, required this.namaMateri})
      : super(key: key);

  @override
  State<PilganRandom> createState() => _PilganState();
}

class _PilganState extends State<PilganRandom> {
  List<dynamic> jsonData = [];
  List<bool> listTileSelectedStatus =
      List.generate(5, (index) => false); // List status untuk setiap ListTile
  List skalaPilgan = [
    'A',
    'B',
    'C',
    'D',
    'E',
  ];
  List<int> randomNumbers = [];
  List listQuiz = [];
  int currentPilgan = 0;
  bool isValidationError = false; // Variabel untuk melacak kesalahan validasi

  bool areAllAnswersFilled() {
    // Iterasi melalui listQuiz untuk memeriksa jawaban_user
    for (final quizItem in listQuiz) {
      final userAnswer = quizItem['jawaban_user'] as String;
      if (userAnswer.isEmpty || userAnswer != quizItem['jawaban']) {
        // Jika jawaban_user kosong atau tidak benar, return false
        return false;
      }
    }
    // Jika semua jawaban_user benar, return true
    return true;
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromAsset(); // Panggil fungsi untuk mengambil data saat widget diinisialisasi
  }

  Future<void> fetchDataFromAsset() async {
    print(widget.namaFile);

    String data = await loadAssetData('assets/data/${widget.namaFile}');

    jsonData = json.decode(data);

    print("Data yang di pakai : ${jsonData}");

    setState(() {
      jsonData = json.decode(data);
      generateRandomNumbers(
          jsonData); // Panggil method untuk menghasilkan angka acak saat widget diinisialisasi
    });
  }

  void generateRandomNumbers(jsonData) {
    final random = Random();
    while (randomNumbers.length < 10) {
      final randomNumber = random.nextInt(jsonData.length);
      if (!randomNumbers.contains(randomNumber)) {
        // print(jsonData[1]);
        final quizItem = jsonData[randomNumber];
        quizItem['jawaban_user'] =
            ""; // Inisialisasi jawaban_user sebagai array kosong
        listQuiz.add(quizItem);
        randomNumbers.add(randomNumber);
      }
    }
    print(listQuiz[0]);
    print('Random Numbers: $randomNumbers'); // Cetak angka acak untuk pengujian
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(widget.namaMateri),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Terdapat 10 Soal'),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Text(
              '${currentPilgan + 1}. ${listQuiz.isNotEmpty ? listQuiz[currentPilgan]["soal"] : ""}',
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    skalaPilgan.length, // Jumlah ListTiles yang ingin Anda buat
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                        '${listQuiz.isNotEmpty ? listQuiz[currentPilgan]["pilihan"][index] : ""}'), // Judul ListTile sesuai nomor soal
                    // Anda dapat menambahkan konten lain di dalam ListTile sesuai kebutuhan
                    // Sebagai contoh:
                    leading: Container(
                      width: 36, // Atur lebar sesuai kebutuhan
                      height: 36, // Atur tinggi sesuai kebutuhan
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue, // Warna latar belakang biru
                        shape: BoxShape.circle, // Bentuk bulat
                      ),
                      child: Text(
                        '${skalaPilgan[index]}',
                        style: TextStyle(
                          color: Colors.white, // Warna teks putih
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // subtitle: Text('Ini adalah deskripsi soal ${index + 1}'),
                    trailing: listTileSelectedStatus[index]
                        ? Icon(Icons.check)
                        : null,
                    onTap: () {
                      // Aksi yang ingin Anda lakukan ketika ListTile diklik
                      // Misalnya, Anda dapat menavigasi ke halaman detail soal
                      // atau menampilkan informasi tambahan tentang soal ini.
                      setState(() {
                        // Reset semua nilai isSelected menjadi false
                        listTileSelectedStatus =
                            List.generate(5, (index) => false);
                        // Mengatur nilai isSelected menjadi true untuk ListTile yang sedang diklik
                        listTileSelectedStatus[index] = true;
                        // Memasukkan jawaban pengguna ke dalam data jawaban_user
                        listQuiz[currentPilgan]['jawaban_user'] =
                            listQuiz[currentPilgan]['pilihan'][index];
                        print(listQuiz);
                      });
                    },
                  );
                },
              ),
            ),

            Container(
              width: double.infinity, // Lebar container mengikuti lebar layar
              child: ElevatedButton(
                onPressed: () {
                  if (listQuiz[currentPilgan]['jawaban_user'].isEmpty) {
                    setState(() {
                      isValidationError = true;
                    });
                  } else {
                    setState(() {
                      if (currentPilgan == 9) {
                        // Jika sudah mencapai soal ke-10 (indeks 9), navigasi ke widget hasil
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HasilPengerjaan(listQuiz),
                          ),
                        );
                      } else {
                        currentPilgan++;
                        listTileSelectedStatus =
                            List.generate(5, (index) => false);
                        isValidationError = false;
                      }
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(
                  currentPilgan == 9 ? 'Submit' : 'Next',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            // Tampilkan pesan validasi jika isValidationError adalah true
            if (isValidationError)
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Silakan pilih jawaban sebelum melanjutkan!',
                  style: TextStyle(
                    color: Colors.red, // Warna teks merah untuk pesan validasi
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
