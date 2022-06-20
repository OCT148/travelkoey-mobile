//@dart=2.9
import 'package:travelkoey/Services/services.dart';

void main() {
  Get();
}
Get() {
  Services.getWishlists().then((locations) {
    print(locations.length);
  });
}
