import 'dart:async';

import 'package:ecom_3/home.dart';
import 'package:ecom_3/resources.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  Resources r = new Resources();

  AnimationController animationController;
  AnimationController animationController2;

  bool isClearIconPressed = false;

  Size ds = Size(0.0, 0.0);

  List<CardInfo> cardList = [
    CardInfo(
        name: 'Artlamp', type: 'Lamp', price: 79.0, image: 'images/img.jpeg'),
    CardInfo(
        name: 'Tlamp', type: 'Lamp', price: 81.0, image: 'images/img5.jpeg'),
    CardInfo(
        name: 'Boxlamp', type: 'Lamp', price: 75.0, image: 'images/img6.jpg'),
    CardInfo(
        name: 'Artlamp', type: 'Lamp', price: 55.0, image: 'images/img4.jpeg'),
  ];

  // ----------- USING -----------

  Widget topBar() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTapDown: (d) {
              setState(() {
                isClearIconPressed = true;
              });
            },
            onTapUp: (d) {
              setState(() {
                isClearIconPressed = false;
                animationController.reverse();
                animationController2.reverse();
              });
              Timer(
                  Duration(milliseconds: 800),
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      )));
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: isClearIconPressed ? r.black : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Icon(Icons.clear,
                  color: isClearIconPressed ? Colors.white : r.black),
            ),
          ),
          Container(
            child: SlideTransition(
              position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                  .animate(CurvedAnimation(
                      curve: Curves.fastOutSlowIn,
                      parent: animationController2)),
              child:
                  Text('Your Order', style: r.style(r.black, 48, isBold: true)),
            ),
          ),
        ],
      ),
    );
  }

  Widget totalPriceBar() {
    return SlideTransition(
      position: Tween(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0)).animate(
          CurvedAnimation(
              curve: Curves.fastOutSlowIn, parent: animationController)),
      child: Container(
        margin: EdgeInsets.only(bottom: 30, top: 20),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Total', style: r.style(Colors.grey[500], 18)),
                      Text('\$ 370',
                          style: r.style(r.black, 28, font: r.f3, isBold: true))
                    ],
                  ),
                ),
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
      ),
    );
  }

  Widget card(int index, double beginPos) {
    return SlideTransition(
      position: Tween(begin: Offset(0.0, beginPos), end: Offset(0.0, 0.0))
          .animate(CurvedAnimation(
              curve: Curves.fastOutSlowIn, parent: animationController)),
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100.0,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                child:
                    Image.asset(cardList[index].image, fit: BoxFit.fitHeight),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(cardList[index].name, style: r.style(Colors.white, 20)),
                  Text(cardList[index].type,
                      style: r.style(Colors.grey[500], 16)),
                ],
              ),
            ),
            Container(
              height: 100.0,
              alignment: Alignment.center,
              child: Text('\$ ' + cardList[index].price.toString(),
                  style: r.style(Colors.white, 22, font: r.f3, isBold: true)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animationController2 =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    animationController.forward();
    animationController2.forward();
  }

  @override
  Widget build(BuildContext context) {
    ds = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: <Widget>[
          topBar(),
          totalPriceBar(),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(100.0)),
                color: r.black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 30, top: 30),
                    child: SlideTransition(
                        position: Tween(
                                begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                            .animate(CurvedAnimation(
                                curve: Curves.fastOutSlowIn,
                                parent: animationController)),
                        child: Text('Ordered', style: r.style(r.offWhite, 24))),
                  ),
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        card(0, 1.4),
                        card(1, 1.8),
                        card(2, 2.2),
                        card(3, 2.6),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardInfo {
  final String name;
  final String type;
  final double price;
  final String image;

  CardInfo({this.name, this.type, this.price, this.image});
}
