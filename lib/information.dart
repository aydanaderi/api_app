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
      backgroundColor : white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(84),
        child: AppBar(
          backgroundColor: blueDark,
          title: Center(
            child: Text(
              'پرونده های من',
              style: TextStyle(
                color: white,
                fontFamily: 'IRANSansFaNum',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.menu
              ),
              color: white,
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}
