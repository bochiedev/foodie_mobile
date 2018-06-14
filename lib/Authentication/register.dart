import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final String url = "http://10.0.2.2:9000/account/organization/register/";
 
 
  @override
  Widget build(BuildContext context) {
    return new  Scaffold(
      appBar: new AppBar(
        title: new Text("login"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(10.0),
        child: new TextField(
          decoration: new InputDecoration(
            hintText: "Enter Username"
          ),
        ),
      ),
    );
     
  }
}