import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'api.dart';

class InformationPage extends StatefulWidget {

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> with TickerProviderStateMixin{

  Color blueDark = Color.fromRGBO(28, 72, 112, 1);
  Color white = Color.fromRGBO(255, 255, 255, 1);
  Color whitelight = Color.fromRGBO(234, 234, 234, 1);
  Color gray = Color.fromRGBO(144, 144, 144, 1);
  Color graydot = Color.fromRGBO(183, 183, 183, 1);
  Color grayquestion = Color.fromRGBO(112, 112, 112, 1);
  Color grayinfo = Color.fromRGBO(80, 80, 80, 1);
  Color whitecontainer = Color.fromRGBO(246, 246, 248, 1);
  Color green = Color.fromRGBO(28, 174, 129, 1);
  Color shadow = Color.fromRGBO(168, 166, 166, 0.24);
  bool loading = false;
  var index = 0;
  List<Map> userinfo =[
    {
      'id':'',
      'name':'',
      'location':'',
      'number':'',
      'time':'',
      'date':'',
      'status':'',
    }
  ];

  @override
  void initState() {
    ServiceApi.info().then((users) {
      for (var user in users!['results']) {
        setState(() {
          userinfo.add(
              {
                'id' : user['order_id'].toString(),
                'name' : user['applicant_user_full_name'].toString(),
                'location': user['applicant_user_phone_number'].toString(),
                'number': user['visit_location'].toString(),
                'time': user['visit_date'].toString(),
                'date': user['visit_time'].toString(),
                'status': user['status'].toString(),
              }
          );
          index++;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    TabController _tabcontroller = TabController(length: 3,vsync: this);

    return Scaffold(
      backgroundColor : whitelight,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: blueDark,
        title: Align(
          alignment: Alignment.bottomCenter,
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
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(
                  Icons.menu
              ),
              color: white,
              onPressed: (){},
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 15),
              child: Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: blueDark,
                ),
                child: TabBar(
                    controller: _tabcontroller,
                    labelColor: blueDark,
                    labelStyle: TextStyle(
                      color: blueDark,
                      fontFamily: 'IRANSansFaNum',
                      fontSize: 12,
                    ),
                    unselectedLabelColor: white,
                    unselectedLabelStyle: TextStyle(
                      color: white,
                      fontFamily: 'IRANSansFaNum',
                      fontSize: 12,
                    ),
                    tabs: [
                      Tab(
                        text: "اعلام خسارت",
                      ),
                      Tab(
                        text: "بازدید بدنه",
                      ),
                      Tab(
                        text: "صدور بیمه بدنه",
                      ),
                    ],
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  indicator: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    color: white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.zero,
              child: TabBarView(
                  controller: _tabcontroller,
                  children: [
                    Container(
                    ),
                    Container(
                    ),
                    Container(
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Container(
                color: white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: gray,
                      ),
                      onPressed: (){},
                    ),
                    Text(
                      'شناسه پرونده را وارد کنید',
                      style: TextStyle(
                        color: gray,
                        fontFamily: 'IRANSansFaNum',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
            child: Container(
              color: white,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.bookmark_sharp,
                        color: blueDark,
                        size: 50,
                      ),
                      onPressed: (){},
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userinfo[index]['id'],
                          style: TextStyle(
                            color: grayinfo,
                            fontFamily: 'IRANSansFaNum',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'شناسه پرونده',
                              style: TextStyle(
                                color: grayquestion,
                                fontFamily: 'IRANSansFaNum',
                                fontSize: 12,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userinfo[index]['name'],
                          style: TextStyle(
                            color: grayinfo,
                            fontFamily: 'IRANSansFaNum',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'نام مشتری ',
                              style: TextStyle(
                                color: grayquestion,
                                fontFamily: 'IRANSansFaNum',
                                fontSize: 12,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userinfo[index]['number'],
                          style: TextStyle(
                            color: grayinfo,
                            fontFamily: 'IRANSansFaNum',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'تلفن همراه',
                              style: TextStyle(
                                color: grayquestion,
                                fontFamily: 'IRANSansFaNum',
                                fontSize: 12,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            userinfo[index]['location'],
                            style: TextStyle(
                              color: grayinfo,
                              fontFamily: 'IRANSansFaNum',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
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
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: whitecontainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text(
                        userinfo[index]['status'],
                        style: TextStyle(
                          color: grayinfo,
                          fontFamily: 'IRANSansFaNum',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'وضعیت پرونده',
                            style: TextStyle(
                              color: grayquestion,
                              fontFamily: 'IRANSansFaNum',
                              fontSize: 12,
                            ),
                          ),
                          Icon(
                            Icons.text_snippet,
                            size: 19,
                            color: graydot,
                          ),
                        ],
                      ),
                      ],
                  ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userinfo[index]['date']+userinfo[index],
                          style: TextStyle(
                            color: grayinfo,
                            fontFamily: 'IRANSansFaNum',
                            fontSize: 8,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'زمان بازدید ',
                              style: TextStyle(
                                color: grayquestion,
                                fontFamily: 'IRANSansFaNum',
                                fontSize: 12,
                              ),
                            ),
                            Icon(
                              Icons.watch_later,
                              size: 15,
                              color: graydot,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              HexagonWidget.pointy(
                                width: 41,
                                cornerRadius: 8,
                                color: green,
                                elevation: 8,
                                child: Icon(
                                  Icons.done,
                                  color: white,
                                ),
                              ),
                              Text(
                                'انجام شد',
                                style: TextStyle(
                                  color: green,
                                  fontFamily: 'IRANSansFaNum',
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(white),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          side: BorderSide(color: blueDark)
                                      ),
                                    )),
                                child: Text(
                                  'ورود به صفحه پرونده',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: blueDark,
                                    fontFamily: 'IRANSansFaNum',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          /*
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.assignment_return_rounded),
                            color: gray,
                            onPressed: () {},
                          ),
                          Text(
                            'ارسال نواقص',
                            style: TextStyle(
                              color: gray,
                              fontFamily: 'IRANSansFaNum',
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            IconButton(
                              icon: Icon(Icons.home_rounded),
                              onPressed: () {},
                              color: gray,
                            ),
                            Text(
                              'خانه',
                              style: TextStyle(
                                color: gray,
                                fontFamily: 'IRANSansFaNum',
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: shadow,
                                      blurRadius: 150
                                  ),
                                ],
                              ),
                              child: HexagonWidget.pointy(
                                width: 41,
                                cornerRadius: 8,
                                color: white,
                                elevation: 8,
                                child: IconButton(
                                  icon: Icon(Icons.text_snippet),
                                  onPressed: () {},
                                  color: blueDark,
                                ),
                              ),
                            ),
                            Text(
                              'پرونده های من',
                              style: TextStyle(
                                color: blueDark,
                                fontFamily: 'IRANSansFaNum',
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          */
        ],
      ),
    );
  }
}
