import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Precautions extends StatefulWidget {
  @override
  _PrecautionsState createState() => _PrecautionsState();
}

class _PrecautionsState extends State<Precautions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Row(
            children: <Widget>[
              Image.asset(
                'lib/img/floodimg.png',
                fit: BoxFit.cover,
                height: 50,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Flood Relief',
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: 25),
              ),
            ],
          ),
        ),
        body: ListView(children: <Widget>[
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('precautions')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text('Loading...'));
              }
              return Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.purple[100], Colors.lightBlue[100]])),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Floods',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 25),
                    ),
                    Text(
                      snapshot.data.documents[0]['Floods'].toString(),
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Resue and Evacuation',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 25),
                    ),
                    Text(
                      snapshot.data.documents[0]['Rescue and evacuation']
                          .toString(),
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Safety and security',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 25),
                    ),
                    Text(
                      snapshot.data.documents[0]['safety and security']
                          .toString(),
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              );
            },
          ),
        ]));
  }
}
