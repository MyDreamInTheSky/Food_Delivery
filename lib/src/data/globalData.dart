import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/src/models/food_model.dart';

class global{
  static List<Food> foodSelectedList = [];
  static List<int> foodNumber = [];
  static List<int> foodIndex =[];
  static GlobalKey<ScaffoldState> keyForHomePage = GlobalKey<ScaffoldState>();
  static GlobalKey<ScaffoldState> keyForOrderPage = GlobalKey<ScaffoldState>();
  static GlobalKey key = GlobalKey();
  static GlobalKey orderpage = GlobalKey();
}