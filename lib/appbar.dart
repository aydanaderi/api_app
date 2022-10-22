import 'package:flutter/material.dart';

class AppBars extends AppBar{

  AppBars():super(

    backgroundColor: Color.fromRGBO(28, 72, 112, 1),
    title: Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        'پرونده های من',
        style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1),
          fontFamily: 'IRANSansFaNum',
          fontSize: 18,
        ),
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(25),
      ),
    ),
    actions: [
      Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
          icon: Icon(
              Icons.menu
          ),
          color: Color.fromRGBO(255, 255, 255, 1),
          onPressed: (){},
        ),
      ),
    ],
  );
}