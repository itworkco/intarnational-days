import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'details.dart';
import 'eventModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var day = DateTime.now().day;
  var monthNumber = DateTime.now().month;

  List<String> monthes = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];

  List<EventModel> eventModel = List<EventModel>();

  void addModel() {
    eventModel.add(
      EventModel(
          '04', 'الأربعاء', 'assets/images/3.png', 'اليوم العالمي للغة بريل'),
    );
    eventModel.add(
      EventModel(
          '24', 'الأربعاء', 'assets/images/2.png', 'اليوم الدولي للتعليم'),
    );
    eventModel.add(
      EventModel(
          '27',
          'الأربعاء',
          'assets/images/1.png',
          'اليوم الدولي لإحياء ذكرى'
              ' محرقة اليهود'),
    );
  }

  getMonth(index) {
    setState(() {
      monthNumber = index + 1;
      print(monthNumber);
    });
  }

  @override
  void initState() {
    addModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffFBFCFC),
        leading: IconButton(
          icon: Icon(
            Icons.search,
            color: Color(0xff4EA1B5),
            size: 30,
          ),
          onPressed: () {},
        ),
        title: Text(
          'أيام دولية',
          style: TextStyle(
              color: Color(0xff4EA1B5), fontSize: 23, fontFamily: 'Sukarblack'),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff4EA1B5),
              size: 30,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .45,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/monthbg.png'),
                fit: BoxFit.cover,
              ),
//              boxShadow: [
//                BoxShadow(
//                  offset: Offset(1, 1),
//                  color: Color(0xff00000029),
//                  blurRadius: 2,
//                ),
//              ],
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                  child: GridView.builder(
                    padding: EdgeInsets.all(14),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () {
                        getMonth(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: (monthNumber == index + 1)
                                ? AssetImage('assets/images/selectedCard.png')
                                : AssetImage('assets/images/monthCard.png'),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            monthes[index],
                            style: TextStyle(
                              color: (monthNumber == index + 1)
                                  ? Color(0xffffffff)
                                  : Color(0xff37352F),
                              fontSize: 15,
                              fontFamily: 'SukarBold',
                            ),
                          ),
                        ),
                      ),
                    ),
                    itemCount: monthes.length,
                  )),
            ),
          ),
          Expanded(
            child: Stack(children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 64),
                width: 1,
                height: MediaQuery.of(context).size.height * .40,
                color: Color(0xffF3F3F3),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: eventModel.length,
                itemBuilder: (context, index) {
                  return eventRow(index);
                },
              ),
            ]),
          )
        ],
      ),
    );
  }

  eventRow(index) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  eventModel[index].number,
                  style: TextStyle(
                    fontFamily: 'Sukarblack',
                    fontSize: 25,
                    color:
                        (day == index) ? Color(0xff1E824c) : Color(0xff191818),
                  ),
                ),
                Text(
                  eventModel[index].day,
                  style: TextStyle(
                    fontFamily: 'Sukarblack',
                    fontSize: 10,
                    color:
                        (day == index) ? Color(0xff1E824c) : Color(0xff191818),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: 13,
                height: 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color(0xffF3F3F3),
                ),
                child: Center(
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: (day == index)
                          ? Color(0xff1E824c)
                          : Color(0xff191818),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return Details();
                    }),
                  );
                },
//                onTap: () {
//                  setState(() {
//                    day = index;
//                  });
//                },
                child: (day == index)
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(7),
                              topRight: Radius.circular(7),
                              topLeft: Radius.circular(7),
                              bottomLeft: Radius.circular(7)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              blurRadius: 6,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(eventModel[index].image),
                                ),
                              ),
                              height: 61,
                              width: 61,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                eventModel[index].title,
                                style: TextStyle(
                                  color: Color(0xff191818),
                                  fontSize: 16,
                                  fontFamily: 'SukarBold',
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(7),
                              bottomLeft: Radius.circular(7)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              blurRadius: 6,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(eventModel[index].image),
                                ),
                              ),
                              height: 61,
                              width: 61,
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                eventModel[index].title,
                                style: TextStyle(
                                  color: Color(0xff191818),
                                  fontSize: 18,
                                  fontFamily: 'SukarBold',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
