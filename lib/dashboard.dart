import 'package:e_commerce/account.dart';
import 'package:e_commerce/history.dart';
import 'package:e_commerce/home.dart';
import 'package:e_commerce/wishlist.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentPage = 0;
  void navigateBottomBar(index){
    setState(() {
      currentPage = index;
    });
  }
  final List<Widget> pages = [
    const Home(),
    const WishList(),
    const History(),
    const Account(),

  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar:
      ClipRRect(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(16),topLeft:Radius.circular(16)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          //backgroundColor: Colors.purpleAccent[100],
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: navigateBottomBar,
          currentIndex: currentPage,
          elevation: 4,
          items:   [
            BottomNavigationBarItem(icon: Icon(Icons.home,size:screenWidth * 0.06,),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border,size:screenWidth * 0.06),
                label: 'Wishlist'),
            BottomNavigationBarItem(icon: Icon(Icons.note_add,size:screenWidth * 0.06),
                label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.person,size:screenWidth * 0.06),
                label: 'Account')
          ],
        ),
      ),
    );
  }
}

