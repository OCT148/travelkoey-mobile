// @dart=2.9
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelkoey/Models/user_model.dart';
import 'package:travelkoey/Screens/navbar.dart';
import 'package:travelkoey/Services/services.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  _login() {
    Services.login(_emailController.text, _passwordController.text).then((result) async {
      if ('error' != result) {
        List<Users> list = Services.parseResponseUsers(result);
        var id = list[0].id;
        print(id);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('id', id);
        _clearValues();
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => NavBar()), (Route<dynamic> route) => false);
      } else {
        print("NOT FOUND");
      }
    });
  }

  _clearValues() {
    _emailController.text = '';
    _passwordController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Container(
                height: size.height / 2,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: new AssetImage('assets/images/register.png'),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Sign in",
                        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Sudah punya akun? Gunakan akun anda",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: size.width,
                      height: size.height / 2,
                      color: Colors.white,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: (Image.asset('assets/images/logo.png', scale: 8)),
                    ),
                    Center(
                      child:Form(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              height: 36,
                              width: size.width / 1.25,
                              color: Colors.black12,
                              child: TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  hintText: "Email",
                                  contentPadding: EdgeInsets.only(left: 16.0, bottom: 10),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              height: 36,
                              width: size.width / 1.25,
                              color: Colors.black12,
                              child: TextFormField(
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                  hintText: "Password",
                                  contentPadding: EdgeInsets.only(left: 16.0, bottom: 10),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 30),
                                child: TextButton(
                                    child: const Text(
                                      "Sign in",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all<EdgeInsets>(
                                          const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
                                    ),
                                    onPressed: () => {
                                      _login(),
                                    })
                            )
                          ],
                        ),
                      ),
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