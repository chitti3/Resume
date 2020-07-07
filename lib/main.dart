import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Dash_board.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  bool _isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  signIn(String email, String password) async {
    print(email + "" + password);
    Map data = {'email': email, 'password': password, 'remember_me': "0"};
    var response = await http.post(
        "https://resumemaster.in/demo/support/api/v1/login",
        headers: {"Accept": "Application/json"},
        body: data);
    var daaata = jsonDecode(response.body);
    print(daaata);
    if (daaata.containsKey('status')) {
      if (daaata['status'] == 1) {
        print("Login Success");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dash()),
        );
      } else {
        print("Login failed");
      }
    } else {
      print("Login failed");
    }
//    if (response.statusCode == 200) {
//      jsonResponse = js.body;
//      if (jsonResponse != null) {
//        setState(() {
//          _isLoading = false;
//        });
//      }
//    } else {
//      print(response.body);
//    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assests/login.PNG",
                  ),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                    child: Text(
                      'Log in to ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'Poppins'),
                    )),
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      'your Account',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.lightBlue,
                          fontFamily: 'Poppins'),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            left: 0), // add padding to adjust icon
                        child: Icon(
                          Icons.person,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            left: 0), // add padding to adjust icon
                        child: Icon(
                          Icons.vpn_key,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style:
                        TextStyle(color: Colors.lightBlue, fontFamily: 'Tail'),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(250, 0, 10, 0),
                    width: 0.0,
                    height: 40.0,
                    child: RaisedButton(
                      elevation: 5.0,
                      textColor: Colors.white,
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.lightBlue)),
                      child: IconButton(
                        icon: Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _isLoading = true;
                        });
                        signIn(nameController.text, passwordController.text);
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Dont have an account?',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 20.0,
                            ),
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )));
  }
}
