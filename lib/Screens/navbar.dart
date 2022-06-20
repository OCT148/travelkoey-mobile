import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelkoey/Screens/Agenda/agenda_baru.dart';
import 'package:travelkoey/Screens/Home/home.dart';
import 'package:travelkoey/Screens/Kategori/kategori.dart';
import 'package:travelkoey/Screens/Welcome/welcome.dart';
import 'package:travelkoey/Screens/Wishlist/wishlist.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _activePage = 0;
  final List<Widget> _tabItems = [Home(), Kategori(), Agenda_Baru(), Wishlist()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset('assets/images/logo.png',scale: 15,),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          actions: [
            RaisedButton(
              color: Colors.red,
              onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('id');
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Welcome()), (Route<dynamic> route) => false);
            },
            child: Text('Logout', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),

          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          height: 60.0,
          items: <Widget>[
            Container(
              height: 50,
              child: Column(
                children: [Icon(Icons.home, size: 30), Text("Home")],
              ),
            ),
            Container(
              height: 50,
              child: Column(
                children: [Icon(Icons.category, size: 30), Text("Category")],
              ),
            ),
            Container(
              height: 50,
              child: Column(
                children: [Icon(Icons.calendar_month, size: 30), Text("Agenda")],
              ),
            ),
            Container(
              height: 50,
              child: Column(
                children: [Icon(Icons.shopping_cart, size: 30), Text("Wishlist")],
              ),
            ),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.blueAccent.withOpacity(0),
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 1),
          onTap: (index) {
            setState(() {
              _activePage = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: _tabItems[_activePage],
        );
  }
}