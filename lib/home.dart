import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ifscValidator/details.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart' as alertCustom;

Future<bool> fetchIFSC(String ifscCode) async {
  final response = await http.get('https://ifsc.razorpay.com/' + ifscCode);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //  print('Sab majama che');
    return true;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    //  print('Incorrect IFSC');
    return false;
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController pinCode = TextEditingController();
  TextEditingController pinCode2 = TextEditingController();
  TextEditingController pinCode3 = TextEditingController();
  String currentPin;
  String currentPin2;
  String currentPin3;
  String ifsc;
  final initFocus = FocusNode();
  final focus = FocusNode();
  final focus2 = FocusNode();

  void _onAlertSuccess(context) {
  alertCustom.Alert(
      context: context,
      title: 'IFSC Exists!',
      desc: 'Click "Details" to know more',
      image: Image.network(
          'https://img.icons8.com/fluent/2x/verified-account.png'),
      buttons: [
        alertCustom.DialogButton(
          child: Text('Details'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => Details(ifscCode: ifsc),));
          },
          color: Colors.blue,
        ),
        alertCustom.DialogButton(
          child: Text('Close'),
          onPressed: () => Navigator.pop(context),
          color: Colors.grey,
        )
      ]).show();
}

void _onAlertError(context) {
  alertCustom.Alert(
    context: context,
    title: 'Incorrect IFSC',
    image: Image.network('https://img.icons8.com/color/2x/close-window.png'),
  ).show();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFf050505)
          ),
      child: Form(
          key: _formKey,
          child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 15,
                  vertical: MediaQuery.of(context).size.height / 8),
              children: <Widget>[
                Text(
                  'Enter any IFSC code below',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 32.0,
                      letterSpacing: 2,
                      color: Colors.white),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 12),
                PinCodeTextField(
                  showCursor: false,
                  appContext: context,
                  length: 4,
                  autoFocus: true,
                  focusNode: initFocus,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: TextInputType.text,
                  textStyle: TextStyle(fontSize: 32.0, color: Colors.white),
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      selectedFillColor: Colors.grey[850],
                      fieldHeight: MediaQuery.of(context).size.height / 10,
                      fieldWidth: MediaQuery.of(context).size.width / 6.5,
                      selectedColor: Colors.green[400],
                      inactiveColor: Colors.transparent,
                      activeColor: Colors.transparent,
                      activeFillColor: Colors.grey[900],
                      inactiveFillColor: Colors.grey[400].withOpacity(0.2)),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  controller: pinCode,
                  onCompleted: (v) {
                    print("Pin: " + v);
                    FocusScope.of(context).requestFocus(focus);
                  },
                  onChanged: (value) {
                    setState(() {
                      currentPin = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    return true;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                PinCodeTextField(
                  showCursor: false,
                  autoDismissKeyboard: false,
                  appContext: context,
                  focusNode: focus,
                  length: 4,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  textStyle: TextStyle(fontSize: 32.0, color: Colors.white),
                  animationType: AnimationType.slide,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      selectedFillColor: Colors.grey[850],
                      fieldHeight: MediaQuery.of(context).size.height / 10,
                      fieldWidth: MediaQuery.of(context).size.width / 6.5,
                      selectedColor: Colors.greenAccent[400],
                      inactiveColor: Colors.transparent,
                      activeColor: Colors.transparent,
                      activeFillColor: Colors.grey[900],
                      inactiveFillColor: Colors.grey[400].withOpacity(0.2)),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  controller: pinCode2,
                  onCompleted: (v) {
                    print("Pin: " + v);
                    FocusScope.of(context).requestFocus(focus2);
                  },
                  onChanged: (value) {
                    setState(() {
                      currentPin2 = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    return true;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 10),
                  child: PinCodeTextField(
                    showCursor: false,
                    validator: (val) => val.length < 2 ? '' : null,
                    appContext: context,
                    focusNode: focus2,
                    length: 3,
                    keyboardType: TextInputType.number,
                    textStyle: TextStyle(fontSize: 32.0, color: Colors.white),
                    animationType: AnimationType.slide,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        selectedFillColor: Colors.grey[850],
                        fieldHeight: MediaQuery.of(context).size.height / 10,
                        fieldWidth: MediaQuery.of(context).size.width / 6.5,
                        selectedColor: Colors.greenAccent[400],
                        inactiveColor: Colors.transparent,
                        activeColor: Colors.transparent,
                        activeFillColor: Colors.grey[900],
                        inactiveFillColor: Colors.grey[400].withOpacity(0.2)),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    controller: pinCode3,
                    onCompleted: (v) {
                      print("Pin: " + v);
                    },
                    onChanged: (value) {
                      setState(() {
                        currentPin3 = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      return true;
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height / 50,
                      horizontal: MediaQuery.of(context).size.width / 25),
                  child: RaisedButton(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 40,
                        vertical: MediaQuery.of(context).size.height / 50),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        ifsc = currentPin + currentPin2 + currentPin3;
                        dynamic result = await fetchIFSC(ifsc);
                        pinCode.clear();
                        pinCode2.clear();
                        pinCode3.clear();
                        if (result) {
                          _onAlertSuccess(context);
                        } else {
                          _onAlertError(context);
                        }
                        FocusScope.of(context).requestFocus(initFocus);
                      }
                    },
                    color: Colors.blueAccent[700],
                    textColor: Colors.white,
                    child: Text("Check", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400)),
                  ),
                ),
              ])),
    );
  }
}

