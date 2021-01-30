import 'package:flood_relief/screen/notorderdtoevacuate.dart';
import 'package:flood_relief/screen/orderedtoevacuate.dart';
import 'package:flood_relief/screen/precautions.dart';
import 'package:flood_relief/screen/preparingforfood.dart';
import 'package:flood_relief/screen/preparingtoevacuate.dart';
import 'package:flutter/material.dart';

class prec extends StatelessWidget {
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
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple[100], Colors.lightBlue[100]])),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
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
                    MaterialPageRoute(builder: (context) => Precautions()),
                  );
                },
                child: Text(
                  'Precautions',
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
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
                    MaterialPageRoute(builder: (context) => preparingforfood()),
                  );
                },
                child: Text(
                  'Preparing for flood',
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
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
                        builder: (context) => preparingtoevacuate()),
                  );
                },
                child: Text(
                  'Preparing to evacuate',
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
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
                        builder: (context) => orderedtoevacuate()),
                  );
                },
                child: Text(
                  'If you are ordered to evacuate',
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
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
                        builder: (context) => notorderedtoevacuate()),
                  );
                },
                child: Text(
                  'If you are not ordered to evacuate',
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
