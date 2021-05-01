import 'package:flutter/material.dart';

import 'package:food_delivery/src/scoped-model/main_model.dart';
import 'package:food_delivery/src/widgets/bought_foods.dart';
import 'package:scoped_model/scoped_model.dart';
import '../widgets/home_top_info.dart';
import '../widgets/food_category.dart';
import '../widgets/search_file.dart';


// Model
import '../models/food_model.dart';
Widget _buildFoodItems(Food food) {
  return Container(
    margin: EdgeInsets.only(bottom: 20.0),
    child: BoughtFood(
      id: food.id,
      name: food.name,
      imagePath: food.imagePath,
      category: food.category,
      discount: food.discount,
      price: food.price,
      ratings: food.ratings,
    ),
  );
}

class HomePage extends StatefulWidget {
  // final FoodModel foodModel;

  // HomePage(this.foodModel);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Food> _foods = foods;

  @override
  void initState() {
    // widget.foodModel.fetchFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        children: <Widget>[
          HomeTopInfo(),
          FoodCategory(),
          SizedBox(
            height: 20.0,
          ),
          SearchField(),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Frequently Bought Foods",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("I' pressed");
                },
                child: Text(
                  "View all",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return Column(
                children: model.foods.map(_buildFoodItems).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

}