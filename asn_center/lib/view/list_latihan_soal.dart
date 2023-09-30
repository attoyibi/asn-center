import 'package:asn_center/view/pilgan.dart';
import 'package:asn_center/view/pilganIndexed.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

class ListLatihanSoal extends StatefulWidget {
  final String namaFile;
  final String namaMateri;
  ListLatihanSoal({Key? key, required this.namaFile, required this.namaMateri})
      : super(key: key);

  @override
  State<ListLatihanSoal> createState() => _ListLatihanSoalState();
}

class _ListLatihanSoalState extends State<ListLatihanSoal> {
  List<dynamic> jsonData = [];
  final Future<String> _waitGroup = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );
  int numberOfGroups = 0;
  @override
  void initState() {
    super.initState();
    fetchDataFromAsset(); // Panggil fungsi untuk mengambil data saat widget diinisialisasi
  }

  Future<void> fetchDataFromAsset() async {
    String data = await loadAssetData('assets/data/${widget.namaFile}');
    jsonData = json.decode(data);
    int totalData = jsonData.length;
    numberOfGroups = (totalData / 10).floor(); // Bulatkan ke bawah
    print('numbernya $numberOfGroups');

    setState(() {
      jsonData = json.decode(data);
    });
  }

  // Fungsi async untuk mengambil data dari aset
  Future<String> loadAssetData(String path) async {
    try {
      return await rootBundle.loadString(path);
    } catch (e) {
      print('Error loading asset: $path');
      return '';
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Soal'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: FutureBuilder<String>(
          future: _waitGroup,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return Column(
              children: [
                SizedBox(
                  child: Material(
                    color: Color.fromARGB(255, 105, 208, 246),
                    elevation: 2,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: ListView.builder(
                      shrinkWrap: true, // Tambahkan shrinkWrap: true
                      itemCount: numberOfGroups,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Container(
                            width: 30, // Lebar kotak
                            height: 30, // Tinggi kotak
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(10), // Border radius
                              color: Colors.blue, // Warna kotak
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: Colors.white, // Warna teks nomor
                                  fontWeight:
                                      FontWeight.bold, // Ketebalan teks nomor
                                ),
                              ),
                            ),
                          ),
                          title: Text('Bank Soal ${index + 1}'),
                          trailing: Icon(Icons.arrow_forward),
                          onTap: () {
                            // Tambahkan logika apa yang harus terjadi saat ListTile di-tap di sini
                            // Contoh: Navigasi ke halaman detail soal
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PilganIndexed(
                                    namaMateri: widget.namaMateri,
                                    namaFile: widget.namaFile,
                                    startIndex: index + 1),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Material(
                  color: Color.fromARGB(255, 246, 168, 105),
                  elevation: 2,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: ListTile(
                    leading: Container(
                      width: 30, // Lebar kotak
                      height: 30, // Tinggi kotak
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(10), // Border radius
                        color: Colors.blue, // Warna kotak
                      ),
                      child: Center(
                        child: Text(
                          'R',
                          style: TextStyle(
                            color: Colors.white, // Warna teks nomor
                            fontWeight: FontWeight.bold, // Ketebalan teks nomor
                          ),
                        ),
                      ),
                    ),
                    title: Text('Random Soal'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // Action to perform when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PilganRandom(
                              namaMateri: widget.namaMateri,
                              namaFile: widget.namaFile),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
