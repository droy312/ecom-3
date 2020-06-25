import 'dart:async';
import 'dart:io';

import 'package:ecom_3/addtocartpage.dart';
import 'package:ecom_3/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Resources r = Resources();

  AnimationController animationController;

  Size ds = Size(0.0, 0.0);

  List<String> headerList = ['Lamps', null, null, null];

  List<String> itemTypeInfoList = [
    'You can easily direct the light where you want to because the arm and the head is adjustable.',
    null,
    null,
    null,
  ];

  List<CardInfo> cardList = [
    CardInfo(name: 'Artlamp', price: 79.0, image: 'images/img.jpeg'),
    CardInfo(name: 'Ulamp', price: 79.0, image: 'images/img4.jpeg'),
    CardInfo(name: 'Tlamp', price: 79.0, image: 'images/img3.jpeg'),
  ];

  IconData iconData = Icons.add;

  // ----------- USING ------------

  Widget topBar() {
    return Container(
      width: ds.width,
      margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Icon(Icons.menu, color: r.black),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Icon(Icons.shopping_basket, color: r.black),
          ),
        ],
      ),
    );
  }

  Widget header(int index) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
          .animate(CurvedAnimation(
              curve: Curves.fastOutSlowIn, parent: animationController)),
      child: Container(
        margin: EdgeInsets.only(left: 30, bottom: 20),
        child:
            Text(headerList[index], style: r.style(r.black, 48, isBold: true)),
      ),
    );
  }

  Widget subHeader(int index) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
          .animate(CurvedAnimation(
              curve: Curves.fastOutSlowIn, parent: animationController)),
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: Text(
          itemTypeInfoList[index],
          style: r
              .style(
                Colors.grey,
                18,
                font: r.f3,
                isBold: false,
              )
              .copyWith(height: 1.5),
        ),
      ),
    );
  }

  Widget card(int index) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
      width: ds.width - 60,
      // height is set in the main container in the build method
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 4.0),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
              child: FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    curve: Curves.fastOutSlowIn, parent: animationController)),
                child: ScaleTransition(
                  scale: Tween(begin: 4.0, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.fastOutSlowIn,
                      parent: animationController)),
                  child:
                      Image.asset(cardList[index].image, fit: BoxFit.fitWidth),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 14.0, bottom: 14.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    cardList[index].name,
                    style: r.style(r.black, 22, isBold: true),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(14.0),
                  alignment: Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.favorite_border, color: r.black),
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0)),
                        ),
                        child: RotationTransition(
                          turns: Tween(begin: 45.0 / 360.0, end: 0.0 / 360.0)
                              .animate(animationController),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.0)),
                            child: Material(
                              color: r.black,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    animationController.reverse();
                                  });
                                  Timer(
                                      Duration(milliseconds: 800),
                                      () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AddTOCardPage(),
                                          )));
                                },
                                splashColor: Colors.yellow,
                                child:
                                    Icon(iconData, color: r.offWhite, size: 24),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget icon(IconData icon, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: isSelected ? r.black : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 2.0),
            blurRadius: 4,
          ),
        ],
      ),
      child: Icon(
        icon,
        color: isSelected ? r.offWhite : Colors.grey[700],
        size: 30.0,
      ),
    );
  }

  Widget bottomBar(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 20),
      width: double.infinity,
      height: 70.0,
      child: Stack(
        children: <Widget>[
          Container(
            width: ds.width * (4 / 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 3.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: EdgeInsets.only(right: 60.0),
                  child: FadeTransition(
                    opacity: Tween(begin: 0.0, end: 1.0)
                        .animate(animationController),
                    child: SlideTransition(
                      position:
                          Tween(begin: Offset(-2.0, 0.0), end: Offset(0.0, 0.0))
                              .animate(CurvedAnimation(
                                  curve: Curves.fastOutSlowIn,
                                  parent: animationController)),
                      child: Text(
                        '\$' + cardList[index].price.toString(),
                        style: r.style(r.black, 28, font: r.f3, isBold: true),
                      ),
                    ),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: (3.5 / 5) * ds.width, top: 7),
            height: 56.0,
            width: 56.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: Icon(Icons.keyboard_arrow_right, color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    ds = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: r.offWhite,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            topBar(),
            Container(
              padding: EdgeInsets.only(top: 20),
              height: ds.height - 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  header(0),
                  subHeader(0),
                  Container(
                    height: ((ds.width - 60) / 1.5) + 30,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        card(0),
                        card(1),
                        card(2),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        icon(Icons.keyboard_arrow_left, false),
                        icon(Icons.bookmark_border, false),
                        icon(Icons.shopping_basket, true),
                        icon(Icons.keyboard_arrow_right, false),
                      ],
                    ),
                  ),
                  bottomBar(0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardInfo {
  final String name;
  final double price;
  final String image;

  CardInfo({this.name, this.price, this.image});
}
