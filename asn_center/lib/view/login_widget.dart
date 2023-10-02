// import 'package:asn_center/main.dart';
import 'package:asn_center/viewmodel/UserDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  late UserDataProvider userDataProvider; // Declare the variable
  // Define the method to save data to SharedPreferences
  Future<void> _saveUserDataToSharedPreferences(
      String name, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('email', email);
  }

  String? validateName(value) {
    if (value == null || value.isEmpty) {
      return 'Nama harus diisi';
    } else if (value.length < 2 || value.length > 50) {
      return 'Nama harus memiliki panjang antara 2 dan 50 karakter';
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Nama hanya boleh mengandung huruf dan spasi';
    }
    return null; // Validasi berhasil
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email harus diisi';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+\.[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      if (!value.contains('@')) {
        return 'Email harus mengandung karakter "@"';
      } else if (!value.contains('.')) {
        return 'Email harus mengandung karakter "." setelah "@"';
      } else {
        return 'Email tidak valid. Pastikan format email yang benar, seperti "nama@domain.com"';
      }
    }
    return null; // Validasi berhasil
  }

  @override
  void initState() {
    super.initState();
    // Initialize userDataProvider in initState if needed
    userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    // final userDataProvider =
    //     Provider.of<UserDataProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
              ),
              validator: validateName, // Memanggil fungsi validasi
            ),
            SizedBox(height: 16.0),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              validator: validateEmail, // Memanggil fungsi validasi
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () async {
                // Masukkan kode aksi saat tombol Join ditekan di sini
                String name = _nameController.text;
                String email = _emailController.text;
                // Save data to shared preferences
                await _saveUserDataToSharedPreferences(name, email);
                // Simpan data pengguna menggunakan Provider
                userDataProvider.saveUserData(name, email);
                // Anda dapat melakukan validasi atau menyimpan data pengguna di sini
                // Misalnya, Anda bisa memvalidasi apakah nama dan email valid
                // dan kemudian melakukan navigasi ke layar berikutnya jika valid.

                // Navigasi ke layar berikutnya (gantilah dengan perintah navigasi sesuai kebutuhan Anda)
                Navigator.pushReplacementNamed(
                  context,
                  '/home',
                  arguments: {
                    'name': _nameController.text,
                    'email': _emailController.text,
                  },
                );
              },
              child: Text('Join'),
            ),
          ],
        ),
      ),
    );
  }
}
