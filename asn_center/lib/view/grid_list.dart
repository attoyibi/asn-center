import 'package:asn_center/view/list_latihan_soal.dart';
import 'package:asn_center/view/pilgan.dart';
import 'package:flutter/material.dart';

class GridList extends StatelessWidget {
  List<dynamic> jsonData = [];

  GridList({super.key, required this.jsonData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          children: List.generate(jsonData.length, (index) {
            return Container(
              margin: EdgeInsets.only(top: 10, left: 5, right: 5),
              child: Center(
                child: Container(
                  // margin:
                  //     EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  // padding: EdgeInsets.only(bottom: 15),
                  width: 600,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(238, 238, 238, 1)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/garuda.png',
                        width: 75, // Lebar gambar 100px
                        height: 75,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 2, left: 2),
                        child: Text(
                          '${jsonData[index]['nama_materi']}',
                          style: TextStyle(fontSize: 12),
                          maxLines: 3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Action to perform when the button is pressed
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Pilgan(
                          //         namaMateri:
                          //             '${jsonData[index]['nama_materi']}',
                          //         namaFile: '${jsonData[index]['nama_file']}'),
                          //   ),
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListLatihanSoal(
                                  namaMateri:
                                      '${jsonData[index]['nama_materi']}',
                                  namaFile: '${jsonData[index]['nama_file']}'),
                            ),
                          );
                          print('pelajari');
                        },
                        child: Text('Latihan Soal'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}

// terdapat  sebuah  widget  yang  memiliki  ikon materi, judul materi (biasanya di bawah ikon), dan mungkin tombol "Pelajari" atau "Lihat".

class MaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.abc),
        Text(
          'Judul Materi',
          style: TextStyle(fontSize: 16),
        ),
        ElevatedButton(
          onPressed: () {
            // Action to perform when the button is pressed
          },
          child: Text('Pelajari'),
        ),
      ],
    );
  }
}
