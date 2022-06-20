// @dart=2.9
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelkoey/Models/location_model.dart';
import 'package:travelkoey/Models/wishlist_model.dart';
import 'package:travelkoey/Screens/Location/location.dart';
import 'package:travelkoey/Services/services.dart';
import 'package:travelkoey/string_extension.dart';

class Wishlist extends StatefulWidget {
  Wishlist() : super();

  @override
  WishlistState createState() => WishlistState();
}

class WishlistState extends State<Wishlist> {
  Future <List<Wishlists>> futureWishlists;
  Future <List<Locations>> futureLocations;
  var user;

  @override
  void initState() {
    super.initState();
    futureLocations = Services.getLocations();
    futureWishlists = Services.getWishlists();
    _getPref().then((result) {
      user = result;
    });
  }

  _getPref() async {
    final prefs = await SharedPreferences.getInstance();
    final value = await prefs.getInt('id') ?? 0;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder <List<Wishlists>>(
              future: futureWishlists,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Wishlists> data = snapshot.data.where((c) => c.user_id == user).toList();
                  return
                    ListView.builder(
                      padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FutureBuilder <List<Locations>>(
                          future: futureLocations,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<Locations> locations = snapshot.data.toList();
                              return
                                Stack(
                                  children: <Widget>[
                                    InkWell(
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                                        height: 150.0,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    width: 120.0,
                                                    child: Text(
                                                      locations[data[index].location_id].title,
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 120.0,
                                                    child: Text(
                                                      locations[data[index].location_id].description,
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Location(location: locations[data[index].location_id])));
                                      },
                                    ),
                                    Positioned(
                                      left: 20.0,
                                      top: 15.0,
                                      bottom: 15.0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0),
                                        child: Image(
                                          width: 100.0,
                                          image: NetworkImage('http://10.0.2.2/travelkoey/storage/app/public/images/${locations[data[index].location_id].image}'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 300.0,
                                      top: 25.0,
                                      right: 25.0,
                                      bottom: 100.0,
                                      child: TextButton(
                                        child: Text(
                                          locations[data[index].location_id].category.capitalize(),
                                          style: TextStyle(fontSize: 14),
                                        ),style: ButtonStyle(
                                          padding: MaterialStateProperty.all<EdgeInsets>(
                                              const EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5)),
                                          foregroundColor:
                                          MaterialStateProperty.all<Color>(Colors.white),
                                          backgroundColor:
                                          MaterialStateProperty.all<Color>(Colors.orange),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ))),
                                        onPressed: () {
                                          if (ModalRoute.of(context)?.settings.name != '/kategori/' + locations[data[index].location_id].category.toLowerCase()) {
                                            Navigator.pushNamed(context, '/kategori/' + locations[data[index].location_id].category.toLowerCase());
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return CircularProgressIndicator();
                          },
                        );
                      },
                    );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}

