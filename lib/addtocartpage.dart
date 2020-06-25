import 'dart:async';

import 'package:ecom_3/orderpage.dart';
import 'package:ecom_3/resources.dart';
import 'package:flutter/material.dart';

class AddTOCardPage extends StatefulWidget {
  AddTOCardPage({Key key}) : super(key: key);

  @override
  _AddTOCardPageState createState() => _AddTOCardPageState();
}

class _AddTOCardPageState extends State<AddTOCardPage>
    with SingleTickerProviderStateMixin {
  Resources r = Resources();

  AnimationController animationController;

  bool isPressed = false;

  List<String> imageList = [
    'images/img.jpeg',
    'images/img1.jpeg',
    'images/img3.jpeg',
    'images/img4.jpeg',
  ];

  String desc =
      'You can easily direct the light where you want to because the arm and the head is adjustable.';

  Size ds = Size(0.0, 0.0);

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

  Widget card() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 30, bottom: 30),
      width: ds.width - 90,
      height: (ds.width - 90) / 1.5,
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
                opacity:
                    Tween(begin: 0.0, end: 1.0).animate(animationController),
                child: ScaleTransition(
                  scale: Tween(begin: 4.0, end: 1.0).animate(CurvedAnimation(
                      curve: Curves.fastOutSlowIn,
                      parent: animationController)),
                  child: Image.asset('images/img.jpeg', fit: BoxFit.fitWidth),
                ),
              ),
            ),
          ),
          Container(
              alignment: Alignment.topRight,
              width: double.infinity,
              padding: EdgeInsets.only(right: 14.0, top: 14.0),
              child: Icon(Icons.favorite_border, color: r.black)),
        ],
      ),
    );
  }

  Widget smallCard(int index, bool isSelected, double beginPos) {
    return SlideTransition(
      position: Tween(begin: Offset(beginPos, 0.0), end: Offset(0.0, 0.0))
          .animate(CurvedAnimation(
              curve: Curves.fastOutSlowIn, parent: animationController)),
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          border: Border.all(
              color: isSelected ? r.black : Colors.transparent, width: 1.4),
          color: r.offWhite,
        ),
        padding: EdgeInsets.all(isSelected ? 2.0 : 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Image.asset(imageList[index], fit: BoxFit.fitHeight),
        ),
      ),
    );
  }

  Widget bottomBar() {
    return SlideTransition(
      position: Tween(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0)).animate(
          CurvedAnimation(
              curve: Curves.fastOutSlowIn, parent: animationController)),
      child: GestureDetector(
        onTapDown: (d) {
          setState(() {
            isPressed = true;
          });
        },
        onTapUp: (d) {
          setState(() {
            isPressed = false;
            animationController.reverse();
          });
          Timer(Duration(milliseconds: 800), () => Navigator.push(context, MaterialPageRoute(  
            builder: (context) => OrderPage(),
          )));
        },
        child: Container(
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
                  color: isPressed ? Colors.white : r.black,
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
                      child: Text(
                        'Add to cart',
                        style: r.style(isPressed ? r.black : Colors.white, 28),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: (3.5 / 5) * ds.width, top: 7),
                height: 56.0,
                width: 56.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  //color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  child: Material(
                    color: Colors.red,
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.yellow,
                      child:
                          Icon(Icons.keyboard_arrow_right, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
          children: <Widget>[
            topBar(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  card(),
                  Container(
                    padding: EdgeInsets.only(bottom: 40, right: 20),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                            backgroundColor: Colors.yellow, radius: 8.0),
                        SizedBox(height: 16.0),
                        CircleAvatar(
                            backgroundColor: Colors.green, radius: 8.0),
                        SizedBox(height: 16.0),
                        CircleAvatar(
                            backgroundColor: Colors.black, radius: 8.0),
                        SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  smallCard(0, true, -5.4),
                  smallCard(1, false, -4.4),
                  smallCard(2, false, -3.4),
                  smallCard(0, false, -2.4),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: ds.height / 2 - 20.0,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 30.0, top: 20.0, bottom: 4.0),
                    child: Text('Artlamp',
                        style: r.style(Colors.grey[500], 20, isBold: true)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30.0, bottom: 16.0),
                    child: Text('\$ 79.0',
                        style: r.style(r.black, 28, font: r.f3, isBold: true)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Text(desc, style: r.style(Colors.grey, 18)),
                    ),
                  ),
                  Container(
                    child: bottomBar(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
