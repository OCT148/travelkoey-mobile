import 'package:flutter/material.dart';
import 'package:travelkoey/Screens/Welcome/welcome.dart';

class SignUp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
          children: <Widget>[
            Container(
              height: size.height / 2,
              width: size.width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Buat Akun",
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Atau gunakan email untuk registrasi akun",
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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage('assets/images/register.png'),
                      ),
                    ),
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
                        margin: EdgeInsets.only(top: 30,left: size.width / 10),
                        height: 36,
                        width: size.width / 1.25,
                        color: Colors.black12,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Email",
                            contentPadding: EdgeInsets.only(left: 16.0, bottom: 10),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30,left: size.width / 10),
                        height: 36,
                        width: size.width / 1.25,
                        color: Colors.black12,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Password",
                            contentPadding: EdgeInsets.only(left: 16.0, bottom: 10),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30,left: size.width / 10),
                        child:
                        TextButton(
                            child: Text(
                              "Sign up",
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 25, vertical: 10  )),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    )
                                )
                            ),
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Welcome()
                                ),
                              ),
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
    );
  }
}