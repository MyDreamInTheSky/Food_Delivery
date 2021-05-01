import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/src/data/globalData.dart';
import 'package:food_delivery/src/models/food_model.dart';

class OrderCard extends StatefulWidget {
  final int index;
  OrderCard({this.index});

  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  int hide = 0;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    hide = global.foodIndex[widget.index];
    count = global.foodNumber[widget.index];
    Food f = global.foodSelectedList[widget.index];
    return (hide!=-1)?Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD3D3D3), width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 45.0,
              height: 73.0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          print(count);
                          setState(() {
                            count = (count+1<99)?count+1:99;
                            global.foodNumber[widget.index] = count;
                          });
                          global.key.currentState.setState(() {
                          });
                          global.orderpage.currentState.setState(() {
                          });
                        },
                        child: Icon(Icons.keyboard_arrow_up,
                            color: Color(0xFFD3D3D3))),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "$count",
                        style: TextStyle(fontSize: 18.0, color: Colors.grey),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          print(count);
                          setState(() {
                            count = (count-1 > 1)?count-1:1;
                            global.foodNumber[widget.index] = count;
                          });
                          global.key.currentState.setState(() {
                          });
                          global.orderpage.currentState.setState(() {
                          });
                        },
                        child: Icon(Icons.keyboard_arrow_down,
                            color: Color(0xFFD3D3D3))),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/lunch.jpeg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(35.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 2.0))
                  ]),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${f.name}",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Text(
                  "\u023B ${f.price*count}",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Container(
                  height: 25.0,
                  width: 120.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("${f.category}",
                              style: TextStyle(
                                  color: Color(0xFFD3D3D3),
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "${f.discount}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                global.foodIndex[widget.index] = -1;
                print(global.foodIndex);
                global.key.currentState.setState(() {
                });
                global.orderpage.currentState.setState(() {
                });
                setState(() {
                  hide = 1;
                });
              },
              child: Icon(
                Icons.cancel,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    ):SizedBox();
  }
}

