//Home Page of the app with all features

import 'package:b_green/page/yield/yield1.dart';
import 'package:b_green/page/yield/yield2nd.dart';
import 'package:b_green/page/knowcrop.dart';
import 'package:b_green/page/moisturecontrol.dart';
//import 'package:b_green/page/noneed/meandrawer.dart';
import 'package:b_green/page/prediction.dart';
import 'package:b_green/page/croptimeline.dart';
import 'package:flutter/material.dart';

String name = "";

// ignore: must_be_immutable
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double availableScreenWidth = 0;

  int selectedIndex = 0;

  @override
  /*void initState() {
    // TODO: implement initState
    name = "";
    super.initState();
    String checkname = widget.email;
    print(checkname);
    int len = checkname.length;
    for (int i = 0; i < len - 1; i++) {
      if (checkname[i] != "@") {
        name = name + checkname[i];
      } else {
        break;
      }
    }
    print("user is$name");
    setState(() {
      name = name;
    });
  }*/

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.of(context).size.width - 50;
    //var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white, // Color.fromARGB(255, 40, 49, 27),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 84, 147, 56),
        //const Color.fromARGB( 255, 78, 111, 67), // const Color.fromARGB(255, 127, 164, 101),
        /* title: const Text(
          "Welcome to",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),*/
        elevation: 0,
      ),
      //drawer: const MeanDrawer(),
      //  Get.offAll(() => Home(email:user.email!));

      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // Header Section
        Container(
          padding: const EdgeInsets.only(left: 50, bottom: 20),
          //padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          alignment: Alignment.topCenter,
          height: 100,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 84, 147, 56),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
             SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),

                  //Text(name),
                  Text(
                    "Be Green",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(.1)),
              child: IconButton(
                icon: const Icon(
                  Icons.notifications,
                  size: 28,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 5,
        ),

        const Divider(
          height: 10,
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Crop()));
                },
                child: Container(
                  width: 200.0,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(121, 139, 195, 74),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            child: Image.asset(
                              'assets/images/crop2.png',
                              width: 70,
                              height: 70,
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'KNOW YOUR CROPS',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Tap to know more about your crops',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Features",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Predict()));
                        },
                        child: buildFileColumn('crop3', 'Crop Prediction')),
                  ),
                  SizedBox(
                    width: availableScreenWidth * .03,
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          /*   Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Weather()));*/
                        },
                        child: buildFileColumn('cloud', 'Weather')),
                  ),
                  SizedBox(
                    width: availableScreenWidth * .03,
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Yield()));
                        },
                        child: buildFileColumn('crop2', 'Yield Notifier')),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              // Folder List
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const FPage()));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 65,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15)),
                  child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.water_drop_outlined,
                          color: Colors.lightBlue,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Moisture Controller",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Control the level of moisture your crop recieves",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Timeline(
                                  appBar: AppBar(
                                title: const Text(""),
                              ))));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 65,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15)),
                  child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.yard_outlined,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Crop Timeline",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Know about your crop's harvest schedule",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

Widget longBox(String folderName) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    height: 65,
    decoration: BoxDecoration(
        color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Icon(
            Icons.water_drop_outlined,
            color: Colors.blue[200],
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            folderName,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        ],
      ),
    ]),
  );
}

Column buildFileColumn(String image, String filename) {
  return Column(
    children: [
      Container(
        width: 100,

        decoration: BoxDecoration(
          //color: Color.fromARGB(255, 218, 80, 80),
          borderRadius: BorderRadius.circular(20),
          //border: Border.all(color: Colors.black, width: 2)
        ),
        //padding: const EdgeInsets.all(38),
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/$image.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      RichText(
        text: TextSpan(
          text: filename,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}

class CropCard extends StatelessWidget {
  const CropCard({
    Key? key,
    //required this.image,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
            width: 3, color: const Color.fromARGB(255, 200, 221, 171)),
        borderRadius: BorderRadius.circular(20),
        //image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)
      ),
      padding: const EdgeInsets.all(4),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
