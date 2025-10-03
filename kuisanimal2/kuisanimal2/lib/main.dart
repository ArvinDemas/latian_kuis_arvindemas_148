// lib/main.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuisanimal2/login_page.dart'; // Sesuaikan path jika perlu

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animalpedia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // --- TEMA BARU SESUAI PERMINTAAN ---
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF151316),
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        // ------------------------------------
      ),
      home: const LoginPage(),
    );
  }
}

