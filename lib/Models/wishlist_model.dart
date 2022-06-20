// @dart=2.9

class Wishlists {
  int id;
  int user_id;
  int location_id;

  Wishlists({
    this.id,
    this.user_id,
    this.location_id
  });

  factory Wishlists.fromJson(Map<String, dynamic> json) {
    return Wishlists(
      id: int.parse(json['id']),
      user_id: int.parse(json['user_id']),
      location_id: int.parse(json['location_id'])
    );
  }
}