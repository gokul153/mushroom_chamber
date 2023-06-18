//CROP TIMELINE PAGE

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'dart:convert' as convert;
/*
import 'package:b_green/page/splash.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart';
import 'package:cron/cron.dart';
*/

class Timeline extends StatefulWidget {
  const Timeline({super.key, required AppBar appBar});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  int r = 0;
  TextEditingController dataController = TextEditingController();
  final ref = FirebaseDatabase.instance.ref('10');
  @override
  void initState() {
    super.initState();
    dataController.text = "";
  }

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String _name = "";
  var transplanting_day, minimum_day, maximum_day, fistman_day, secondman_day;

  DateTime pickedDate = DateTime.now();
  //DateTime pickedData = DateTime()
  int error = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 85, 139, 47),
          title: const Text("Crop Timeline")),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // DropdownButton(items: items, onChanged: dropdownCallback,
                //iconEnabledColor: Colors.green,),
                //   DropdownButtonHideUnderline(child: child)
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 85, 139, 47),
                            blurRadius: 4,
                            offset: Offset(2, 5))
                      ]),
                  child: TextField(
                    decoration: const InputDecoration(
                        labelText: "Add your crop",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 85, 139, 47),
                        ),
                        border: InputBorder.none),
                    onChanged: (value) => _name = value,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                /* TextFormField(
                  decoration: const InputDecoration(labelText: "Add crop"),
                  onChanged: (value) => _name = value,
                ),*/
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 85, 139, 47),
                            blurRadius: 4,
                            offset: Offset(2, 5))
                      ]),
                  child: TextField(
                    controller: dataController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        iconColor: Color.fromARGB(255, 85, 139, 47),
                        labelText: "Enter date",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 85, 139, 47),
                        ),
                        border: InputBorder.none),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      // var pickedData = DateTime.parse(formattedString)
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat("yyyy-MM-dd").format(pickedDate);

                        setState(() {
                          dataController.text = formattedDate.toString();
                        });
                      } else {
                        print("Not Selected");
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: SizedBox(
                      height: 100,
                      child: StreamBuilder(
                        stream: ref.onValue,
                        builder:
                            (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator(
                              strokeWidth: 0,
                              value: 0,
                            );
                          } else {
                            Map<dynamic, dynamic> map =
                                snapshot.data!.snapshot.value as dynamic;
                            List<dynamic> list = [];

                            list.clear();
                            list = map.values.toList();
                            print("the list returened is $list");
                            var min = list[0].toString();
                            var max = list[1].toString();
                            var trans = list[3].toString();
                            var first_man = list[4].toString();
                            var second_man = list[2].toString();
                            print("minimum$min");
                            print("maximum$max");
                            minimum_day =
                                pickedDate.add(Duration(days: int.parse(min)));
                            maximum_day =
                                pickedDate.add(Duration(days: int.parse(max)));
                            secondman_day = pickedDate
                                .add(Duration(days: int.parse(second_man)));
                            transplanting_day = pickedDate
                                .add(Duration(days: int.parse(trans)));

                            var crop = list[5].toString();
                            //  print(moisture);

                            //final maximum = double.parse(text);
                            //print("days $maximum");
                            //print("crop $crop");
                            return ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      "Crop listed are \n$crop",
                                      textAlign: TextAlign.center,
                                    ),
                                    //  subtitle: Text(list[0].toString()),
                                  );
                                });
                          }
                        },
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    print(DateFormat.yMMMd().format(minimum_day));
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 85, 139, 47),
                    ),
                    child: const Center(
                      child: Text(
                        "GET TIMELINE",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                /* ElevatedButton.icon(
                    onPressed: () {
                      print(DateFormat.yMMMd().format(minimum_day));
                    },
                    icon: const Icon(Icons.analytics),
                    label: const Text(
                      "GET TIMELINE",
                      
                    )),*/
                const Text(
                  "PREDICTED SCHEDULE\n",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                const Text(
                  "Predicted Harvested Timeline",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  " $maximum_day to $minimum_day",
                ),
                const Text(
                  "Transplanting",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("$transplanting_day"),

                const Text(
                  "Manure Schedule",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "$fistman_day to $secondman_day",
                ),

                const Text(""),
                // Text(DateFormat('dd/MM/yyyy').format(minimum_day)),
              ],
            ),
          )),
    );
  }
}
