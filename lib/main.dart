//import 'dart:convert' as convert;

import 'package:b_green/login.dart/Authcontroller.dart';
import 'package:b_green/page/firstscreen.dart';
import 'package:b_green/splash_page.dart';
//import 'package:b_green/page/meandrawer.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:http/http.dart';
//import 'package:flutter/services.dart';
import 'package:cron/cron.dart';
import 'package:get/get.dart';
//import 'package:b_green/splash_page.dart';


//import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  final cron = Cron();
  cron.schedule(Schedule.parse('*/1 * * * * *'), () async => {});
//  cron.schedule(Schedule.parse(''),()as)

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //final FirebaseApp _fbApp = Firebase.initializeApp();
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Be-Green',
      theme: ThemeData(
        primaryColor: Colors.green, // Change the primary color
        // accentColor: Colors.red, // Change the accent color
        // ignore: deprecated_member_use
        backgroundColor: Colors.black,
        fontFamily: 'Roboto',
      ),
      // home: HomePage(),
      home: const Splash(),
    );
  }
}

Map mapresponse = {};
Map moisture = {};
