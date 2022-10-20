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
  Color graydot = Color.fromRGBO(183, 183, 183, 1);
  Color grayquestion = Color.fromRGBO(112, 112, 112, 1);
  Color grayinfo = Color.fromRGBO(80, 80, 80, 1);
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              color: white,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        '0iajz4o474',
                        style: TextStyle(
                          color: grayinfo,
                          fontFamily: 'IRANSansFaNum',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 50),
                      Text(
                        'شناسه پرونده ',
                        style: TextStyle(
                          color: grayquestion,
                          fontFamily: 'IRANSansFaNum',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),

                      ),
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: graydot,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        'محمدعلی مراد بیگ زاده',
                        style: TextStyle(
                          color: grayinfo,
                          fontFamily: 'IRANSansFaNum',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 50),
                      Text(
                        'نام مشتری ',
                        style: TextStyle(
                          color: grayquestion,
                          fontFamily: 'IRANSansFaNum',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),

                      ),
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: graydot,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        '09127825671',
                        style: TextStyle(
                          color: grayinfo,
                          fontFamily: 'IRANSansFaNum',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 50),
                      Text(
                        'تلفن همراه',
                        style: TextStyle(
                          color: grayquestion,
                          fontFamily: 'IRANSansFaNum',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),

                      ),
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: graydot,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'شهرک غرب، فاز 4، زرافشان، خیابان شجریان، پلاک 13، واحد 8',
                        style: TextStyle(
                          color: grayinfo,
                          fontFamily: 'IRANSansFaNum',
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'محل بازدید ',
                        style: TextStyle(
                          color: grayquestion,
                          fontFamily: 'IRANSansFaNum',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),

                      ),
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: graydot,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
