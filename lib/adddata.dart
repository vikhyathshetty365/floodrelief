import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class crudMethods {
  Future<void> addData(donorData) async {
    await FirebaseFirestore.instance
        .collection('donor')
        .add(donorData)
        .catchError((e) {
      print(e);
    });
  }
}

class victimMethods {
  Future<void> addData(donorData) async {
    await FirebaseFirestore.instance
        .collection('victim')
        .add(donorData)
        .catchError((e) {
      print(e);
    });
  }
}

class MapMethods {
  Future<void> addData(MapData) async {
    await FirebaseFirestore.instance
        .collection('location')
        .add(MapData)
        .catchError((e) {
      print(e);
    });
  }
}
