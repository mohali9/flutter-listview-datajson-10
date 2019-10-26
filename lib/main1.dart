import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "ListView Json Data",
    home: new Home(
      data: new List<String>.generate(100, (i) => "Ini data ke $i"),
    ),
  ));
}

class Home extends StatelessWidget {

  // variabel data array
  final List<String> data;
  Home({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("ListView Json Data"),
      ),
      body: new Container(
        child: new ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return new ListTile(
              leading: new Icon(Icons.directions_bike),
              title: new Text("${data[index]}"),
            );
          },
        ),
      ),
    );
  }
}

// membuat Listview, dengan menggunakan data Array dan menggunakan data dari JSON File
