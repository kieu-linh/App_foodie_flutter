import 'package:flutter/material.dart';
import 'package:foodie_flutter_app/components/app_box_shadow.dart';
import 'package:foodie_flutter_app/components/button/app_elevated_button.dart';
import 'package:foodie_flutter_app/gen/assets.gen.dart';
import 'package:foodie_flutter_app/resources/app_color.dart';
import 'package:foodie_flutter_app/resources/app_style.dart';
import 'package:lottie/lottie.dart';

class DeliveryTime extends StatefulWidget {
  const DeliveryTime({
    super.key,
    this.onPlaceOrder,
    required this.minutes,
    required this.totalPrice,
  });

  final Function()? onPlaceOrder;
  final int minutes;
  final double totalPrice;

  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..forward()
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.repeat();
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: AppBoxShadow.boxShadow,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Delivery Time',
                style: AppStyle.h16Normal,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Lottie.asset(
                'assets/amination/shaking.json',
                width: 100.0,
                controller: _animationController,
                onLoaded: (p0) {
                  _animationController.forward();
                },
              ),
              // Image.asset(
              //   Assets.images.timeIcon.path,
              //   width: 18.0,
              // ),
              Text(
                ' ${widget.minutes} minutes',
                style: AppStyle.h14Normal.copyWith(
                    color: AppColor.brown, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Total Price',
              style: AppStyle.h14Normal.copyWith(color: AppColor.brown),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              const Text('\$', style: AppStyle.h18Normal),
              Text(
                widget.totalPrice.toStringAsFixed(2),
                style: AppStyle.h22Normal.copyWith(color: AppColor.brown),
              ),
              const Spacer(),
              AppElevatedButton.small(
                onPressed: widget.onPlaceOrder,
                text: 'Place Order',
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
