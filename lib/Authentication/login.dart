import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final String url = "http://10.0.2.2:9000/api-auth/";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("login"),
      ),
      body: new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(hintText: "Enter Username"),
              ),
               new TextField(
                decoration: new InputDecoration(hintText: "Enter Password"),
              ),
             
            ],
          )),
    );
  }
}
