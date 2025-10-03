// lib/animal_model.dart

class AnimalModel {
  String name;
  String scientificName;
  String animalClass;
  String habitat;
  String diet;
  String description;
  String imageUrl;
  String wikiUrl;
  int likes;
  bool isFavorite;
  bool isSaved;

  AnimalModel({
    required this.name,
    required this.scientificName,
    required this.animalClass,
    required this.habitat,
    required this.diet,
    required this.description,
    required this.imageUrl,
    required this.wikiUrl,
    this.likes = 0,
    this.isFavorite = false,
    this.isSaved = false,
  });
}

// --- DATA HEWAN (URL GAMBAR TELAH DIPERBARUI) ---
// Kamu bisa menambah atau mengubah data hewan di sini.
var animalList = [
  AnimalModel(
    name: 'Harimau Siberia',
    scientificName: 'Panthera tigris altaica',
    animalClass: 'Mamalia',
    habitat: 'Hutan Rusia',
    diet: 'Karnivora',
    description:
        'Harimau Siberia adalah salah satu kucing terbesar di dunia. Mereka memiliki bulu tebal berwarna oranye dengan garis-garis hitam yang khas untuk kamuflase di salju.',
    // URL Diperbarui
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/b/b9/P.t.altaica_Tomak_Male.jpg',
    wikiUrl: 'https://id.wikipedia.org/wiki/Harimau_siberia',
    likes: 150,
  ),
  AnimalModel(
    name: 'Panda Raksasa',
    scientificName: 'Ailuropoda melanoleuca',
    animalClass: 'Mamalia',
    habitat: 'Pegunungan Tiongkok',
    diet: 'Herbivora (Bambu)',
    description:
        'Dikenal dengan bulu hitam-putihnya yang ikonik, panda raksasa menghabiskan sebagian besar hidupnya untuk makan bambu. Mereka adalah simbol konservasi di seluruh dunia.',
    // URL Diperbarui
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Grosser_Panda.JPG/1280px-Grosser_Panda.JPG',
    wikiUrl: 'https://id.wikipedia.org/wiki/Panda_raksasa',
    likes: 230,
  ),
  AnimalModel(
    name: 'Elang Botak',
    scientificName: 'Haliaeetus leucocephalus',
    animalClass: 'Burung',
    habitat: 'Amerika Utara',
    diet: 'Karnivora (Ikan)',
    description:
        'Sebagai simbol nasional Amerika Serikat, elang botak adalah burung pemangsa yang megah dengan kepala dan ekor putih yang kontras dengan tubuh coklatnya.',
    // URL Diperbarui
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/About_to_Land_%28250863643%29.jpeg/1280px-About_to_Land_%28250863643%29.jpeg',
    wikiUrl: 'https://id.wikipedia.org/wiki/Elang_botak',
    likes: 188,
  ),
];

