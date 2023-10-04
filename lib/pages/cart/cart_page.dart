import 'package:flutter/material.dart';
import 'package:foodie_flutter_app/components/app_bar/foodie_app_bar.dart';
import 'package:foodie_flutter_app/components/app_dialog.dart';
import 'package:foodie_flutter_app/models/food_model.dart';
import 'package:foodie_flutter_app/pages/cart/widget/delivery_time.dart';
import 'package:foodie_flutter_app/pages/cart/widget/food_item.dart';
import 'package:foodie_flutter_app/pages/payment/payment_page.dart';
import 'package:lottie/lottie.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _menuController;
  bool giftComplete = false;
  bool isClick = false;
  @override
  void initState() {
    super.initState();
    _menuController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..forward()
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            giftComplete = true;
            setState(() {});
          }
        },
      );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  double get totalPrice {
    double totalPrice = 0.0;
    for (FoodModel food in foods) {
      totalPrice += food.price ?? 0.0;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          // appBar: FoodieAppBar(
          //   leftPressed: () => AppDialog.confirmExitApp(context),
          //   title: 'Foodies',
          // ),
          appBar: AppBar(actions: [
            GestureDetector(
              onTap: () {
                if (isClick) {
                  _menuController.reverse();
                } else {
                  _menuController.forward();
                }
                isClick = !isClick;
                setState(() {});
              },
              child: Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: AnimatedIcon(
                    progress: _menuController,
                    icon: AnimatedIcons.close_menu,
                  ),
                ),
              ),
            )
          ]),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0)
                  .copyWith(top: 6.0, bottom: 26.0),
              child: Column(
                children: [
                  ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10.0,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: foods.length,
                    itemBuilder: ((BuildContext context, index) {
                      return FoodItem(food: foods[index]);
                    }),
                  ),
                  const SizedBox(height: 52.0),
                  DeliveryTime(
                    onPlaceOrder: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const PaymentPage()),
                    ),
                    minutes: 25,
                    totalPrice: totalPrice,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (!giftComplete)
          Positioned.fill(
            child: Lottie.asset(
              'assets/amination/gift.json',
              controller: _animationController,
              onLoaded: (p0) {
                _animationController.forward();
              },
            ),
          )
      ],
    );
  }

  // Future<void> _confirmExitApp(BuildContext context) async {
  //   bool? status = await showDialog<bool>(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('😍'),
  //       content: Row(
  //         children: [
  //           Expanded(
  //             child: Text(
  //               'Do you want to exit app?',
  //               style: AppStyle.h18Normal.copyWith(color: AppColor.brown),
  //               textAlign: TextAlign.center,
  //             ),
  //           )
  //         ],
  //       ),
  //       actions: <Widget>[
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: [
  //             AppElevatedButton.smallOutline(
  //               onPressed: () => Navigator.pop(context, true),
  //               padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //               text: 'Yes',
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(left: 12.0),
  //               child: AppElevatedButton.smallOutline(
  //                 onPressed: () => Navigator.pop(context, false),
  //                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //                 text: 'No',
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );

  //   if (status ?? false) {
  //     SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  //   }
  // }
}
