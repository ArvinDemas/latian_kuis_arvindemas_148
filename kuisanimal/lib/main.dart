import 'package:flutter/material.dart';
import 'package:kuisanimal/login_page.dart'; // Pastikan path ini sesuai dengan struktur folder kamu

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App Kuis', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema warna utama aplikasi
        useMaterial3: true,
      ),
      // home menentukan widget/halaman yang pertama kali ditampilkan
      home: const LoginPage(), 
    );
  }
}