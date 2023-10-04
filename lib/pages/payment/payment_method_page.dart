import 'package:flutter/material.dart';
import 'package:foodie_flutter_app/components/app_bar/foodie_app_bar.dart';
import 'package:foodie_flutter_app/components/app_box_shadow.dart';
import 'package:foodie_flutter_app/components/app_dialog.dart';
import 'package:foodie_flutter_app/components/button/app_elevated_button.dart';
import 'package:foodie_flutter_app/gen/assets.gen.dart';
import 'package:foodie_flutter_app/models/payment_method_model.dart';
import 'package:foodie_flutter_app/pages/payment/payment_page.dart';
import 'package:foodie_flutter_app/resources/app_color.dart';
import 'package:foodie_flutter_app/resources/app_style.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodieAppBar(
        leftPressed: () => AppDialog.confirmExitApp(context),
        title: 'Payment Method',
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20.0)
                  .copyWith(top: 40.0, bottom: 100.0),
              itemBuilder: (_, index) {
                return _buildPaymentMethodItem(
                    onPressed: () {
                      for (var element in paymentMethods) {
                        element.isSelected = false;
                      }
                      paymentMethods[index].isSelected = true;
                      setState(() {});
                    },
                    paymentMethod: paymentMethods[index]);
              },
              separatorBuilder: (_, __) => const SizedBox(height: 20.0),
              itemCount: paymentMethods.length,
            ),
          ),
          Positioned(
            left: 20.0,
            right: 20.0,
            bottom: 46.0,
            child: AppElevatedButton(
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const PaymentPage()),
                  (Route<dynamic> route) => false),
              text: 'Next',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodItem({
    Function()? onPressed,
    required PaymentMethodModel paymentMethod,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: AppBoxShadow.boxShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              paymentMethod.name ?? '-:-',
              style: AppStyle.h16Normal.copyWith(color: AppColor.brown),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Image.asset(
              (paymentMethod.isSelected ?? false
                      ? Assets.images.radioButtonOn
                      : Assets.images.radioButtonOff)
                  .path,
              width: 18.0,
            ),
          ],
        ),
      ),
    );
  }
}
