import 'package:food_delivery/src/models/food_model.dart';
import 'package:food_delivery/src/models/user_info_model.dart';
class Bill{
  final UserInfo userInfor;
  final List<Food> listFood;

  Bill({
    this.userInfor,this.listFood,
  });
}
