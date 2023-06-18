//SPLASH SCREEN
import 'package:b_green/page/firstscreen.dart';
import 'package:flutter/material.dart';
//import 'package:b_green/page/splash.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const First())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: <Widget>[
        const Divider(
          height: 240.0,
          color: Colors.black,
        ),
        Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
          repeat: ImageRepeat.noRepeat,
          width: 300.0,
        ),
        const Divider(
          height: 105.2,
          color: Colors.black,
        ),
      ]),
    );
  }
}
