import 'package:flutter/material.dart';
import 'package:travelkoey/Screens/Agenda/agenda_baru.dart';
import 'package:travelkoey/Screens/Kategori/kategori.dart';
import 'package:travelkoey/Screens/Location/location.dart';
import 'package:travelkoey/Screens/Welcome/welcome.dart';
import 'package:travelkoey/Screens/SignIn/signin.dart';
import 'package:travelkoey/Screens/SignUp/signup.dart';
import 'package:travelkoey/Screens/Home/home.dart';
import 'package:travelkoey/Screens/Kategori/alam.dart';
import 'package:travelkoey/Screens/Kategori/edukasi.dart';
import 'package:travelkoey/Screens/Kategori/kerajinan.dart';
import 'package:travelkoey/Screens/Kategori/religi.dart';
import 'package:travelkoey/Screens/Kategori/sejarah.dart';
import 'package:travelkoey/Screens/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travelkoey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Welcome(),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => Welcome(),
        '/signin': (context) => SignIn(),
        '/signup': (context) => SignUp(),
        '/homepage': (context) => NavBar(),
        '/home': (context) => Home(),
        '/kategori': (context) => Kategori(),
        '/kategori/alam': (context) => Alam(),
        '/kategori/edukasi': (context) => Edukasi(),
        '/kategori/kerajinan': (context) => Kerajinan(),
        '/kategori/religi': (context) => Religi(),
        '/kategori/sejarah': (context) => Sejarah(),
        '/location': (context) => Location(),
        '/agendas': (context) => Agenda_Baru(),
      },
    );
  }
}

