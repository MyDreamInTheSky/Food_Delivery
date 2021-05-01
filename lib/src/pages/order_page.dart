import 'package:flutter/material.dart';
import 'package:food_delivery/src/data/globalData.dart';
import 'package:food_delivery/src/pages/sigin_page.dart';
import '../widgets/order_card.dart';
import 'package:food_delivery/src/models/food_model.dart';

class OrderPage extends StatefulWidget {
  OrderPage():super(key: global.orderpage);
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    print("REBUILD ORDERPAGE");
    var col = global.foodIndex.map(_buildFoodCard).toList();
    return Scaffold(
      key: global.keyForOrderPage,
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            children: col,
          ),
        ],
      ),
      bottomNavigationBar: _buildTotalContainer(),
    );
  }
  Widget _buildFoodCard(int index) {
    if (index == -1)
      return Center();
    else
      return GestureDetector(
        child: Container(
          margin: EdgeInsets.only(bottom: 0.0),
          child: OrderCard(index: index),
        ),
      );
  }

  Widget _buildTotalContainer() {
    return Container(
      height: 220.0,
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Subtotal",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${this.totalCart()}",
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Discount",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${this.totalDiscount()}",
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Tax",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "0.5",
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            height: 2.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Cart Total",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${(1-this.totalDiscount()/100+0.1)*this.totalCart()}",
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
            },
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Center(
                child: Text(
                  "Proceed To Checkout",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
  int totalCart(){
    double total = 0;
    print(global.foodNumber);
    print(global.foodSelectedList);
    print(global.foodIndex);
    for (int i = 0; i < global.foodIndex.length; i++){
      if (global.foodIndex[i] != -1){
        total += global.foodNumber[i]*global.foodSelectedList[i].price;
      }
    }
    return total.toInt();
  }
  int totalDiscount(){
    double total = 0;
    print(global.foodNumber);
    print(global.foodSelectedList);
    print(global.foodIndex);
    for (int i = 0; i < global.foodIndex.length; i++){
      if (global.foodIndex[i] != -1){
        total += global.foodSelectedList[i].discount;
      }
    }
    return total.toInt();
  }
}

