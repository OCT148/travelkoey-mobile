class Locations {
  int id;
  String title;
  String category;
  String description;
  String body;
  String image;

  Locations({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.body,
    required this.image,
  });

  static List<Locations> fetchAll() {
    return [
      Locations(
          id: 1,
          title: 'Lokasi alam',
          category: 'Alam',
          description: 'Kota A',
          body: 'Lokasi berada di kota A',
          image: 'assets/images/alam.jpeg'),
      Locations(
          id: 2,
          title: 'Lokasi kerajinan',
          category: 'Kerajinan',
          description: 'Kota B',
          body: 'Lokasi berada di kota B',
          image: 'assets/images/kerajinan.jpeg'),
      Locations(
          id: 3,
          title: 'Lokasi sejarah',
          category: 'Sejarah',
          description: 'Kota C',
          body: 'Lokasi berada di kota C',
          image: 'assets/images/sejarah.jpeg'),
    ];
  }
}