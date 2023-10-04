import 'package:flutter/material.dart';
import 'package:foodie_flutter_app/components/app_box_shadow.dart';
import 'package:foodie_flutter_app/components/app_rating_bar.dart';
import 'package:foodie_flutter_app/components/app_simmer.dart';
import 'package:foodie_flutter_app/models/food_model.dart';
import 'package:foodie_flutter_app/resources/app_color.dart';
import 'package:foodie_flutter_app/resources/app_style.dart';

class FoodItem extends StatefulWidget {
  const FoodItem({super.key, required this.food});

  final FoodModel food;

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  bool check = false;
  bool star = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding:
          const EdgeInsets.only(left: 6.0, top: 8.0, right: 12.0, bottom: 6.0),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: check ? null : AppBoxShadow.boxShadow,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: GestureDetector(
              onLongPress: () {
                check = true;
                setState(() {});
              },
              onLongPressEnd: (_) {
                check = false;
                setState(() {});
              },
              // AnimatedOpacity, AnimatedScale, AnimatedRotation
              child: AnimatedRotation(
                turns: check ? 1 : 2,
                duration: const Duration(seconds: 2),
                child: AnimatedScale(
                  duration: const Duration(seconds: 5),
                  scale: !check ? 1 : 2,
                  child: Image.asset(
                    widget.food.imageStr ?? '',
                    width: check ? 200.0 : 100.0,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const AppSimmmer(),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 2.0),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.food.name ?? '-:-',
                        style: AppStyle.h16Normal.copyWith(
                          color: AppColor.brown,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: Text(
                          widget.food.quantity == null
                              ? '_x'
                              : '${widget.food.quantity!}x',
                          style: AppStyle.h16Normal,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.food.description ?? '-:-',
                    style: AppStyle.h12Normal.copyWith(
                        color: AppColor.grey, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 18.0),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: Text('\$', style: AppStyle.h16Normal),
                    ),
                    Expanded(
                      child: Text(
                        widget.food.price?.toStringAsFixed(2) ?? '-:-',
                        style:
                            AppStyle.h20Normal.copyWith(color: AppColor.brown),
                      ),
                    ),
                    AnimatedScale(
                      duration: const Duration(seconds: 1),
                      scale: !star ? 1 : 1.3,
                      child: GestureDetector(
                        onLongPress: () {
                          star = true;
                          setState(() {});
                        },
                        onLongPressEnd: (_) {
                          star = false;
                          setState(() {});
                        },
                        child: AppRatingBar(
                            onRatingUpdate: (value) {},
                            rating: widget.food.rating ?? 0.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
