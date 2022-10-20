import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {

  Color blueDark = Color.fromRGBO(28, 72, 112, 1);
  Color white = Color.fromRGBO(255, 255, 255, 1);
  Color whitelight = Color.fromRGBO(234, 234, 234, 1);
  Color gray = Color.fromRGBO(144, 144, 144, 1);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor : whitelight,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              color: white,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: gray,
                    ),
                    onPressed: (){},
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 70,right: 5),
                      child: Container(
                        child: Text(
                          'شناسه پرونده را وارد کنید',
                          style: TextStyle(
                            color: gray,
                            fontFamily: 'IRANSansFaNum',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
