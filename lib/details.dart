import 'package:flutter/material.dart';
import 'package:ifscValidator/model/ifsc.dart';
import 'package:ifscValidator/services/fetchDetails.dart';

class Details extends StatefulWidget {
  final String ifscCode;

  const Details({Key key, this.ifscCode}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  Future<IfscFetch> futureIfsc;

  @override
  void initState() {
    super.initState();
    futureIfsc = fetchDetails(widget.ifscCode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('IFSC Details', style: TextStyle(color: Colors.green),),
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 5,
          leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.green), onPressed: () => Navigator.of(context).pop()),
        ),
        body: FutureBuilder<IfscFetch>(
          future: futureIfsc,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                children: [
                  Text('City: ${snapshot.data.cITY}', 
                  style: TextStyle(color: Colors.green, fontSize: 24.0, fontFamily: 'Raleway'),),
                  SizedBox(height: 20),
                  Text('Branch: ${snapshot.data.bRANCH}', 
                  style: TextStyle(color: Colors.green, fontSize: 24.0),),
                  SizedBox(height: 20),
                  Text('District: ${snapshot.data.dISTRICT}', 
                  style: TextStyle(color: Colors.green, fontSize: 24.0),),
                  SizedBox(height: 20),
                  Text('Address: ${snapshot.data.aDDRESS}', 
                  style: TextStyle(color: Colors.green, fontSize: 24.0),),
                  SizedBox(height: 20),
                  Text('UPI: ${snapshot.data.uPI}', 
                  style: TextStyle(color: Colors.green, fontSize: 24.0),),
                  SizedBox(height: 20),
                  Text('State: ${snapshot.data.sTATE}', 
                  style: TextStyle(color: Colors.green, fontSize: 24.0),),
                  SizedBox(height: 20),
                  Text('Bank: ${snapshot.data.bANK}', 
                  style: TextStyle(color: Colors.green, fontSize: 24.0),),
                  SizedBox(height: 20),
                  Text('Contact: ${snapshot.data.cONTACT}', 
                  style: TextStyle(color: Colors.green, fontSize: 24.0),),
                  SizedBox(height: 20),
                  Text('Bank Code: ${snapshot.data.bANKCODE}', 
                  style: TextStyle(color: Colors.green, fontSize: 24.0),),
                  SizedBox(height: 20),
                  Text('IMPS: ${snapshot.data.iMPS}', 
                  style: TextStyle(color: Colors.green, fontSize: 24.0),),
                  SizedBox(height: 20),
                  Text('NEFT: ${snapshot.data.nEFT}', 
                  style: TextStyle(color: Colors.green, fontSize: 24.0),),
                  SizedBox(height: 20),
                  Text('RTGS: ${snapshot.data.rTGS}', 
                  style: TextStyle(color: Colors.green, fontSize: 24.0),),
                  SizedBox(height: 20),
                  Text('IFSC: ${snapshot.data.iFSC}', 
                  style: TextStyle(color: Colors.green, fontSize: 24.0),),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          }
          ),
      ),
    );
  }
}