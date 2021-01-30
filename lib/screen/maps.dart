import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flood_relief/adddata.dart';

class FireMap extends StatefulWidget {
  @override
  _FireMapState createState() => _FireMapState();
}

class _FireMapState extends State<FireMap> {
  QuerySnapshot Maps;
  MapMethods MapObj = new MapMethods();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Geoflutterfire geo = Geoflutterfire();
  GoogleMapController mapController;
  Location location = new Location();

  void moveBack() {
    Navigator.pop(context);
  }

  _animateToUser() async {
    var pos = await location.getLocation();
    print("Latitude");
    print(pos.latitude);
    print("Longitude");
    print(pos.longitude);
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(pos.latitude, pos.longitude),
      zoom: 17.0,
    )));
    MapObj.addData({
      'latitude': pos.latitude,
      'longitude': pos.longitude,
    });
  }

  CameraPosition _position = _kInitialPosition;
  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(40.7128, -74.0060),
    zoom: 20,
  );

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _updateCameraPosition(CameraPosition position) {
    setState(() {
      _position = position;
    });
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Location recieved"),
      content: Text("You will be helped"),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  List<Marker> allMarkers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(12.9767, 77.5713)));
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(13.1155, 77.6070)));

    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(37.4147848, -122.0853393)));
  }

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
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(40.7128, -74.0060), zoom: 20),
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            mapType: MapType.normal,
            compassEnabled: true,
            onCameraMove: _updateCameraPosition,
            markers: Set.from(allMarkers),
          ),
          Positioned(
              bottom: 50,
              left: 10,
              child: SizedBox(
                height: 65,
                child: FlatButton(
                  onPressed: moveBack,
                  child: Text(
                    'End',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  color: Colors.brown,
                  shape: CircleBorder(),
                ),
              )),
          Positioned(
              bottom: 50,
              right: 5,
              child: SizedBox(
                height: 65,
                child: FlatButton(
                  onPressed: () {
                    _animateToUser();
                    showAlertDialog(context);
                  },
                  child: Text(
                    'SOS',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  color: Colors.brown,
                  shape: CircleBorder(),
                ),
              )),
        ],
      ),
    );
  }
}
