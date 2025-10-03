// lib/home_page.dart

import 'package:flutter/material.dart';
import 'package:kuisanimal2/animal_model.dart';
import 'package:kuisanimal2/detail_page.dart';
import 'package:kuisanimal2/widgets/background_widget.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<AnimalModel> _allAnimals = animalList;
  List<AnimalModel> _foundAnimals = [];

  @override
  void initState() {
    _foundAnimals = _allAnimals;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<AnimalModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allAnimals;
    } else {
      results = _allAnimals
          .where((animal) =>
              animal.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundAnimals = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Halo, ${widget.username}!',
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Temukan hewan favoritmu',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                      hintText: 'Cari hewan...',
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: _foundAnimals.isNotEmpty
                        // --- PERUBAHAN 1: Mengganti ListView.builder menjadi GridView.builder ---
                        ? GridView.builder(
                            // Opsi untuk mengatur layout grid
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Menampilkan 2 kartu per baris
                              crossAxisSpacing: 16, // Jarak horizontal antar kartu
                              mainAxisSpacing: 16, // Jarak vertikal antar kartu
                              childAspectRatio: 0.75, // Rasio lebar:tinggi kartu
                            ),
                            itemCount: _foundAnimals.length,
                            itemBuilder: (context, index) {
                              return AnimalListItem(
                                animal: _foundAnimals[index],
                              );
                            },
                          )
                        : const Center(
                            child: Text(
                              'Tidak ada hewan yang ditemukan.',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- PERUBAHAN 2: Mendesain Ulang Tampilan Kartu (AnimalListItem) ---
class AnimalListItem extends StatefulWidget {
  final AnimalModel animal;
  const AnimalListItem({super.key, required this.animal});

  @override
  State<AnimalListItem> createState() => _AnimalListItemState();
}

class _AnimalListItemState extends State<AnimalListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(animal: widget.animal),
          ),
        );
      },
      child: Container(
        // Dekorasi kartu agar terlihat lebih menarik
        clipBehavior: Clip.antiAlias, // Memotong widget anak yg keluar batas
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        // Layout kartu diubah menjadi Column (vertikal)
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar hewan dibuat lebih besar
            Image.network(
              widget.animal.imageUrl,
              height: 140, // Tinggi gambar diperbesar
              width: double.infinity, // Lebar gambar memenuhi kartu
              fit: BoxFit.cover, // Gambar akan di-crop agar pas
            ),
            // Padding untuk konten di bawah gambar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.animal.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.animal.animalClass,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  Text(
                    widget.animal.animalClass,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            // Spacer untuk mendorong baris tombol ke bagian paling bawah kartu
            const Spacer(),
            // Baris baru khusus untuk tombol Like dan Simpan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Kelompok Tombol Like
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.animal.isFavorite =
                                !widget.animal.isFavorite;
                            if (widget.animal.isFavorite) {
                              widget.animal.likes++;
                            } else {
                              widget.animal.likes--;
                            }
                          });
                        },
                        child: Icon(
                          widget.animal.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: widget.animal.isFavorite
                              ? Colors.pinkAccent
                              : Colors.white,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(widget.animal.likes.toString()),
                    ],
                  ),
                  // Tombol Simpan diubah menjadi ikon
                  GestureDetector(
                    onTap: () {
                       setState(() {
                          widget.animal.isSaved = !widget.animal.isSaved;
                        });
                    },
                    child: Icon(
                      widget.animal.isSaved
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: widget.animal.isSaved
                          ? const Color(0xFFB379DF)
                          : Colors.white,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}