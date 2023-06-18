//SIDE MENU PAGE

import 'package:b_green/page/noneed/camera.dart';
//import 'package:b_green/page/home_page.dart';
import 'package:b_green/page/moisturecontrol.dart';
import 'package:b_green/page/prediction.dart';
//import 'package:b_green/page/splash.dart';
//import 'package:b_green/page/statusiot.dart';
import 'package:b_green/page/croptimeline.dart';
//import 'package:b_green/widget/bottomnav.dart';
import 'package:flutter/material.dart';

//import './detail_screen.dart';
//import './home_screen.dart';
String memail = "";

class MeanDrawer extends StatelessWidget {
  const MeanDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            //color: Theme.of(context).primaryColor,
            color: const Color.fromARGB(255, 0, 0, 0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        //   image: NetworkImage('https://i.pravatar.cc/300')
                        image: AssetImage(
                            'assets/images/MyLogoArt20230224083626.png'),
                      ),
                    ),
                  ),
                  const Text(
                    'Welcome user',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Go green B-green',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Home_Page',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              /*     Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ));*/
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Live Data',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FPage(),
                  ));
            },
          ),
          ListTile(
              leading: const Icon(Icons.batch_prediction),
              title: const Text(
                'Prediction',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Predict(),
                    ));
              }),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text(
              'Disease Analysis',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Camera(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.nature_outlined),
            title: const Text(
              'Yield Notifier',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Timeline(
                        appBar: AppBar(
                      title: const Text(""),
                    )),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
