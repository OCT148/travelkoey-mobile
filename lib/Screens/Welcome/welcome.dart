import 'package:flutter/material.dart';
import 'package:travelkoey/Screens/SignIn/signin.dart';
import 'package:travelkoey/Screens/SignUp/signup.dart';

class Welcome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: new AssetImage('assets/images/welcome.png'),
          ),
        ),
        child: Column(
            children: <Widget>[
              Container(
                height: size.height / 2,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Halo selamat datang",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Tempat wisata yang kamu inginkan ada disini",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Daftar sekarang gratis",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child:Stack(
                  children: <Widget>[
                    Container(
                      width: size.width,
                      height: size.height / 2,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: (
                          Image.asset('assets/images/logo.png', scale: 8)
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 30,left: size.width / 2.55),
                          child:
                          TextButton(
                              child: Text(
                                "Sign in",
                                style: TextStyle(fontSize: 16),
                              ),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 25, vertical: 10)),
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      )
                                  )
                              ),
                            onPressed: () => {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn())),
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10,left: size.width / 2.55),
                          child:
                          TextButton(
                              child: Text(
                                "Sign up",
                                style: TextStyle(fontSize: 16),
                              ),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 22, vertical: 10)),
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      )
                                  )
                              ),
                              onPressed: () => {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp())),
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}