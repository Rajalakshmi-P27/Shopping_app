// ignore_for_file: unused_label

import 'package:flutter/material.dart';
import 'package:shop_app/cart_page.dart';

import 'package:shop_app/product_list.dart';

/* when user click on particular shoe then its product details should be shown
   so use navigation concept on home page 
   
   1. wrap productcard with gesturedetector and put on tap to it
   2. return product details page on tap () using navigator. so that it will return 
   the product details on clicking on it.
   
 */

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // currentpage here represents bottom navigator. homeicon is at index 0 and cart at 1.
  int currentPage = 0;

  //create a list that has product list(homepage) and cart
  List<Widget> pages = [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // created a separate file to store it for code comptability.
      /* if you click on home icon (currentpage =0) then display product list
        if you click cart icon then display cart page */

      // body: currentPagace == 0 ? ProductList() : CartPage(),

      // Indexstack is used.
      /* for eg., if you are seeing the shoes that is displayed on
            last and suddenly you click on cart icon and back to home 
            screen will display at shoe which you saw at last 
          */

      body: IndexedStack(
        index: currentPage,
        children: pages, // children needs list and pages has list
      ),

      // For bottom navigation.
      // ignore: dead_code
      bottomNavigationBar: BottomNavigationBar(

          // Set icon size.
          iconSize: 36,
          // Change selected and unselected icon colors
          selectedItemColor: Color.fromRGBO(
              254, 206, 1, 1), // Color for the tapped (selected) icon
          unselectedItemColor:
              Colors.grey, // Color for the non-tapped (unselected) icons
          backgroundColor:
              Colors.white, // Background color of the BottomNavigationBar

          // on tap used here so that it will rebuild code and execute above condition.
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          currentIndex: currentPage,
          items: const [
            // for home icon
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label:
                  '', // since no need label, we mentioned "", Without label output won't come.
            ),

            // for cart icon
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: '',
            ),
          ]),
    );
  }
}
