import 'package:flutter/material.dart';

class firstscreen extends StatefulWidget {
  @override
  _firstscreenState createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Welcome"
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "Welcome to the form",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.green,
                fontFamily: "Cursive",
              ),
            ),
            Padding(
                    padding: EdgeInsets.all(20.0) ,
              child: FlatButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                color: Colors.green,
                textColor: Colors.white,
                child: Text(
                    "Go Back",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
