import 'package:flutter/material.dart';
import 'package:foodie_flutter_app/components/button/app_elevated_button.dart';
import 'package:foodie_flutter_app/components/text_field/app_text_field.dart';
import 'package:foodie_flutter_app/components/text_field/app_text_field_password.dart';
import 'package:foodie_flutter_app/pages/auth/register_page.dart';
import 'package:foodie_flutter_app/pages/cart/cart_page.dart';
import 'package:foodie_flutter_app/resources/app_color.dart';
import 'package:foodie_flutter_app/resources/app_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0)
                .copyWith(top: MediaQuery.of(context).padding.top + 100.0),
            child: Column(
              children: [
                const Text('Welcome Back', style: AppStyle.h24Normal),
                const SizedBox(height: 2.0),
                Text(
                  'Login to your account.',
                  style: AppStyle.h18Normal.copyWith(color: AppColor.grey),
                ),
                const SizedBox(height: 46.0),
                AppTextField(
                  controller: emailController,
                  hintext: 'Email or Phone',
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16.0),
                AppTextFieldPassword(
                  controller: passwordController,
                  hintext: 'Password',
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 4.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text('Forgot Password?',
                        style: AppStyle.h16Normal),
                  ),
                ),
                const SizedBox(height: 40.0),
                Hero(
                  //hero-material
                  tag: 'Login',
                  child: Material(
                    child: AppElevatedButton(
                        onPressed: () =>
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const CartPage()),
                              (Route<dynamic> route) => false,
                            ),
                        text: 'Login'),
                  ),
                ),
                const SizedBox(height: 22.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account, ',
                      style: AppStyle.h16Normal.copyWith(color: AppColor.grey),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      ),
                      child: const Text('Sign up', style: AppStyle.h16Normal),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
