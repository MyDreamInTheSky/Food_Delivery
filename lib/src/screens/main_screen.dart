import 'package:flutter/material.dart';
import 'package:food_delivery/src/admin/pages/add_food_item.dart';
import 'package:food_delivery/src/scoped-model/main_model.dart';
import '../pages/home_page.dart';
import '../pages/order_page.dart';
import '../pages/explore_page.dart';
import '../pages/profile_page.dart';
import '../pages/sigin_page.dart';
import 'package:food_delivery/src/data/globalData.dart';



class MainScreen extends StatefulWidget {
  final MainModel model;

  MainScreen({this.model}):super(key: global.key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // Pages
  HomePage homePage;
  OrderPage orderPage;
  FavoritePage favoritePage;
  ProfilePage profilePage;
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    // call the fetch method on food
    // widget.foodModel.fetchFoods();
    // widget.model.fetchFoods();
    print("main_screen: initeState Called");
    homePage = HomePage();
    orderPage = OrderPage();
    favoritePage = FavoritePage(model: widget.model);
    widget.model.fetchFoods();
    profilePage = ProfilePage();
    pages = [homePage, favoritePage, orderPage, profilePage];
    currentPage = homePage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuild MainScreen");
    return SafeArea(
      child: Scaffold(
        key: global.keyForHomePage,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            currentTab == 0 ? "Food Delivery App" : currentTab == 1 ? "All Food Items" : currentTab == 2 ? "Orders" : "Profile",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  size: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
              onPressed: (){

              },
            ) ,
            IconButton(
              icon: (currentTab != 3)?_buildShoppingCart():Icon(Icons.logout, size: 30.0,color: Theme.of(context).primaryColor),
              onPressed: (){
                if (currentTab != 3) {
                  setState(() {
                    currentTab = 2;
                    currentPage = pages[2];
                  });
                }
                else{
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => SignInPage()
                  ));
                  widget.model.logout();
                }
              },
            ) ,
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AddFoodItem()));
                },
                leading: Icon(Icons.list),
                title: Text(
                  "Add food Item",
                  style: TextStyle(fontSize: 16.0),
                ),
              )
            ],
          ),
        ),
        //resizeToAvoidBottomPadding: false,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTab,
          onTap: (index) {
            setState(() {
              currentTab = index;
              currentPage = pages[index];
            });
          },
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
              ),
              title: Text("Explore"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              title: Text("Orders"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text("Profile"),
            ),
          ],
        ),
        body: currentPage,
      ),
    );
  }
  Widget _buildShoppingCart(){
    return Stack(
      children: <Widget>[
        Icon(
          Icons.shopping_cart,
          size: 30.0,
          color: Theme.of(context).primaryColor,
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: Container(
            height: 12.0,
            width: 12.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: (this.countFood()!=0?Colors.red:Color.fromRGBO(0, 0, 0, 0)),
            ),
            child: Center(
              child: Text((this.countFood()==0?"":"${this.countFood()}"), style: TextStyle(fontSize: 12.0, color: Colors.white),),
            ),
          ),
        )
      ],
    );
  }
  int countFood(){
    int dem = 0;
    for (int i = 0; i<global.foodIndex.length; i++) {
      if (global.foodIndex[i] >= 0)
        dem++;
    }
      return dem;
  }
}


