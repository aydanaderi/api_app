import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'appbar.dart';
import 'api.dart';
import 'colors.dart';
import 'textstyle.dart';

class InformationPage extends StatefulWidget {

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> with TickerProviderStateMixin{

  var index = 0;
  List<Map> userinfo =[
    {
      'id':'0iajz4o474',
      'name':'محمدعلی مراد بیگ زاده',
      'location':'شهرک غرب، فاز 4، زرافشان، خیابان شجریان، پلاک 13، واحد 8',
      'number':'09127825671',
      'time':'14:11',
      'date':'1401-06-01',
      'status':'تأیید شده توسط نماینده',
    }
  ];

  @override
  void initState() {
    //get data and set in a list of map
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
          index++; //next user
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

      appBar: AppBars(),
      //using the scroll to fix the size and fix the error
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: blueDark,
                ),
                child: TabBar(
                  controller: _tabcontroller,
                  labelColor: blueDark,
                  labelStyle: textStyle6,
                  unselectedLabelColor: white,
                  unselectedLabelStyle: textStyle7,
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
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
                      style: textStyle1
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  userinfo[index]['id'],
                                  style: textStyle4,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'شناسه پرونده',
                                    style: textStyle3,
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
                              Expanded(
                                child: Text(
                                  userinfo[index]['name'],
                                  style: textStyle4,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    ' نام مشتری',
                                    style: textStyle3
                                  ),
                                  SizedBox(width: 10),
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
                              Expanded(
                                child: Text(
                                  userinfo[index]['number'],
                                  style: textStyle4,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    ' تلفن همراه',
                                    style: textStyle3,
                                  ),
                                  SizedBox(width: 10),
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
                                Expanded(
                                  child: Text(
                                    userinfo[index]['location'],
                                    style: textStyle4,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      ' محل بازدید',
                                      style: textStyle3,
                                    ),
                                    SizedBox(width: 10),
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
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            decoration: BoxDecoration(
                              color: whitecontainer,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          userinfo[index]['status'],
                                          style: textStyle4,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            ' وضعیت پرونده',
                                            style: textStyle3,
                                          ),
                                          SizedBox(width: 10),
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
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          userinfo[index]['date']+userinfo[index]['time'],
                                          style: textStyle4,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            ' زمان بازدید ',
                                            style: textStyle3,
                                          ),
                                          SizedBox(width: 10),
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
                                SizedBox(height: 10),
                              ],
                            ),
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
                                      style: textStyle5,
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
                                        style: textStyle6,
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
                Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.bookmark_sharp,
                      color: blueDark,
                      size: 50,
                    ),
                    onPressed: (){},
                  ),
                ),
                Align(
                  heightFactor: 3.5,
                  widthFactor: 3,
                  child: Text(
                    'خودم',
                    style: textStyle8,
                  ),
                ),
              ],
            ),
            BottomAppBar(
              color: white,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.assignment_return_rounded),
                            color: gray,
                            onPressed: () {},
                          ),
                          Text(
                            'ارسال نواقص',
                            style: textStyle2,
                          )
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            IconButton(
                              icon: Icon(Icons.home_rounded),
                              onPressed: () {},
                              color: gray,
                            ),
                            Text(
                              'خانه',
                              style: textStyle2,
                            )
                          ],
                        ),
                      ),
                      Container(
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
                            SizedBox(height: 5),
                            Text(
                              'پرونده های من',
                              style: textStyle9,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
