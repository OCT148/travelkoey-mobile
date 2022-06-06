import 'package:flutter/material.dart';
import 'package:travelkoey/Models/location_model.dart';

class Alam extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var locations = Locations.fetchAll().where((c) => c.category == 'Alam').toList();
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height / 5,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.fill,
                image: new AssetImage('assets/images/banneralam.png'),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: locations.length,
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
                                      locations[index].title,
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
                                      locations[index].description,
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
                        Navigator.pushNamed(context, '/location', arguments: locations[index].id);
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
                          image: AssetImage(
                              locations[index].image
                          ),
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
                          locations[index].category,
                          style: TextStyle(fontSize: 14),
                        ),style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5)),
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                        onPressed: () {
                          if (ModalRoute.of(context)?.settings?.name != '/kategori/' + locations[index].category.toLowerCase()) {
                            Navigator.pushNamed(context, '/kategori/' + locations[index].category.toLowerCase());
                          }
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}