import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(new MaterialApp(
    title: "ListView Json Data",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // variabel
  List dataJSON;

  Future<String> ambildata() async {
    final hasil = await http
        .get('https://focussed-thursdays.000webhostapp.com/api/v1/meeting');
    print(hasil.body);

    var json1 = json.decode(hasil.body);

    this.setState(() {
      dataJSON = json1["meetings"];
    });
    print(hasil.body);
  }

  @override
  void initState() {
    this.ambildata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("List Data JSON"),
      ),
      body: new ListView.builder(
        itemCount: dataJSON == null ? 0 : dataJSON.length,
        itemBuilder: (context, i) {
          return new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Card(
              child: new Container(
                padding: new EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      dataJSON[i]['title'],
                      style: new TextStyle(
                          fontSize: 20.0, color: Colors.blue[700]),
                    ),
                    new Padding(
                      padding: EdgeInsets.all(05.0),
                    ),
                    new Text(
                      dataJSON[i]['description'],
                      style: new TextStyle(
                          fontSize: 15.0, color: Colors.green[600]),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
