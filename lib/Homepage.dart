// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Product_list.dart';
import 'package:flutter_application_1/cart_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;
  List<Widget> pages = const [
    ProductList(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //pages[currentIndex], // We should use index stack for this to maintain the state of the homepage
      // jitna scroll kia hai utna rakhne ke liye it wont reset
      body: IndexedStack(  // VVVVIMP
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          
          BottomNavigationBarItem(
            
            icon: Icon(Icons.home),
            label: "",
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "",
          )
        ],
      ),
    );
  }
}
