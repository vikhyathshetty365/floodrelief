import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Victimdatapage extends StatefulWidget {
  @override
  _AdmindatapageState createState() => _AdmindatapageState();
}

class _AdmindatapageState extends State<Victimdatapage> {
  CollectionReference users = FirebaseFirestore.instance.collection('victim');

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
                  colors: [Colors.green[200], Colors.blue[200]],
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
                            'First Name:' + document.data()['Firstname'],
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Last Name: ' + document.data()['Lastname'],
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Email:' + document.data()['Email'],
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Address: ' + document.data()['Address'],
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Phone Number:' + document.data()['Phone number'],
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          if (document.data()['Medicine'] != null)
                            Text(
                              'Medicine: ' + document.data()['Medicine'],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                          SizedBox(
                            height: 10.0,
                          ),
                          if (document.data()['Dress'] != null)
                            Text(
                              'Dress: ' + document.data()['Dress'],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                          SizedBox(
                            height: 10.0,
                          ),
                          if (document.data()['Food'] != null)
                            Text(
                              'Food: ' + document.data()['Food'],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                          SizedBox(
                            height: 10.0,
                          ),
                          if (document.data()['Others'] != null)
                            Text(
                              document.data()['Others'],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
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
