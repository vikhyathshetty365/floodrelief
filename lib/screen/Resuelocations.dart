import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Resuelocations extends StatefulWidget {
  @override
  _ResuelocationsState createState() => _ResuelocationsState();
}

class _ResuelocationsState extends State<Resuelocations> {
  CollectionReference users = FirebaseFirestore.instance.collection('location');

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
      body: StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return new Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.yellow[200], Colors.yellow[400]],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft),
            ),
            child: new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return Stack(
                  children: [
                    Center(
                      child: new Column(
                        children: [
                          Text(
                            'latitude: ' +
                                document.data()['latitude'].toString(),
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'longitude: ' +
                                document.data()['longitude'].toString(),
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                          SizedBox(
                            height: 10.0,
                            width: 10,
                          ),
                          Divider(
                            color: Colors.black,
                            height: 30,
                            thickness: 5,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
