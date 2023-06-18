import 'package:b_green/page/noneed/old_homepage.dart';
import 'package:flutter/material.dart';


//import 'package:ui_13/core/color.dart';
//import 'package:begreen/page/home_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController pageController = PageController();
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: child.length,
        controller: pageController,
        onPageChanged: (value) => setState(() => selectIndex = value),
        itemBuilder: (itemBuilder, index) {
          return Container(
            child: child[index],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; bottomMenu.length > i; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      //pageController.jumpToPage(i);
                      //selectIndex = i;
                    });
                  },
                  child: Image.asset(
                    bottomMenu[i].imagePath,
                    color: selectIndex == i
                        ? Colors.green
                        : Colors.grey.withOpacity(0.5),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
class BottomMenu {
  final int id;
  final String imagePath;

  BottomMenu(this.id, this.imagePath);
}

List<BottomMenu> bottomMenu = [
  BottomMenu(0, 'assets/icons/home.png'),
  BottomMenu(1, 'assets/icons/heart.png'),
  BottomMenu(2, 'assets/icons/cart.png'),
  BottomMenu(3, 'assets/icons/settings.png'),
];
List<Widget> child = [
  const HomePage(),
  Container(color: Colors.white),
  Container(color: Colors.white),
  Container(color: Colors.white),
];
