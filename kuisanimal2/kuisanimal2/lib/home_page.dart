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
                        ? ListView.builder(
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
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.animal.imageUrl,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.animal.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(widget.animal.animalClass,
                      style: const TextStyle(color: Colors.white70)),
                  Row(
                    children: [
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          widget.animal.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: widget.animal.isFavorite
                              ? Colors.pinkAccent
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.animal.isFavorite = !widget.animal.isFavorite;
                            if (widget.animal.isFavorite) {
                              widget.animal.likes++;
                            } else {
                              widget.animal.likes--;
                            }
                          });
                        },
                      ),
                      Text(widget.animal.likes.toString()),
                    ],
                  )
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  widget.animal.isSaved = !widget.animal.isSaved;
                });
              },
              style: OutlinedButton.styleFrom(
                foregroundColor:
                    widget.animal.isSaved ? const Color(0xFF151316) : Colors.white,
                backgroundColor:
                    widget.animal.isSaved ? const Color(0xFFB379DF) : Colors.transparent,
                side: BorderSide(
                    color: widget.animal.isSaved
                        ? const Color(0xFFB379DF)
                        : Colors.white.withOpacity(0.5)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(widget.animal.isSaved ? 'Disimpan' : 'Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

