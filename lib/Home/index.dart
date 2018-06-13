import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final String url = "http://10.0.2.2:9000/account/organization/register/";
  List organizations;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(Uri.encodeFull(url),
        headers: {"content-type": "application/json"});

    print(response.body);

    setState(() {
      var res = json.decode(response.body);
      organizations = res['Organizations'];
      print(organizations);
    });

    return 'Success';
  }

  @override
  Widget build(BuildContext context) {

    var avatar = new CircleAvatar();

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Foodie"),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: new Drawer(
          child: new ListView(
          children: <Widget>[          
            new DrawerHeader(
                child: new Row(
                  children: <Widget>[
                    avatar,
                    new Container(
                      padding: new EdgeInsets.only(left: 50.0),
                     child:  new Text('name'),
                    ),
                    
                    
                  ],
                )),
            new ListTile(
              title: new Text("Organizations"),
              leading: new Icon(Icons.close),
            ),
            new ListTile(
              title: new Text("Orders"),
              leading: new Icon(Icons.close),
            ),
            
            new ListTile(
              title: new Text("Settings"),
              leading: new Icon(Icons.settings),
            ),
            new ListTile(
              title: new Text("Log out"),
              leading: new Icon(Icons.close),
            ),
          ],
        ),
      ),
      body: new ListView.builder(
        itemCount: organizations == null ? 0 : organizations.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
              child: new Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Card(
                  child: new Container(
                    child: new Text(organizations[index]['name']),
                    padding: const EdgeInsets.all(20.0),
                  ),
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}
