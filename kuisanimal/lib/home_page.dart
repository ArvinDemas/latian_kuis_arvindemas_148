import 'package:flutter/material.dart';
import 'package:kuisanimal/detail_page.dart';
import 'package:kuisanimal/movie_model.dart'; // Import model dan data

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Film'),
      ),
      // Soal: Gunakan ListView atau GridView
      body: ListView.builder(
        // itemCount menentukan berapa banyak item yang akan ditampilkan
        itemCount: movieList.length,
        // itemBuilder membangun tampilan untuk setiap item
        itemBuilder: (context, index) {
          // Ambil satu objek film dari list berdasarkan index-nya
          final MovieModel movie = movieList[index];
          return Card(
            margin: const EdgeInsets.all(10.0),
            // Soal: Bungkus item dengan InkWell / Gesture Detector
            child: InkWell(
              onTap: () {
                // Soal: ketika ditekan, pindah ke Detail Page sambil mengirim objek MovieModel.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(movie: movie),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Soal: Tampilkan Poster (imgUrl)
                    SizedBox(
                      width: 100,
                      height: 150,
                      child: Image.network(
                        movie.imgUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error); // Tampilkan ikon jika gambar gagal dimuat
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Soal: Tampilkan Judul (title)
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('Tahun: ${movie.year}'),
                          const SizedBox(height: 8),
                          // Soal: Tampilkan Tahun (year) atau Rating (rating)
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 20),
                              const SizedBox(width: 5),
                              Text(
                                movie.rating.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}