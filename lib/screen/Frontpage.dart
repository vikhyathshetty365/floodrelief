import 'package:flood_relief/screen/adminloginpage.dart';
import 'package:flood_relief/screen/donorform.dart';
import 'package:flood_relief/screen/maps.dart';
import 'package:flood_relief/screen/prec.dart';
import 'package:flood_relief/screen/victimform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class frontPage extends StatefulWidget {
  @override
  _frontPageState createState() => _frontPageState();
}

class _frontPageState extends State<frontPage> {
  BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
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
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.supervised_user_circle),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                })
          ],
        ),
        body: ListView(children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.purple[100], Colors.lightBlue[100]])),
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  OutlineButton(
                    borderSide: BorderSide(
                      color: Colors.red, //Color of the border
                      style: BorderStyle.solid, //Style of the border
                      width: 4, //width of the border
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => prec()),
                      );
                    },
                    child: Text(
                      'Precautions and measures',
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  MaterialButton(
                    autofocus: true,
                    height: 200,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FireMap()),
                      );
                    },
                    color: Colors.brown,
                    textColor: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'SOS',
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '(Click once the SOS button\n on the map so your\n location is detected.)',
                          style: TextStyle(fontSize: 12.5, color: Colors.white),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  OutlineButton(
                    highlightColor: Colors.blue,
                    borderSide: BorderSide(
                      color: Colors.red, //Color of the border
                      style: BorderStyle.solid, //Style of the border
                      width: 4, //width of the border
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VictimFormScreen()),
                      );
                    },
                    child: Text(
                      'Victim',
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  OutlineButton(
                    highlightColor: Colors.blue,
                    borderSide: BorderSide(
                      color: Colors.red, //Color of the border
                      style: BorderStyle.solid, //Style of the border
                      width: 4, //width of the border
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DonorFormScreen()),
                      );
                    },
                    child: Text(
                      'Donor',
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
