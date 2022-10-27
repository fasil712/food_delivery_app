import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/utilities/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List pages = [
    MainFoodPage(),
    Container(
      child: Center(
        child: Text("Next page"),
      ),
    ),
    Container(
      child: Center(
        child: Text("Next next page"),
      ),
    ),
    Container(
      child: Center(
        child: Text("Next next nextpage"),
      ),
    )
  ];

  void onTapNav(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.amberAccent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          currentIndex: selectedIndex,
          onTap: onTapNav,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined)),
            BottomNavigationBarItem(icon: Icon(Icons.archive_outlined)),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined)),
            BottomNavigationBarItem(icon: Icon(Icons.person_outlined))
          ]),
    );
  }
}
