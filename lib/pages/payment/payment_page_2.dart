import 'package:flutter/material.dart';
import 'package:foodie_flutter_app/components/app_bar/foodie_app_bar.dart';
import 'package:foodie_flutter_app/components/app_box_shadow.dart';
import 'package:foodie_flutter_app/components/app_dialog.dart';
import 'package:foodie_flutter_app/pages/payment/address_page.dart';
import 'package:foodie_flutter_app/pages/payment/payment_method_page.dart';
import 'package:foodie_flutter_app/pages/splash/splash_page.dart';
import 'package:foodie_flutter_app/resources/app_color.dart';
import 'package:foodie_flutter_app/resources/app_style.dart';


class PaymentPage2 extends StatelessWidget {
  const PaymentPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodieAppBar(
        leftPressed: () => AppDialog.confirmExitApp(context),
        title: 'Payment',
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0)
                    .copyWith(top: 20.0, bottom: 86.0),
                child: Column(
                  children: [
                    _buildPaymentItem(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const AddressPage())),
                        text: 'Choose Address'),
                    const SizedBox(height: 20.0),
                    _buildPaymentItem(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PaymentMethodPage())),
                        text: 'Payment Method'),
                    const SizedBox(height: 20.0),
                    _buildPaymentItem(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const AddressPage())),
                        text: 'Choose Address'),
                    const SizedBox(height: 20.0),
                    _buildPaymentItem(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PaymentMethodPage())),
                        text: 'Payment Method'),
                    const SizedBox(height: 20.0),
                    _buildPaymentItem(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const AddressPage())),
                        text: 'Choose Address'),
                    const SizedBox(height: 20.0),
                    _buildPaymentItem(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PaymentMethodPage())),
                        text: 'Payment Method'),
                    const SizedBox(height: 20.0),
                    _buildPaymentItem(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const AddressPage())),
                        text: 'Choose Address'),
                    const SizedBox(height: 20.0),
                    _buildPaymentItem(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PaymentMethodPage())),
                        text: 'Payment Method'),
                    const SizedBox(height: 20.0),
                    _buildPaymentItem(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const AddressPage())),
                        text: 'Choose Address'),
                    const SizedBox(height: 20.0),
                    _buildPaymentItem(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PaymentMethodPage())),
                        text: 'Payment Method'),
                    const SizedBox(height: 20.0),
                    _buildPaymentItem(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const AddressPage())),
                        text: 'Choose Address'),
                    const SizedBox(height: 20.0),
                    _buildPaymentItem(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const PaymentMethodPage())),
                      text: 'Payment Method',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 20.0,
            right: 20.0,
            bottom: 26.0,
            child: TextButton(
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const SplashPage()),
                  (Route<dynamic> route) => false),
              child: const Text(
                'Splash Page',
                style: AppStyle.h16Normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentItem({Function()? onPressed, required String text}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0)
            .copyWith(left: 20.0, right: 12.0),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: AppBoxShadow.boxShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: AppStyle.h16Normal.copyWith(color: AppColor.brown),
            ),
            const Icon(Icons.navigate_next, size: 26.0, color: AppColor.brown)
          ],
        ),
      ),
    );
  }
}
