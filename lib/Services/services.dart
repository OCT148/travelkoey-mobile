import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travelkoey/Models/daftar_agenda.dart';
import 'package:travelkoey/Models/location_model.dart';
import 'package:travelkoey/Models/user_model.dart';
import 'package:travelkoey/Models/wishlist_model.dart';

class Services {
  static const ROOT = 'http://10.0.2.2/travelkoeyDB/database_actions.php';
  static const _LOGIN_ACTION = 'LOGIN';
  static const _GET_LOCATIONS_ACTION = 'GET_LOCATIONS';
  static const _GET_USERS_ACTION = 'GET_USERS';
  static const _GET_WISHLISTS_ACTION = 'GET_WISHLISTS';
  static const _ADD_USER_ACTION = 'ADD_USER';
  static const _ADD_WISHLIST_ACTION = 'ADD_WISHLIST';
  static const _DELETE_WISHLIST_ACTION = 'DELETE_WISHLIST';
  static const _GET_AGENDA_ACTION = 'GET_AGENDA';

  static Future<String> login(String email, String password) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _LOGIN_ACTION;
      map['email'] = email;
      map['password'] = password;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Login Response: ${response.body}');
      if (200 == response.statusCode) {
        if ('ERROR' != '${response.body}') {
          return response.body;
        } else {
          return "error";
        }
      } else {
        return "error";
      }
    } catch (e, stackTrace) {
      throw Exception('$stackTrace');
    }
  }

  static Future<List<Locations>> getLocations() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_LOCATIONS_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('getLocations Response: ${response.body}');
      if (response.statusCode == 200) {
        List<Locations> list = parseResponseLocations(response.body);
        return list;
      } else {
        return <Locations>[];
      }
    } catch (e, stackTrace) {
      throw Exception('$stackTrace');
    }
  }

  static Future<List<Users>> getUsers() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_USERS_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('getUsers Response: ${response.body}');
      if (response.statusCode == 200) {
        List<Users> list = parseResponseUsers(response.body);
        return list;
      } else {
        return <Users>[];
      }
    } catch (e, stackTrace) {
      throw Exception('$stackTrace');
    }
  }

  static Future<List<Wishlists>> getWishlists() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_WISHLISTS_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('getWishlists Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Wishlists> list = parseResponseWishlists(response.body);
        return list;
      } else {
        return <Wishlists>[];
      }
    } catch (e, stackTrace) {
      throw Exception('$stackTrace');
    }
  }

  static List<Locations> parseResponseLocations(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Locations>((json) => Locations.fromJson(json)).toList();
  }

  static List<Users> parseResponseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Users>((json) => Users.fromJson(json)).toList();
  }

  static List<Wishlists> parseResponseWishlists(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Wishlists>((json) => Wishlists.fromJson(json)).toList();
  }

  static List<Agenda> parseResponseAgenda(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Agenda>((json) => Agenda.fromJson(json)).toList();
  }

  static Future<String> addUser(
      String name, String email, String password) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_USER_ACTION;
      map['name'] = name;
      map['email'] = email;
      map['password'] = password;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('addUser Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e, stackTrace) {
      throw Exception('$stackTrace');
    }
  }

  static Future<String> addWishlist(String user_id, String location_id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_WISHLIST_ACTION;
      map['user_id'] = user_id;
      map['location_id'] = location_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print(response.statusCode);
      print('addWishlist Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e, stackTrace) {
      throw Exception('$stackTrace');
    }
  }

  static Future<String> deleteWishlist(String id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _DELETE_WISHLIST_ACTION;
      map['id'] = id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('deleteWishlist Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e, stackTrace) {
      throw Exception('$stackTrace');
    }
  }

  static Future<List<Agenda>> getAgenda() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_AGENDA_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('getAgenda Response: ${response.body}');
      if (response.statusCode == 200) {
        List<Agenda> list = parseResponseAgenda(response.body);
        return list;
      } else {
        return <Agenda>[];
      }
    } catch (e, stackTrace) {
      throw Exception('$stackTrace');
    }
  }
}
