import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodie_flutter_app/components/button/app_elevated_button.dart';
import 'package:foodie_flutter_app/components/text_field/app_text_field.dart';
import 'package:foodie_flutter_app/components/text_field/app_text_field_password.dart';
import 'package:foodie_flutter_app/pages/auth/login_page.dart';
import 'package:foodie_flutter_app/resources/app_color.dart';

import 'package:foodie_flutter_app/resources/app_style.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  late bool isCheck;

  @override
  void initState() {
    super.initState();
    isCheck = false;
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = AppStyle.h16Normal;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(20.0).copyWith(
              top: MediaQuery.of(context).padding.top + 64.0, bottom: 72.0),
          children: [
            const Text(
              'Register',
              style: AppStyle.h24Normal,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6.0),
            Text(
              'Create your new account.',
              style: AppStyle.h18Normal.copyWith(color: AppColor.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 46.0),
            AppTextField(
              controller: nameController,
              hintext: 'Full Name',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16.0),
            AppTextField(
              controller: emailController,
              hintext: 'Email or Phone',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16.0),
            AppTextFieldPassword(
              controller: passwordController,
              hintext: 'Password',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16.0),
            AppTextFieldPassword(
              controller: confirmPasswordController,
              hintext: 'Confirm Password',
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 40.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => setState(() => isCheck = !isCheck),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
                    child: Icon(
                      isCheck
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank,
                      size: 20.0,
                      color: AppColor.red,
                    ),
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'I agree to your',
                      style: textStyle.copyWith(color: AppColor.grey),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => log('Pressed privacy policy'),
                          text: ' privacy policy',
                          style: textStyle,
                        ),
                        const TextSpan(text: ' and'),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => log('Pressed term & conditions'),
                          text: ' term & conditions',
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            AppElevatedButton(
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (Route<dynamic> route) => false),
              text: 'Sign up',
            ),
            const SizedBox(height: 26.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already an account,',
                  style: textStyle.copyWith(color: AppColor.grey),
                ),
                GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage())),
                    child: const Text(' Login', style: textStyle)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
