import 'package:flutter/material.dart';
import 'package:kuisanimal/home_page.dart'; // Import HomePage

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();

  @override
  void dispose() {
    usernameC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  void _login() {
    String username = usernameC.text;
    String password = passwordC.text;
    
    // Soal: Buat halaman login sederhana (username & password dummy).
    if (username == "arvin" && password == "148") {
      // Soal: Jika login berhasil→ pindah ke Home Page.
      // Kita gunakan pushReplacement agar tidak bisa kembali ke login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      // Tampilkan notifikasi gagal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Gagal. Coba lagi."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie App Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.movie, size: 80, color: Colors.blueAccent),
            const SizedBox(height: 20),
            _usernameField(),
            const SizedBox(height: 20),
            _passwordField(),
            const SizedBox(height: 40),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      controller: usernameC,
      decoration: const InputDecoration(
        labelText: "Username",
        hintText: "Masukkan username (admin)",
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      controller: passwordC,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Masukkan password (admin)",
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _login,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: const Text("Login", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}