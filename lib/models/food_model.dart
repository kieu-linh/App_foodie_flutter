
import 'package:foodie_flutter_app/gen/assets.gen.dart';
import 'package:foodie_flutter_app/utils/util.dart';

class FoodModel {
  String? id;
  String? imageStr;
  String? name;
  double? price;
  int? quantity;
  String? description;
  double? rating;

  FoodModel() {
    id = Util.getID();
  }
}

List<FoodModel> foods = [
  FoodModel()
    ..imageStr = Assets.images.food1.path
    ..name = 'Fried Chicken'
    ..price = 20.0
    ..quantity = 2
    ..description = 'Golden browse fried chicken'
    ..rating = 4.5,
  FoodModel()
    ..imageStr = null
    ..name = 'Cheese Sandwich'
    ..price = 18.0
    ..quantity = 3
    ..description = 'Grilled Cheese Sandwich'
    ..rating = 4,
  FoodModel()
    ..imageStr = Assets.images.food3.path
    ..name = 'Egg Pasta'
    ..price = 15.0
    ..quantity = 1
    ..description = 'Spicy Chicken Pasta'
    ..rating = 5,
  FoodModel()
    ..imageStr = 'abc'
    ..name = 'Fried Chicken'
    ..price = 20.0
    ..quantity = 2
    ..description = 'Golden browse fried chicken'
    ..rating = 4.5,
  FoodModel()
    ..imageStr = Assets.images.food2.path
    ..name = 'Cheese Sandwich'
    ..price = 18.0
    ..quantity = 3
    ..description = 'Grilled Cheese Sandwich'
    ..rating = 4,
  FoodModel()
    ..imageStr = Assets.images.food3.path
    ..name = 'Egg Pasta'
    ..price = 15.0
    ..quantity = 1
    ..description = 'Spicy Chicken Pasta'
    ..rating = 5,
];
