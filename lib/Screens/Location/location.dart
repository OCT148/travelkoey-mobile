// @dart=2.9
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelkoey/Models/location_model.dart';
import 'package:travelkoey/Models/wishlist_model.dart';
import 'package:travelkoey/Services/services.dart';
import 'package:travelkoey/string_extension.dart';

class Location extends StatefulWidget {
  const Location({Key key, this.location}) : super(key: key);
  final Locations location;

  @override
  LocationState createState() => LocationState();
}

class LocationState extends State<Location> {
  Locations location;
  Future<List<Wishlists>> futureWishlists;
  bool wishlistState = false;
  var user;

  @override
  void initState() {
    super.initState();
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

  Widget _button1() {
    return TextButton(
      child: Text(
        'Add to Wishlist',
        style: TextStyle(fontSize: 14),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
      onPressed: () {
        Services.addWishlist(user.toString(), widget.location.id.toString())
            .then((result) {
          if ('success' == result) {
            setState(() {
              wishlistState = true;
              Navigator.of(context).pop();
            });
            print("SUCCESS");
          } else {
            print("FAILED");
          }
        });
      },
    );
  }

  Widget _button2(String id) {
    return TextButton(
      child: Text(
        'Remove from Wishlist',
        style: TextStyle(fontSize: 14),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
      onPressed: () {
        Services.deleteWishlist(id).then((result) {
          if ('success' == result) {
            setState(() {
              wishlistState = false;
              Navigator.of(context).pop();
            });
            print("SUCCESS");
          } else {
            print("FAILED");
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var document = parse(widget.location.body);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: size.height / 3,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'http://10.0.2.2/travelkoey/storage/app/public/images/${widget.location.image}'),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text(
                          widget.location.category.capitalize(),
                          style: TextStyle(fontSize: 14),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.orange),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                        ),
                        onPressed: () {
                          if (ModalRoute.of(context)?.settings?.name !=
                              '/kategori/' +
                                  widget.location.category.toLowerCase()) {
                            Navigator.pushNamed(
                                context,
                                '/kategori/' +
                                    widget.location.category.toLowerCase());
                          }
                        },
                      ),
                      Container(
                        width: size.width,
                        child: Text(
                          widget.location.title,
                          style: TextStyle(
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        width: size.width,
                        child: Text(
                          widget.location.description,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5),
              child: FutureBuilder<List<Wishlists>>(
                future: futureWishlists,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Wishlists> data =
                        snapshot.data.where((c) => c.user_id == user).toList();
                    var idx = 0;
                    int id;
                    if (data.length > 0) {
                      while (idx < data.length) {
                        if (data[idx].location_id == widget.location.id) {
                          wishlistState = true;
                          id = data[idx].id;
                          break;
                        } else {
                          wishlistState = false;
                        }
                        idx = idx + 1;
                      }
                    }
                    return TextButton(
                      child:
                          wishlistState ? _button2(id.toString()) : _button1(),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: Text(document.body.text),
            ),
          ],
        ),
      ),
    );
  }
}
