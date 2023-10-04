import 'package:flutter/material.dart';
import 'package:foodie_flutter_app/components/app_box_shadow.dart';
import 'package:foodie_flutter_app/gen/assets.gen.dart';
import 'package:foodie_flutter_app/models/address_model.dart';
import 'package:foodie_flutter_app/resources/app_color.dart';
import 'package:foodie_flutter_app/resources/app_style.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    this.onPress,
    required this.address,
  });
  final Function? onPress;
  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: AppBoxShadow.boxShadow,
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                address.titleFirst ?? '-.-',
                style: AppStyle.h14Normal.copyWith(
                  color: AppColor.brown,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  (address.isSelected ?? false
                          ? Assets.images.radioButtonOn
                          : Assets.images.radioButtonOff)
                      .path,
                  width: 18.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18.0),
          Text(
            address.titleSecond ?? '-.-',
            style: AppStyle.h14Normal.copyWith(color: AppColor.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12.0),
          Text(
            address.description ?? '-.-',
            style: AppStyle.h14Normal.copyWith(color: AppColor.grey),
          )
        ]),
      ),
    );
  }
}
