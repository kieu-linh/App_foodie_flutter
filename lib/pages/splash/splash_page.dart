import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie_flutter_app/gen/assets.gen.dart';
import 'package:foodie_flutter_app/pages/welcome_page.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.repeat();
        }
      });
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ));

    // Timer(const Duration(milliseconds: 2600), () {
    //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarBrightness: Brightness.light,
    //     statusBarIconBrightness: Brightness.dark,
    //   ));

    //   Route route =
    //       MaterialPageRoute(builder: (context) => const WelcomePage());
    //   Navigator.pushAndRemoveUntil(
    //       context, route, (Route<dynamic> route) => false);
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Image.asset(
          //   Assets.images.background.path,
          //   width: size.width,
          //   height: size.height,
          //   fit: BoxFit.fill,
          // ),
          Center(
              child: Lottie.asset(
            'assets/amination/tree.json',
            controller: _animationController,
            onLoaded: (p0) {
              _animationController
                ..duration = p0.duration
                ..forward().whenComplete(() {
                  Route route = MaterialPageRoute(
                      builder: (context) => const WelcomePage());
                  Navigator.pushAndRemoveUntil(
                      context, route, (Route<dynamic> route) => false);
                });
            },
          )),
          // Center(
          //   child: Image.asset(Assets.images.logo1.path, width: 160.0),
          // ),
        ],
      ),
      // body: Container(
      //   width: size.width,
      //   height: size.height,
      //   width: double.infinity,
      //   height: double.infinity,
      //   alignment: Alignment.center,
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       // image: Image.asset(Assets.images.background.path).image,
      //       image: AssetImage(Assets.images.background.path),
      //       fit: BoxFit.fill,
      //     ),
      //   ),
      //   child: Image.asset(
      //     Assets.images.logo1.path,
      //     width: 160.0,
      //   ),
      // ),
    );
  }
}
