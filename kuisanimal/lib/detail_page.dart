import 'package:flutter/material.dart';
import 'package:kuisanimal/movie_model.dart';
import 'package:url_launcher/url_launcher.dart'; // Import package url_launcher

class DetailPage extends StatelessWidget {
  // Variabel untuk menampung data film yang dikirim
  final MovieModel movie;

  // Constructor untuk menerima data saat halaman ini dibuat
  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Soal: AppBar menampilkan judul film.
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView( // Agar bisa di-scroll jika kontennya panjang
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Soal: Tampilkan detail: Poster
              Center(
                child: SizedBox(
                  height: 300,
                  child: Image.network(movie.imgUrl, fit: BoxFit.contain),
                ),
              ),
              const SizedBox(height: 20),
              // Soal: Judul & Tahun
              Text(
                '${movie.title} (${movie.year})',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Soal: Rating
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 24),
                  const SizedBox(width: 8),
                  Text(movie.rating.toString(), style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 20),
                  // Soal: Genre
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(movie.genre, style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('Sinopsis'),
              // Soal: Sinopsis
              Text(movie.synopsis, textAlign: TextAlign.justify),
              const SizedBox(height: 20),
              _buildSectionTitle('Sutradara'),
              // Soal: Sutradara
              Text(movie.director),
              const SizedBox(height: 20),
              _buildSectionTitle('Pemain'),
              // Soal: Daftar Casts
              Text(movie.casts.join(', ')), // Menggabungkan list menjadi satu string
              const SizedBox(height: 30),
              // Soal: Link IMDb/Wikipedia (tombol/link yang bisa dibuka browser).
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.open_in_browser),
                  label: const Text('Buka di Wikipedia'),
                  onPressed: () {
                    // Soal: Jika tombol/link URL ditekan, langsung membuka halaman
                    _launchURL(movie.movieUrl);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk judul setiap seksi
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
    );
  }
  
  // Fungsi untuk meluncurkan URL (Bonus)
  Future<void> _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}