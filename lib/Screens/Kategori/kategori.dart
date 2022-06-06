import 'package:flutter/material.dart';


class Kategori extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              InkWell(
                child: Container(
                  padding: const EdgeInsets.only(top: 150, left: 10),
                  child: const Text('Wisata Alam', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage('assets/images/alam.jpeg'),
                    ),
                  ),
                ),
                onTap: () => {
                  Navigator.pushNamed(context, '/kategori/alam'),
                },
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.only(top: 150, left: 10),
                  child: const Text('Wisata Edukasi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage('assets/images/edukasi.jpeg'),
                    ),
                  ),
                ),
                onTap: () => {
                  Navigator.pushNamed(context, '/kategori/edukasi'),
                },
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.only(top: 150, left: 10),
                  child: const Text('Wisata Kerajinan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage('assets/images/kerajinan.jpeg'),
                    ),
                  ),
                ),
                onTap: () => {
                  Navigator.pushNamed(context, '/kategori/kerajinan'),
                },
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.only(top: 150, left: 10),
                  child: const Text('Wisata Religi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage('assets/images/religi.jpeg'),
                    ),
                  ),
                ),
                onTap: () => {
                  Navigator.pushNamed(context, '/kategori/religi'),
                },
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.only(top: 150, left: 10),
                  child: const Text('Wisata Sejarah', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage('assets/images/sejarah.jpeg'),
                    ),
                  ),
                ),
                onTap: () => {
                  Navigator.pushNamed(context, '/kategori/sejarah'),
                },
              ),
            ],
          ),
        ),
    );
  }
}