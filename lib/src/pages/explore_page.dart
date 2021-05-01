import 'package:flutter/material.dart';
import 'package:food_delivery/src/models/food_model.dart';
import 'package:food_delivery/src/scoped-model/main_model.dart';
import 'package:food_delivery/src/widgets/food_item_card.dart';
import 'package:food_delivery/src/widgets/show_dailog.dart';
import 'package:food_delivery/src/widgets/small_button.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:food_delivery/src/admin/pages/add_food_item.dart';



class FavoritePage extends StatefulWidget {
  final MainModel model;

  FavoritePage({this.model});
  @override
  _FavoritePageState createState() {
    print("exprlore_page : MainModel.model = $model");
    return _FavoritePageState();
  }
}

class _FavoritePageState extends State<FavoritePage> {

  // the scaffold global key
  GlobalKey<ScaffoldState> _explorePageScaffoldKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.model);
    print("InitState");
    widget.model.fetchFoods();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _explorePageScaffoldKey,
        backgroundColor: Colors.white,
        body: ScopedModelDescendant<MainModel>(
          builder: (BuildContext sctx, Widget child, MainModel model) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: RefreshIndicator(
                onRefresh: model.fetchFoods,
                child: ListView.builder(
                  itemCount: model.foodLength,
                  itemBuilder: (BuildContext lctx, int index) {
                    return GestureDetector(
                      onTap: () async {
                        final bool response =
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => AddFoodItem(
                              food: model.foods[index],
                            )));
                        print(response);
                        if (response) {
                          SnackBar snackBar = SnackBar(
                            duration: Duration(seconds: 1),
                            backgroundColor: Theme.of(context).primaryColor,
                            content: Text(
                              "Food item successfully updated.",
                              style:
                              TextStyle(color: Colors.white, fontSize: 16.0),
                            ),
                          );
                          _explorePageScaffoldKey.currentState.showSnackBar(snackBar);
                        }
                      },
                      onDoubleTap: (){
                        showLoadingIndicator(context, "Deleting food item...");
                        model.deleteFood(model.foods[index].id).then((bool response){
                          Navigator.of(context).pop();
                        });
                      },
                      onLongPress: (){
                        showLoadingIndicator(context, "Deleting food item...");
                        model.deleteFood(model.foods[index].id).then((bool response){
                          Navigator.of(context).pop();
                        });
                      },
                      child: FoodItemCard(
                        model.foods[index].name,
                        model.foods[index].description,
                        model.foods[index].price.toString(),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

