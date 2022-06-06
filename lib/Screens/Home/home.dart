import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travelkoey/Models/location_model.dart';


class Home extends StatelessWidget {
  var locations = Locations.fetchAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider.builder(
          options: CarouselOptions(
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlay: true,
          ),
          itemCount: locations.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              InkWell(
                child: Container (
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Stack(
                      children: [
                        Image(width: 1050,
                          height: 350,
                          image: AssetImage(
                              locations[itemIndex].image
                          ),
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 0,
                          right: 5,
                          child: TextButton(
                            child: Text(locations[itemIndex].category, style: TextStyle(fontSize: 14),),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                            ),
                            onPressed: () {
                              if (ModalRoute.of(context)?.settings?.name != '/kategori/' + locations[itemIndex].category.toLowerCase()) {
                                Navigator.pushNamed(context, '/kategori/' + locations[itemIndex].category.toLowerCase());
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
                                    locations[itemIndex].title,
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
                                    locations[itemIndex].description,
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
                  Navigator.pushNamed(context, '/location', arguments: locations[itemIndex].id);
                },
              ),
        ),
      ),
    );
  }
}