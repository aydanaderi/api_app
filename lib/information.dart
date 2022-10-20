import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {

  Color blueDark = Color.fromRGBO(28, 72, 112, 1);
  Color white = Color.fromRGBO(255, 255, 255, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueDark,
        title: Text(
          'پرونده های من',
          style: TextStyle(
            color: white,
            fontFamily: 'IRANSansFaNum',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
