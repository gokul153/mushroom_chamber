//MOISTURE CONTROLLER PAGE

import 'dart:convert' as convert;
import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

Map mapresponse = {};
Map moisture = {};
String userhumid = "";

class FPage extends StatefulWidget {
  const FPage({Key? key}) : super(key: key);

  @override
  State<FPage> createState() => _FPageState();
}

class _FPageState extends State<FPage> {
  /* void _showPopup(BuildContext context){
    showDialog(context: context, builder: (BuildContext conte))
  }*/
  late TextEditingController humcontroller = TextEditingController();
  late TextEditingController temcontroller = TextEditingController();
  //late TextEditingController updatecontroller = TextEditingController()
 /// int humuser = 0;
  dynamic tempuser = 0;
  final updateref = FirebaseDatabase.instance.ref("update");
  final checkref = FirebaseDatabase.instance.ref("check");
  //final humidityRef = FirebaseDatabase.instance.ref();
  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          title: const Text('Update value'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Enter the  value to be updated'),
                TextField(
                  decoration: InputDecoration(
                      //     border: InputBorder.none,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Set border radius
                        borderSide:
                            BorderSide(color: Colors.grey), // Set border color
                      ),
                      labelText: 'humidity',
                      // labelText: userhumid,
                      hintText: 'Enter humidity value to be updated'),
                  controller: humcontroller,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      //: InputBorder.none,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Set border radius
                        borderSide:
                            BorderSide(color: Colors.grey), // Set border color
                      ),
                      labelText: 'Temperature',
                      hintText: 'Enter Temperature value to be updated'),
                  controller: temcontroller,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            /* TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),**/
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add your button click logic here
                  print('Fire Base Saving Begin');
                  String text = humcontroller.text;
                  int status = 1;
                  if (status == 1) {
                    checkref
                        // .child('1')
                        .set({'check_it': 1})
                        .then((value) {})
                        .onError((error, stackTrace) {
                          print("error Occured \n");
                        });
                  }
                  // Try to parse the text as an integer
                  int parsedInteger = int.parse(text);
                  print(parsedInteger);
                  String texttem = temcontroller.text;

                  // Try to parse the text as an integer
                  int parsedIntegertem = int.parse(texttem);
                  print(parsedIntegertem);
                  if (parsedInteger != 0) {
                    updateref
                        .child('hum')
                        .set({'humidity': parsedInteger})
                        .then((value) {})
                        .onError((error, stackTrace) {
                          print("error Occured \n");
                        });
                  }
                  if (parsedIntegertem != 0) {
                    updateref
                        .child('temp')
                        .set({'temperature': parsedIntegertem})
                        .then((value) {})
                        .onError((error, stackTrace) {
                          print("error Occured \n");
                        });
                  }
                },
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 18), // Set the text size
                  primary: Colors.lightGreen, // Set the button background color
                  onPrimary: Colors.white, // Set the text color
                  // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: EdgeInsets.fromLTRB(16, 8, 32, 8),

                  /// Set the button padding
                ),
                child: Text('Save'), // Set the button text to "Save"
              ),
            ),
            //r ElevatedButton(onPressed: (){}, child:Text("Save")),
          ],
        );
      },
    );
  }

  final url =
      "https://api.thingspeak.com/channels/2019435/fields/1.json?api_key=9S859ECUZDHBKRIY&results=2";
  var _postjson = [];
  dynamic value;
  bool loading = false;
  double wet = 0;
  double humidity_user = 0;
  double temp_user = 0;
  dynamic userhumidity;
  double hum = 0;
  final databaseRef = FirebaseDatabase.instance.ref('Post');

  final humidityRef = FirebaseDatabase.instance.ref();
  final postcontroller = TextEditingController();
  final ref = FirebaseDatabase.instance.ref('FirebaseIOT');
  bool value1 = false;
  void get_status() async {}
  void updatewet() {
    setState(() {
      // wet=
    });
  }

  void FetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      // Map jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
      mapresponse = convert.jsonDecode(response.body);
      dynamic data = mapresponse['feeds'];
      value = data[1]["field1"];
      int i = 1;
      // print(jsonData);
      print("feeds $data");
      print("\ndata  $value");
      setState(() {
        var _moisture = double.parse(value);
        print(moisture);
        // final post = _postjson[1];
        //print(post);
      });
    } catch (err) {
      print("exception occured");
      print(err);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    humcontroller = TextEditingController();
    FetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Moisture Controller"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.change_circle,
              color: Colors.white,
            ),
            onPressed: () {
              //  showAboutDialog(context: context)
              _showAlertDialog();
              // do something
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 85, 139, 47),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "TEMPERATURE LEVEL",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Container(
                child: StreamBuilder(
                  stream: updateref.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (!snapshot.hasData) {
                      /* return const CircularProgressIndicator(
                      strokeWidth: 2,
                      value: 2,
                    );*/
                      return Text("Recieving User data");
                    } else {
                      print("Trying to display user defined values");
                      Map<dynamic, dynamic> map =
                          snapshot.data!.snapshot.value as dynamic;
                      List<dynamic> list = [];

                      list.clear();
                      list = map.values.toList();
                      print("the list returened is $list");
                      // List<dynamic> humiditylist = list[0];
                      // print("edited list $humiditylist");

                      dynamic humiditylimit = list[0].toString();
                      String humiditylimit1 =
                          humiditylimit.replaceAll("{", "").replaceAll("}", "");

                      tempuser = list[1].toString();
                      String tempuser1 =
                          tempuser.replaceAll("{", "").replaceAll("}", "");
                      //  Map<String, dynamic> data = convert.jsonDecode(humiditylimit);
                      print("User defined temperature $tempuser1");
                      print("User defined humidity $humiditylimit1");
                      List<String> tempcheck = tempuser1.split(':');
                      print(tempcheck);

                      List<String> humidcheck = humiditylimit1.split(':');
                      print(humidcheck[1]);
                      print(tempcheck[1]);
                      humidity_user = double.parse(humidcheck[1]);
                      temp_user = double.parse(tempcheck[1]);

                      /*wet = double.parse(water);
                    hum = double.parse(humidity);
                    print("moisture is $water");
                    print("wet is $wet");
                    print(humidity);*/
                      return Text("");
                    }
                  },
                ),
              ),
              Container(
                  child: StreamBuilder(
                stream: ref.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (!snapshot.hasData) {
                    /* return const CircularProgressIndicator(
                      strokeWidth: 2,
                      value: 2,
                    );*/
                    return Text("Testing Edit");
                  } else {
                    Map<dynamic, dynamic> map =
                        snapshot.data!.snapshot.value as dynamic;
                    List<dynamic> list = [];
                    dynamic humidity;
                    list.clear();
                    list = map.values.toList();
                    print("the list returened is $list");
                    dynamic water = list[0].toString();
                    humidity = list[1].toString();
                    //  print(moisture);

                    wet = double.parse(water);
                    hum = double.parse(humidity);
                    print("moisture is $water");
                    print("wet is $wet");
                    print(humidity);
                    return Text("");
                  }
                },
              )),
              
               FutureBuilder(
                builder: (context, snapshot) {
                  return SfRadialGauge(
                 axes: <RadialAxis>[RadialAxis(  interval: 20,
               startAngle: 0, endAngle: 360, showTicks: false,
               showLabels: false,
               axisLineStyle: AxisLineStyle(thickness: 25),
               ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0, endValue: 50, color: Color.fromARGB(255, 199, 192, 191)),
                      GaugeRange(
                          startValue: 50,
                          endValue: 75,
                          color: Color.fromARGB(255, 199, 192, 191)),
                      GaugeRange(
                          startValue: 75,
                          endValue: 100,
                          color: Color.fromARGB(255, 199, 192, 191))
                    ], 
               pointers: <GaugePointer>[RangePointer(
                value: wet,
              

               width: 25, color: Color.fromARGB(255, 222, 175, 4),
               enableAnimation: true,
               cornerStyle: CornerStyle.bothCurve)],
               annotations: <GaugeAnnotation>[
               GaugeAnnotation(widget: Padding(
                 padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                 child: Column(children: <Widget>[Container(
                   width: 30.00 ,
                   height:  30.00,
                   alignment: Alignment.center,
                   decoration: new BoxDecoration(
                   image: new DecorationImage(
                     image: ExactAssetImage('assets/images/temperature_icon.png'),
                     fit: BoxFit.fitHeight,
                           ),
                         )),
                            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                             child: Container(child:Text(wet.toString(),
                             style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20)) ,),)
                     ],),
               ) , angle: 270, 
               positionFactor: 0.001)]
   
    )
    ]
    )
                  ;
                },
              ),
              Text(
                "Default Temperature is ${temp_user}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
             /* Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: LiteRollingSwitch(
                  value: value1,
                  textOn: "ON",
                  textOff: "OFF",
                  colorOn: Colors.lightBlue,
                  colorOff: Colors.red,
                  iconOn: Icons.water,
                  iconOff: Icons.water_damage,
                  textSize: 18,
                  onChanged: (bool position) {
                    print("button is $position");
                    if (position == true) {
                      databaseRef
                          // .child('1')
                          .set({'status': 1})
                          .then((value) {})
                          .onError((error, stackTrace) {
                            print("error Occured \n");
                          });
                    }
                    if (position == false) {
                      databaseRef
                          // .child('1')
                          .set({'status': 0})
                          .then((value) {})
                          .onError((error, stackTrace) {
                            print("error Occured \n");
                          });
                    }
                    value1 = false;
                  },
                  onDoubleTap: () {},
                  onSwipe: () {},
                  onTap: () {},
                ),
              ),
              FutureBuilder(
                builder: (context, snapshot) {
                  return SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(minimum: 0, maximum: 100, ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0, endValue: 50, color: Colors.red),
                      GaugeRange(
                          startValue: 50,
                          endValue: 75,
                          color: Colors.lightBlue),
                      GaugeRange(
                          startValue: 75,
                          endValue: 100,
                          color: Colors.blueAccent)
                    ], pointers: <GaugePointer>[
                      NeedlePointer(
                        value: hum,
                        enableAnimation: true,
                      )
                    ], annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Text(hum.toString(),
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          angle: 90,
                          positionFactor: 0.5)
                    ])
                  ]);
                },
              ),*/
              FutureBuilder(
                builder: (context, snapshot) {
                  return SfRadialGauge(
                 axes: <RadialAxis>[RadialAxis(  interval: 10,
               startAngle: 0,
               endAngle: 360,
               showTicks: false,
               showLabels: false,
               axisLineStyle: AxisLineStyle(thickness: 25),
               ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0, endValue: 50, color: Color.fromARGB(255, 199, 192, 191)),
                      GaugeRange(
                          startValue: 50,
                          endValue: 75,
                          color: Color.fromARGB(255, 199, 192, 191)),
                      GaugeRange(
                          startValue: 75,
                          endValue: 100,
                          color: Color.fromARGB(255, 199, 192, 191))
                    ], 
               pointers: <GaugePointer>[RangePointer(
                value: hum,
              

               width: 25, color: Color.fromARGB(255, 4, 131, 222),
               enableAnimation: true,
               cornerStyle: CornerStyle.bothCurve)],
               annotations: <GaugeAnnotation>[
               GaugeAnnotation(widget: Padding(
                 padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                 child: Column(children: <Widget>[Container(
                   width: 30.00 ,
                   height:  30.00,
                   alignment: Alignment.center,
                   decoration: new BoxDecoration(
                   image: new DecorationImage(
                     image: ExactAssetImage('assets/images/humidityicon.png'),
                     fit: BoxFit.fitHeight,
                           ),
                         )),
                            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                             child: Container(child:Text(hum.toString(),
                             style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20)) ,),)
                     ],),
               ) , angle: 270, positionFactor: 0.001)]
   
    )
    ]
    )
                  ;
                },
              ),
                Text(
                "Default Humidity is $humidity_user",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
               
            ],
          ),
        ),
      ),
    );
  }
}
