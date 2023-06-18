//YIELD NOTIFIER PAGE

import 'package:b_green/model_n/cropmodel.dart';
import 'package:b_green/page/yield/yield2nd.dart';
import 'package:flutter/material.dart';

class Yield extends StatefulWidget {
  const Yield({
    Key? key,
  }) : super(key: key);

  @override
  State<Yield> createState() => _YieldState();
}

class _YieldState extends State<Yield> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Product.product;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 85, 139, 47),
        title: const Text(
          "Yield Notifier",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 5,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HPage(),
                      ),
                    );
                  },
                  child: longBox(1, "Sep - Oct", "Oct - Nov", "Nov - Dec")),
              GestureDetector(
                  onTap: () {},
                  child:
                      longBox(2, "July - Aug", "Aug - Sep", "Oct - Nov")),
              GestureDetector(
                  onTap: () {}, child: longBox(3, "Nov - Feb", "Mid- Feb", "Mar - Jun")),
              GestureDetector(
                  onTap: () {}, child: longBox(4, "Jun - Jul", "Aug - Sept", "Oct - Jan")),
            ],
          ))
        ],
      ),
    );
  }

  Widget longBox(int index, String seeddata, String seedling, String harvest) {
    List<Product> products = Product.product;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      //padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 120,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: Image.asset(
                  products[index].image,
                  width: 100,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      products[index].title,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Sowing Time       -  ',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          seeddata,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Plant seedlings   -  ',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          seedling,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Harvest Crops     -  ',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          harvest,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
