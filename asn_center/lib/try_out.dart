import 'package:asn_center/main.dart';
import 'package:flutter/material.dart';

class TyrOut extends StatelessWidget {
  const TyrOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                    child: Text('List Materi Latihan',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))),
              ),
              ListTile(
                title: const Text('Materi 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Materi 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Latihan'),
        ),
        body: Stack(
          children: [
            // Konten utama
            Container(
              child: Center(
                child: Text(
                  'Konten Try out',
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation
            .startFloat, // Menempatkan FAB di sebelah kiri bawah
        floatingActionButton: BackFloatingActionButton());
  }

  Center backButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Go back!'),
      ),
    );
  }
}

class BackFloatingActionButton extends StatelessWidget {
  const BackFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pop(context);
      },
      backgroundColor: Colors.blue,
      splashColor: Colors.grey,
      child: const Icon(Icons.arrow_back_rounded, color: Colors.white),
      mini: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      isExtended: false,
    );
  }
}

class ButtonBottomLeft extends StatelessWidget {
  const ButtonBottomLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        left: 16.0, // Jarak dari kiri
        bottom: 16.0, // Jarak dari bawah
        child: GestureDetector(
          onTap: () {
            // Tindakan yang akan dilakukan ketika tombol ditekan
            print('Tombol Lingkaran Ditekan');
          },
          child: Container(
            width: 60.0, // Lebar tombol
            height: 60.0, // Tinggi tombol
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Membuat tombol berbentuk lingkaran
              color: Colors.red, // Warna tombol
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 36.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
