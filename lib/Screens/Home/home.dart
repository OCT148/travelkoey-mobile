// @dart=2.9
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travelkoey/Models/location_model.dart';
import 'package:travelkoey/Screens/Location/location.dart';
import 'package:travelkoey/Services/services.dart';
import 'package:travelkoey/string_extension.dart';

class Home extends StatefulWidget {
  Home() : super();

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Future <List<Locations>> futureLocations;

  @override
  void initState() {
    super.initState();
    futureLocations = Services.getLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder <List<Locations>>(
          future: futureLocations,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Locations> data = snapshot.data;
              return
                CarouselSlider.builder(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: true,
                  ),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                      InkWell(
                        child: Container (
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Stack(
                              children: [
                                Image(width: 1050,
                                  height: 350,
                                  image: NetworkImage('http://10.0.2.2/travelkoey/storage/app/public/images/${data[itemIndex].image}'),
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: 0,
                                  right: 5,
                                  child: TextButton(
                                    child: Text(data[itemIndex].category.capitalize(), style: TextStyle(fontSize: 14),),
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 5, vertical: 5)),
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                                    ),
                                    onPressed: () {
                                      if (ModalRoute.of(context)?.settings.name != '/kategori/' + data[itemIndex].category.toLowerCase()) {
                                        Navigator.pushNamed(context, '/kategori/' + data[itemIndex].category.toLowerCase());
                                      }},
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left:10, bottom: 10),
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 1050,
                                        child: Text(
                                          data[itemIndex].title,
                                          style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 1050,
                                        child: Text(
                                          data[itemIndex].description,
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                      Location(location: data[itemIndex])));
                        },
                      ),
                );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}