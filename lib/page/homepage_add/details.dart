//OUTPUT OF THE CROP PREDICTION PAGE

import 'package:b_green/model_n/detailmodel.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  //final Product product;
  final int id;
  const Details({Key? key, required this.id}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  //Toggle Favorite button
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    List<Pro> pros = Pro.proc;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    child: Text(pros[widget.id].title,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  ),
                  const Align(
                    child: Text(
                      "will be your best choice",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 85, 139, 47),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(188, 101, 101, 101),
                            blurRadius: 5,
                            offset: Offset(3, 5))
                      ],
                      image: DecorationImage(
                          // ignore: unnecessary_string_interpolations
                          image: AssetImage(pros[widget.id].image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: pros[widget.id].title,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0)),
                                // TextSpan(text: product.title,style: TextStyle(color: Colors.black))
                              ])),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: pros[widget.id].desc,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16))),
                        ]),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(190, 232, 232, 232),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
