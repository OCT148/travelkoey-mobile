// @dart=2.9
import 'package:flutter/material.dart';
import 'package:travelkoey/Models/location_model.dart';
import 'package:travelkoey/Screens/Location/location.dart';
import 'package:travelkoey/Services/services.dart';
import 'package:travelkoey/string_extension.dart';

class Kerajinan extends StatefulWidget {
  Kerajinan() : super();

  @override
  KerajinanState createState() => KerajinanState();
}

class KerajinanState extends State<Kerajinan> {
  Future <List<Locations>> futureLocations;

  @override
  void initState() {
    super.initState();
    futureLocations = Services.getLocations();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height / 5,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.fill,
                image: new AssetImage('assets/images/bannerkerajinan.png'),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder <List<Locations>>(
              future: futureLocations,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Locations> data = snapshot.data.where((c) => c.category == 'kerajinan').toList();
                  return
                    ListView.builder(
                      padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
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
                                              data[index].title,
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
                                              data[index].description,
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
                                            Location(location: data[index])));
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
                                  image: NetworkImage('http://10.0.2.2/travelkoey/storage/app/public/images/${data[index].image}'),
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
                                  data[index].category.capitalize(),
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
                                  if (ModalRoute.of(context)?.settings.name != '/kategori/' + data[index].category.toLowerCase()) {
                                    Navigator.pushNamed(context, '/kategori/' + data[index].category.toLowerCase());
                                  }
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}