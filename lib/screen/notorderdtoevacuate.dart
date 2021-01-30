import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class notorderedtoevacuate extends StatelessWidget {
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
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('If you are not ordered to evacuate')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text('Loading...'));
          }
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.purple[100], Colors.lightBlue[100]])),
            child: ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot mypost = snapshot.data.documents[index];
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'If you are not ordered to evacuate',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '1)${mypost['1']}\n',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 18),
                        ),
                        Text(
                          '2)${mypost['2']}\n',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 18),
                        ),
                      ],
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
