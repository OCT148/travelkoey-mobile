// @dart=2.9
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelkoey/Screens/Agenda/agenda_baru.dart';
import 'package:travelkoey/Screens/Kategori/kategori.dart';
import 'package:travelkoey/Screens/Welcome/welcome.dart';
import 'package:travelkoey/Screens/Home/home.dart';
import 'package:travelkoey/Screens/navbar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var id = prefs.getInt('id');
  runApp(MaterialApp(home: id == null ? Welcome() : NavBar()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

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
      home: NavBar(),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => Welcome(),
        '/homepage': (context) => NavBar(),
        '/home': (context) => Home(),
        '/kategori': (context) => Kategori(),
        '/agendas': (context) => Agenda_Baru(),
      },
    );
  }
}

