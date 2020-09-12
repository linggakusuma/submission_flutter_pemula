import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_flutter_pemula/model/cupang.dart';

class DetailScreen extends StatelessWidget {
  final Cupang cupang;

  DetailScreen({@required this.cupang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(cupang.imageUrl),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.all(16),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.end,
                  spacing: 16,
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Text(
                      cupang.name,
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      cupang.price,
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                      textAlign: TextAlign.right,
                    )
                  ],
                )),
            Container(
                margin: EdgeInsets.all(16),
                child: Text(
                  cupang.description,
                  style: TextStyle(fontSize: 20.0),
                )),
          ],
        ),
      ),
    );
  }
}
