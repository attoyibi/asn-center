import 'package:flutter/material.dart';

class HasilPengerjaan extends StatelessWidget {
  // final List<dynamic> listPengerjaan = [
  //   {
  //     "id": 65,
  //     "soal": "Baju : Lemari = Makanan : ...",
  //     "pilihan": ["Kulkas", "Dapur", "Restoran", "Meja", "Rak"],
  //     "jawaban": "Kulkas",
  //     "pembahasan":
  //         "Baju sering disimpan di dalam lemari, sementara makanan sering disimpan di dalam kulkas.",
  //     "jawaban_user": "Kulkas",
  //   },
  //   {
  //     "id": 56,
  //     "soal": "Rumput : Hijau = Langit : ...",
  //     "pilihan": ["Biru", "Terang", "Malam", "Hitam", "Mendung"],
  //     "jawaban": "Biru",
  //     "pembahasan":
  //         "Rumput biasanya berwarna hijau, sedangkan langit sering kali berwarna biru.",
  //     "jawaban_user": "Biru",
  //   },
  //   {
  //     "id": 7,
  //     "soal": "Dokter : Pasien = Guru : ...",
  //     "pilihan": ["Siswa", "Buku", "Pengetahuan", "Sekolah", "Belajar"],
  //     "jawaban": "Siswa",
  //     "pembahasan":
  //         "Seorang dokter merawat pasien, sama seperti seorang guru mengajar siswanya.",
  //     "jawaban_user": "Siswa",
  //   },
  //   {
  //     "id": 60,
  //     "soal": "Kuda : Kaki = Burung : ...",
  //     "pilihan": ["Pilot", "Bulu", "Terbang", "Sarang", "Sayap"],
  //     "jawaban": "Sayap",
  //     "pembahasan": "Kuda memiliki kaki, sementara burung memiliki sayap.",
  //     "jawaban_user": "Pilot",
  //   },
  //   {
  //     "id": 33,
  //     "soal": "Dentist : Gigi = Montir : ...",
  //     "pilihan": ["Mobil", "Ban", "Roda", "Baut", "Oli"],
  //     "jawaban": "Mobil",
  //     "pembahasan":
  //         "Seorang dentist merawat gigi, sedangkan seorang montir merawat mobil.",
  //     "jawaban_user": "Mobil",
  //   },
  //   {
  //     "id": 49,
  //     "soal": "Batu : Keras = Bulu : ...",
  //     "pilihan": ["Lemah", "Ringan", "Halus", "Tajam", "Bersih"],
  //     "jawaban": "Ringan",
  //     "pembahasan":
  //         "Batu umumnya dianggap keras, sedangkan bulu umumnya dianggap ringan.",
  //     "jawaban_user": "Lemah",
  //   },
  //   {
  //     "id": 28,
  //     "soal": "Ikan : Air = Burung : ...",
  //     "pilihan": ["Angin", "Sarang", "Pohon", "Terbang", "Makanan"],
  //     "jawaban": "Terbang",
  //     "pembahasan":
  //         "Ikan hidup di dalam air, sementara burung dapat terbang di udara.",
  //     "jawaban_user": "Angin",
  //   },
  //   {
  //     "id": 22,
  //     "soal": "Kamera : Gambar = Pianis : ...",
  //     "pilihan": ["Not", "Piano", "Musik", "Konser", "Pentas"],
  //     "jawaban": "Musik",
  //     "pembahasan":
  //         "Kamera digunakan untuk mengambil gambar, sama seperti seorang pianis menghasilkan musik.",
  //     "jawaban_user": "Not",
  //   },
  //   {
  //     "id": 31,
  //     "soal": "Pelaut : Lautan = Penerbang : ...",
  //     "pilihan": ["Bandara", "Langit", "Pesawat", "Tiket", "Awak"],
  //     "jawaban": "Langit",
  //     "pembahasan":
  //         "Pelaut berlayar di lautan, sedangkan penerbang terbang di langit.",
  //     "jawaban_user": "Langit",
  //   },
  //   {
  //     "id": 9,
  //     "soal": "Hutan : Pohon = Laut : ...",
  //     "pilihan": ["Ikan", "Pasir", "Kapal", "Pantai", "Terumbu karang"],
  //     "jawaban": "Ikan",
  //     "pembahasan":
  //         "Hutan adalah tempat di mana pohon-pohon tumbuh, sementara laut adalah tempat di mana ikan hidup.",
  //     "jawaban_user": "Ikan",
  //   },
  // ];
  final List<dynamic> listPengerjaan;

  HasilPengerjaan(this.listPengerjaan);
  double hitungNilai() {
    int jawabanBenar = 0;

    for (var hasil in listPengerjaan) {
      if (hasil["jawaban_user"] == hasil["jawaban"]) {
        jawabanBenar++;
      }
    }

    // Hitung nilai akhir (misalnya, 100 adalah nilai maksimal)
    double nilai = (jawabanBenar / listPengerjaan.length) * 100;

    return nilai;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.home)),
        title: Text('Hasil Pengerjaan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nilai Anda: ${hitungNilai().toStringAsFixed(2)}', // Menampilkan nilai dengan 2 desimal
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: listPengerjaan.length,
                itemBuilder: (BuildContext context, int index) {
                  final hasil = listPengerjaan[index];
                  final isJawabanBenar =
                      hasil["jawaban_user"] == hasil["jawaban"];
                  return Card(
                    margin: EdgeInsets.only(bottom: 16.0),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Soal ${index + 1}:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Soal: ${hasil["soal"]}',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Kunci Soal: ${hasil["jawaban"]}',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: isJawabanBenar
                                  ? Colors.green
                                  : Colors
                                      .red, // Warna teks hijau jika benar, merah jika salah
                            ),
                          ),
                          Text(
                            'Jawaban Anda: ${hasil["jawaban_user"]}',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: isJawabanBenar
                                  ? Colors.green
                                  : Colors
                                      .red, // Warna teks hijau jika benar, merah jika salah
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Pembahasan: ${hasil["pembahasan"]}',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors
                                  .blue, // Warna teks biru untuk pembahasan
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 15),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment
            //         .spaceEvenly, // Menggunakan spaceEvenly agar tombol tengah berada di tengah
            //     children: [
            //       ElevatedButton(
            //         onPressed: () {},
            //         child: Row(
            //           children: [
            //             Icon(Icons.airline_stops_rounded),
            //             Text('Coba Soal Lain'),
            //           ],
            //         ),
            //       ),
            //       ElevatedButton(
            //         onPressed: () {},
            //         child: Row(
            //           children: [
            //             Icon(Icons.refresh),
            //             Text('Kerjakan Ulang '),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
