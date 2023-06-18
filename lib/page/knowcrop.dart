//KNOW YOUR CROPS PAGE

import 'package:b_green/model_n/cropmodel.dart';
import 'package:b_green/page/cropdetail.dart';
import 'package:flutter/material.dart';


class Crop extends StatefulWidget {
  const Crop({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CropState createState() => _CropState();
}

class _CropState extends State<Crop> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Product.product;
    return Scaffold(
      backgroundColor: Colors.white, // Color.fromARGB(255, 40, 49, 27),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 85, 139, 47),
        title: const Text(
          "Be Green",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 5,
        //the icon ends here
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        //color: Colors.blue,
        //margin: const EdgeInsets.only(top: 18, left: 14, right: 14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    ' Know Your Crops',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              //Icon(Icons.shopping_cart_rounded,size: 30,)
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          //  const SizedBox(height: 24,),
          Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //maxCrossAxisExtent: 200,
                      mainAxisExtent: 120,
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              id: products[index].id,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: const Color.fromARGB(255, 85, 139, 47),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(153, 85, 139, 47),
                                  blurRadius: 5,
                                  offset: Offset(0, 5))
                            ]),
                        child: Column(children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0)),
                            child: Image.asset(
                              products[index].image,
                              height: 90,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(products[index].title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          )
                        ]),
                      ),
                    );
                  })),
          /*child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  // itemCount: _product.length,
                  //itemBuilder: (BuildContext context, int index) {
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              product: _product[index],
                            ),
                          ),
                        );
                      },
                      child: _productItem(
                        title: _product[index].title,
                        image: _product[index].image,
                        price: _product[index].price.toString(),
                        isFavorited: Random().nextBool(),
                      ),
                    ),
                  ]
                  //staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                  //mainAxisSpacing: 24,
                  //crossAxisSpacing: 24,
                  ),*/
        ]),
      ),
    );
  }

 
}
