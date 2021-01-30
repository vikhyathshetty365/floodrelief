import 'package:flood_relief/adddata.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Finalpage.dart';

class VictimFormScreen extends StatefulWidget {
  @override
  _VictimFormScreenState createState() => _VictimFormScreenState();
}

class _VictimFormScreenState extends State<VictimFormScreen> {
  String _Firstname;
  String _Lastname;
  String _Address;
  String _email;
  String _phoneno;
  String _age;
  String _others;
  var _Medicine = ['Paracetamol', 'Cetrizine', 'ORS', 'Insulin', 'Others'];
  var _Food = ['Buiscuit', 'Fruits', 'Groceries', 'Others'];
  var _Dress = ['Topwear', 'Bottomwear', 'Blanket', 'Others'];
  String _currentFood;
  String _currentMedicine;
  String _currentDress;
  QuerySnapshot victim;
  victimMethods crudObj = new victimMethods();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFirstnameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'First Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'First name is required';
        }
      },
      onSaved: (String value) {
        _Firstname = value;
      },
    );
  }

  Widget _buildLastnameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Last Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Last name is required';
        }
      },
      onSaved: (String value) {
        _Lastname = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Email', suffixIcon: Icon(Icons.email)),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'please enter a valid email id';
        }
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildphoneno() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Phoneno', suffixIcon: Icon(Icons.phone)),
      maxLength: 10,
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone no is required';
        }
      },
      onSaved: (String value) {
        _phoneno = value;
      },
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Address', suffixIcon: Icon(Icons.my_location)),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address is required';
        }
      },
      onSaved: (String value) {
        _Address = value;
      },
    );
  }

  Widget _buildage() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Age'),
      maxLength: 3,
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Age is required';
        }
      },
      onSaved: (String value) {
        _age = value;
      },
    );
  }

  Widget _medicine() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Medicine',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        DropdownButton<String>(
          style: TextStyle(color: Colors.blue),
          elevation: 10,
          iconSize: 20,
          hint: Text(
            "Select Medicine",
            style: TextStyle(fontSize: 13),
          ),
          items: _Medicine.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem),
            );
          }).toList(),
          onChanged: (String newValueSelected) {
            setState(() {
              this._currentMedicine = newValueSelected;
            });
          },
          value: _currentMedicine,
        ),
      ],
    );
  }

  Widget _food() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Food',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        DropdownButton<String>(
          style: TextStyle(color: Colors.blue),
          elevation: 10,
          iconSize: 20,
          hint: Text(
            "Select Food",
            style: TextStyle(fontSize: 13),
          ),
          items: _Food.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem),
            );
          }).toList(),
          onChanged: (String newValueSelected) {
            setState(() {
              this._currentFood = newValueSelected;
            });
          },
          value: _currentFood,
        ),
      ],
    );
  }

  Widget _dress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Dress',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        DropdownButton<String>(
          style: TextStyle(color: Colors.blue),
          elevation: 10,
          iconSize: 20,
          hint: Text(
            "Select Dress",
            style: TextStyle(fontSize: 13),
          ),
          items: _Dress.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem),
            );
          }).toList(),
          onChanged: (String newValueSelected) {
            setState(() {
              this._currentDress = newValueSelected;
            });
          },
          value: _currentDress,
        ),
      ],
    );
  }

  Widget _buildother() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Other Items'),
      maxLength: 20,
      onSaved: (String value) {
        _others = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                colors: [Colors.lightBlueAccent[100], Colors.green[200]])),
        child: ListView(children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(24.0),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildFirstnameField(),
                    _buildLastnameField(),
                    _buildEmail(),
                    _buildphoneno(),
                    _buildAddress(),
                    _buildage(),
                    _medicine(),
                    _food(),
                    _dress(),
                    _buildother(),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: RaisedButton(
                        color: Colors.white,
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          } else {
                            _formKey.currentState.save();
                            crudObj.addData({
                              'Firstname': this._Firstname,
                              'Lastname': this._Lastname,
                              'Email': this._email,
                              'Phone number': this._phoneno,
                              'Address': this._Address,
                              'Age': this._age,
                              'Medicine': this._currentMedicine,
                              'Food': this._currentFood,
                              'Dress': this._currentDress,
                              'Others': this._others,
                            }).catchError((e) {
                              print(e);
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Finalpage()),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
