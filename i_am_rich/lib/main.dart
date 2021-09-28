import 'package:flutter/material.dart';

//HER ŞEY BÖYLE BAŞLADI…

void main() {
  runApp(new MaterialApp(
    //Scaffold bir layout yapısıdır.Layout yapısı vermeden program çalışmaz.
    debugShowCheckedModeBanner: false,
    home: new Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Image(
          image: AssetImage('images/diamond.png'),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          "Title",
        ),
      ),
    ),
  ));
}
