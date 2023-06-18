//Not Added becoz favorites not working

import 'package:b_green/model_n/cropmodel.dart';
import 'package:b_green/page/cropdetail.dart';
import 'package:flutter/material.dart';
//import 'package:mine/model/cropmodel.dart';


class FavoritePage extends StatefulWidget {
  final List<Product> favoritedPlants;
  const FavoritePage({Key? key, required this.favoritedPlants})
      : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
   // List<Product> productss = Product.product;
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 85, 139, 47),
          title: const Text(
            "Favorite Crops",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: widget.favoritedPlants.isEmpty
            ? Container(
                color: Colors.white,
                /*child: ListView.builder(
                  itemCount: widget.favoritedPlants.length,
                  //scrollDirection: Axis.vertical,
                  //physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    //return CropWidget(index: index,products: widget.favoritedPlants,);
                    
                  },
                  /*  padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                height: size.height * .5,
                child: ListView.builder(
                    itemCount: widget.favoritedPlants.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      //return const Crop();
                      //return CropWidget(index: index, products: widget.favoritedPlants);
                    }),*/
                )*/
              )
            : Container(
                color: Colors.red,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: widget.favoritedPlants.length,
                  itemBuilder: (BuildContext context, int index) =>
                      const ListTile(
                    title: Text('HELLO'),
                  ),
                ),
              ) /*Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 100,
                      child: Icon(Icons.favorite_border),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Your favorited Plants',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              )
              */
        );
  }
}

class CropWidget extends StatelessWidget {
  const CropWidget({
    Key? key,
    required this.index,
    required this.products,
  }) : super(key: key);

  final int index;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
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
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80.0,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80.0,
                    child: Image.asset(products[index].image),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(products[index].title),
                      Text(
                        products[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            /*  Container(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                r'$' + products[index].price.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.red,
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
