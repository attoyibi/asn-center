import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'hasil_pengerjaan.dart';

class PilganIndexed extends StatefulWidget {
  final String namaFile;
  final String namaMateri;
  final int startIndex; // Tambahkan parameter startIndex ke konstruktor
  PilganIndexed(
      {Key? key,
      required this.namaFile,
      required this.namaMateri,
      required this.startIndex})
      : super(key: key);

  @override
  State<PilganIndexed> createState() => _PilganIndexedState();
}

class _PilganIndexedState extends State<PilganIndexed> {
  List<dynamic> jsonData = [];
  List<bool> listTileSelectedStatus = List.generate(5, (index) => false);
  List skalaPilgan = ['A', 'B', 'C', 'D', 'E'];
  List<int> randomNumbers = [];
  List listQuiz = [];
  int currentPilgan = 0;
  bool isValidationError = false;

  bool areAllAnswersFilled() {
    for (final quizItem in listQuiz) {
      final userAnswer = quizItem['jawaban_user'] as String;
      if (userAnswer.isEmpty || userAnswer != quizItem['jawaban']) {
        return false;
      }
    }
    return true;
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

  @override
  void initState() {
    super.initState();
    fetchDataFromAsset();
  }

  Future<void> fetchDataFromAsset() async {
    print("nama file = $widget.namaFile");
    String data = await loadAssetData('assets/data/${widget.namaFile}');
    jsonData = json.decode(data);
    print("Data yang di pakai : ${jsonData}");
    setState(() {
      jsonData = json.decode(data);
      generateQuiz(jsonData);
    });
  }

  void generateQuiz(jsonData) {
    int startIndex = (widget.startIndex - 1) * 10 + 1;
    print(startIndex);
    for (var i = startIndex; i <= startIndex + 9; i++) {
      print(i);
      final quizItem = jsonData[i - 1];
      quizItem['jawaban_user'] = "";
      listQuiz.add(quizItem);
    }
    print(listQuiz);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
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
                itemCount: skalaPilgan.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                    title: Text(
                      '${listQuiz.isNotEmpty ? listQuiz[currentPilgan]["pilihan"][index] : ""}',
                    ),
                    leading: Container(
                      width: 36,
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${skalaPilgan[index]}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    trailing: listTileSelectedStatus[index]
                        ? Icon(Icons.check)
                        : null,
                    onTap: () {
                      setState(() {
                        listTileSelectedStatus =
                            List.generate(5, (index) => false);
                        listTileSelectedStatus[index] = true;
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
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (listQuiz[currentPilgan]['jawaban_user'].isEmpty) {
                    setState(() {
                      isValidationError = true;
                    });
                  } else {
                    setState(() {
                      if (currentPilgan == 9) {
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
            if (isValidationError)
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Silakan pilih jawaban sebelum melanjutkan!',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
