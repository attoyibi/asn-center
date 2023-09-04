import 'package:flutter/material.dart';

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
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.green[200],
              child: Center(
                child: Column(
                  children: [
                    Text('ASN Center', style: TextStyle(fontSize: 40)),
                    Text('By Muhammad Muchson Attoyibi'),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40),
              child: Material(
                color: Colors.white,
                elevation: 8.0, // Sesuaikan ketinggian sesuai kebutuhan
                borderRadius: BorderRadius.circular(10),
                child: Transform.translate(
                  offset: Offset(
                      0, -40), // Menggeser container ke atas sebanyak 40 unit
                  child: SizedBox(
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
