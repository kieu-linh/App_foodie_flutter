import 'package:foodie_flutter_app/utils/util.dart';

class AddressModel {
  String? id;
  String? titleFirst;
  String? titleSecond;
  String? description;
  bool? isSelected;

  AddressModel() {
    id = Util.getID();
  }
}

List<AddressModel> addresses = [
  AddressModel()
    ..titleFirst = 'My Home Address'
    ..titleSecond = 'Home'
    ..description =
        '(503) 338-5200 15612 Fisher Island Dr Miami Beach, Florida(FL), 33109'
    ..isSelected = true,
  AddressModel()
    ..titleFirst = 'My Office Address'
    ..titleSecond = 'Office'
    ..description =
        '(503) 338-5200 15612 Fisher Island Dr Miami Beach, Florida(FL), 33109'
    ..isSelected = false,
  AddressModel()
    ..titleFirst = 'My Home Address'
    ..titleSecond = 'Home'
    ..description =
        '(503) 338-5200 15612 Fisher Island Dr Miami Beach, Florida(FL), 33109'
    ..isSelected = false,
  AddressModel()
    ..titleFirst = 'My Office Address'
    ..titleSecond = 'Office'
    ..description =
        '(503) 338-5200 15612 Fisher Island Dr Miami Beach, Florida(FL), 33109'
    ..isSelected = false,
  AddressModel()
    ..titleFirst = 'My Home Address'
    ..titleSecond = 'Home'
    ..description =
        '(503) 338-5200 15612 Fisher Island Dr Miami Beach, Florida(FL), 33109'
    ..isSelected = false,
  AddressModel()
    ..titleFirst = 'My Office Address'
    ..titleSecond = 'Office'
    ..description =
        '(503) 338-5200 15612 Fisher Island Dr Miami Beach, Florida(FL), 33109'
    ..isSelected = false,
];
