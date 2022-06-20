// @dart=2.9

class Locations {
  int id;
  String title;
  String category;
  String description;
  String body;
  String image;

  Locations({
    this.id,
    this.title,
    this.category,
    this.description,
    this.body,
    this.image
  });

  factory Locations.fromJson(Map<String, dynamic> json) {
    return Locations(
        id: int.parse(json['id']),
        title: json['title'],
        category: json['category'],
        description: json['description'],
        body: json['body'],
        image: json['image']
    );
  }
}