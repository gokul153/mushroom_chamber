//CROP PREDICTION PAGE

// ignore_for_file: use_build_context_synchronously

//import 'package:b_green/crop/result.dart';

import 'package:b_green/page/homepage_add/details.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:homie/functions.dart';
//import "dart:ui";
//import 'selectcrop.dart';
//import 'package:b_green/function.dart';
//import 'package:flutter/services.dart';

class Predict extends StatefulWidget {
  const Predict({super.key});

  @override
  State<Predict> createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  //use this controller to get what user typed
  final _ntextController = TextEditingController();

  final _ptextController = TextEditingController();

  final _ktextController = TextEditingController();

  final _phtextController = TextEditingController();

  final _rtextController = TextEditingController();

  // key = 1;
  double n = 0, p = 0, k = 0;

  double ph = 0.0, rain = 0.0;

  String url = '';

  int error = 0;

  // get kDefaultPadding => null;
  String cropr = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crop Prediction"),
        backgroundColor: const Color.fromARGB(255, 85, 139, 47),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Crops recommended based on the input values \n",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color.fromARGB(255, 85, 139, 47),
                    ),
                    //borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 85, 139, 47),
                          blurRadius: 5,
                          offset: Offset(5, 5))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextFormField(
                        controller: _ntextController,
                        decoration: const InputDecoration(
                          labelText: 'Nitrogen Level',
                          labelStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Divider(),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextFormField(
                        controller: _ptextController,
                        decoration: const InputDecoration(
                          labelText: 'Phosphorous Level',
                          labelStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Divider(),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextFormField(
                        controller: _ktextController,
                        decoration: const InputDecoration(
                          labelText: 'Potassium Level',
                          labelStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Divider(),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextFormField(
                        controller: _phtextController,
                        decoration: const InputDecoration(
                          labelText: 'pH Value',
                          labelStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Divider(),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextFormField(
                        controller: _rtextController,
                        decoration: const InputDecoration(
                          labelText: 'Rainfall in mm',
                          labelStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    // Text('$cropr'),
                    // Text(cropr),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () async {
                  print("butoon presed");
                  error = 0;
                  n = double.parse(_ntextController.text);
                  p = double.parse(_ptextController.text);
                  k = double.parse(_ktextController.text);
                  ph = double.parse(_phtextController.text);
                  rain = double.parse(_rtextController.text);

                  if (n > 100 || n <= 0) {
                    const snackbar = SnackBar(
                        content: Text(
                            "Invalid value for nitrogen,phosphorous or pottasium"));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    error = 1;
                  } else {
                    error = 0;
                  }
                  if (p <= 0) {
                    const snackbar = SnackBar(
                        content: Text("Invalid value for phosphorous"));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    error = 1;
                  } else {
                    error = 0;
                  }
                  if (k <= 0) {
                    const snackbar =
                        SnackBar(content: Text("Invalid value for pottasium"));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    error = 1;
                  } else {
                    error = 0;
                  }
                  if (rain <= 0) {
                    const snackbar =
                        SnackBar(content: Text("Invalid value for rain"));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    error = 1;
                  } else {
                    error = 0;
                  }
                  if (ph > 14 || ph <= 0) {
                    const snackbar =
                        SnackBar(content: Text("Invalid value for pH"));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    error = 1;
                  } else {
                    error = 0;
                  }
                  if (error == 0) {
                    url =
                        // 'http://ec2-54-214-135-137.us-west-2.compute.amazonaws.com:8080/crop?n=$n&p=$p&k=$k&ph=$ph&r=$rain';
                        'http://ec2-52-25-38-39.us-west-2.compute.amazonaws.com:8080/crop?n=$n&p=$p&k=$k&ph=$ph&r=$rain';
                    print("fetching");
                    print(url);
                    http.Response response = await http.get(Uri.parse(url));
                    print(response.body);
                    cropr = response.body;
                    print("from maain$cropr");
                    setState(() {
                      // cropr = "intial";

                      this.cropr = cropr.toString();
                    });
                    //  cropr = "Orange";
                    if (cropr.contains("Orange")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(
                              id: 0,
                            ),
                          ));
                    }
                    if (cropr.contains("Pigeon")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 1),
                          ));
                    }
                    if (cropr.contains("Rice")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(
                              id: 2,
                            ),
                          ));
                    }
                    if (cropr.contains("Maize")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(
                              id: 3,
                            ),
                          ));
                    }
                    if (cropr.contains("Chickpeas")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 4),
                          ));
                    }
                    if (cropr.contains("Kidneybeans")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 5),
                          ));
                    }
                    if (cropr.contains("Moth")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 6),
                          ));
                    }
                    if (cropr.contains("Mung")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 7),
                          ));
                    }
                    if (cropr.contains("Blackgram")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 8),
                          ));
                    }
                    if (cropr.contains("Lentil")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 9),
                          ));
                    }
                    if (cropr.contains("Pomegranate")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 10),
                          ));
                    }
                    if (cropr.contains("Banana")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 11),
                          ));
                    }
                    if (cropr.contains("Mango")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 12),
                          ));
                    }
                    if (cropr.contains("Grape")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 13),
                          ));
                    }
                    if (cropr.contains("Watermelon")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 14),
                          ));
                    }
                    if (cropr.contains("Muskmelon")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 15),
                          ));
                    }
                    if (cropr.contains("Apple")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 16),
                          ));
                    }
                    if (cropr.contains("Papaya")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 17),
                          ));
                    }
                    if (cropr.contains("Coconut")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 18),
                          ));
                    }
                    if (cropr.contains("Cotton")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Details(id: 19)));
                    }
                    if (cropr.contains("Jute")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 20),
                          ));
                    }
                    if (cropr.contains("Coffee")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Details(id: 21),
                          ));
                    }

                    /*   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => result(),
                                ));*/

                    //    if(cropr)

                    // const snackbar = SnackBar(content: Text('crop is$cropr'));
                    //ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  } else {
                    const snackbar = SnackBar(content: Text("Invalid "));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                },
                color: const Color.fromARGB(255, 85, 139, 47),
                child:
                    const Text('SUBMIT', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectCropCard extends StatelessWidget {
  const SelectCropCard({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    //required this.price,
    //required this.press,
  }) : super(key: key);

  final String image, title, country;
  //final int price;
  //final Function press;

  get kDefaultPadding => null;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 200,
            height: 100,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 50,
                  color: Colors.green.withOpacity(0.23),
                ),
              ],
            ),
          );
        });
  }
}
