import 'package:flutter/material.dart';
import 'package:travelkoey/Models/location_model.dart';

class Location extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final location = Locations.fetchAll().where((c) => c.id == id).first;

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
                  image: DecorationImage(fit: BoxFit.fill,
                    image: AssetImage(location.image),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left:10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text(location.category, style: TextStyle(fontSize: 14),),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                        ),
                        onPressed: () {
                          if (ModalRoute.of(context)?.settings?.name != '/kategori/' + location.category.toLowerCase()) {
                            Navigator.pushNamed(context, '/kategori/' + location.category.toLowerCase());
                          }
                        },
                      ),
                      Container(
                        width: size.width,
                        child: Text(
                          location.title,
                          style: TextStyle(
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      ),
                      Container(
                        width: size.width,
                        child: Text(
                          location.description,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(location.body),
            ),
          ],
        ),
      ),
    );
  }
}